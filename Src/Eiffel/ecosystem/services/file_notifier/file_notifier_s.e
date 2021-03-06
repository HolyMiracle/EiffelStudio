note
	description: "[
		Service interface for working with files and recieving notification regarding changes to those files.
		
		Note: Unfortunatly this service cannot provide "live" monitored support currently because Unix does not
		      provide file system event monitoring. As such `check_modifications' should be called when a check
		      needs to be made. Prior to the call ensure clients wanting notification have subscribed to the 
		      `file_modified_events' events.
		      
		      Please be sure to also call `uncheck_modifications' to release a monitor on the file when a monitor is no longer needed.
	]"
	doc: "wiki://File Notifier Service"
	legal: "See notice at end of class."
	status: "See notice at end of class.";
	date: "$Date$";
	revision: "$Revision$"

deferred class
	FILE_NOTIFIER_S

inherit
	SERVICE_I

	EVENT_CONNECTION_POINT_I [FILE_NOTIFIER_EVENT_OBSERVER, FILE_NOTIFIER_S]
		rename
			connection as file_notifier_connection
		end

feature -- Query

	is_valid_file_name (a_file_name: PATH): BOOLEAN
			-- Determines if a file name is valid
		require
			is_interface_usable: is_interface_usable
			attached_a_file_name: attached a_file_name
		do
			Result := not a_file_name.is_empty
		ensure
			not_a_file_name_is_empty: Result implies not a_file_name.is_empty
		end

	is_monitoring (a_file_name: PATH): BOOLEAN
			-- Determines if a file is being monitored.
			--
			-- `a_file_name': The file name to determine if change notifications are being published for.
			-- `Result': True if the file is being monitored, False otherwise.
		require
			is_interface_usable: is_interface_usable
			a_file_name_is_valid_file_name: is_valid_file_name (a_file_name)
		deferred
		end

feature -- Basic operations

	check_modifications (a_file_name: PATH)
			-- Checks a file for any modifications.
			-- Note: This must be called everytime a client wants to determine if a file has changed. The appropriate modification
			--       event will be fired based on the file state. There is no real automatic solution because of the last of file
			--       system event notifications on Unix.
			--
			--       Be sure to call `uncheck_modifications' when notification is no longer needed.
			--
			--       To perform update checks use `poll_modifications'.
			--
			-- `a_file_name': The file to check for modifications.
		require
			is_interface_usable: is_interface_usable
			attached_a_file_name: attached a_file_name
			a_file_name_is_valid_file_name: is_valid_file_name (a_file_name)
		deferred
		ensure
			is_monitoring_a_file_name: is_monitoring (a_file_name)
		end

	check_modifications_with_callback (a_file_name: PATH; a_callback: PROCEDURE [TUPLE [modification_type: NATURAL_8]])
			-- Checks a file for any modifications.
			-- Note: This must be called everytime a client wants to determine if a file has changed. The appropriate modification
			--       event will be fired based on the file state. There is no real automatic solution because of the last of file
			--       system event notifications on Unix.
			--
			--       Be sure to call `uncheck_modifications_with_callback' when notification is no longer needed.
			--
			--       To perform update checks use `poll_modifications'.
			--
			-- `a_file_name': The full path to the file to check for modifications.
			-- `a_callback': The agent to call back when the file is modified.
		require
			is_interface_usable: is_interface_usable
			attached_a_file_name: attached a_file_name
			a_file_name_is_valid_file_name: is_valid_file_name (a_file_name)
			a_callback_attached: a_callback /= Void
		deferred
		ensure
			is_monitoring_a_file_name: is_monitoring (a_file_name)
		end

	uncheck_modifications (a_file_name: PATH)
			-- Indicates to the service that the file no longer needs to be monitored.
			-- Note: Unchecking a file does not necessarly mean that it is no longer monitored. Other parts of the
			--       system could be moniroting the same file. However, it is somewhat important that for every check call
			--       there is a corresponding uncheck call.
			--
			-- `a_file_name': The full path to the file to remove modifications checks for.
		require
			is_interface_usable: is_interface_usable
			attached_a_file_name: attached a_file_name
			is_monitoring_a_file_name: is_monitoring (a_file_name)
		deferred
		end

	uncheck_modifications_with_callback (a_file_name: PATH; a_callback: PROCEDURE [TUPLE [modification_type: NATURAL_8]])
			-- Indicates to the service that the file no longer needs to be monitored.
			-- Note: Unchecking a file does not necessarly mean that it is no longer monitored. Other parts of the
			--       system could be moniroting the same file. However, it is (very* important that for every check call
			--       there is a corresponding uncheck call or the actions will be called even after an action handler's
			--       has no use for the notifications. In addition a lingering agent will cause memory leaks.
			--
			-- `a_file_name': The full path to the file to remove modifications checks for.
			-- `a_callback': The agent that was use to call back when the file is modified.
		require
			is_interface_usable: is_interface_usable
			attached_a_file_name: attached a_file_name
			a_file_name_is_valid_file_name: is_valid_file_name (a_file_name)
			a_callback_attached: a_callback /= Void
		deferred
		end

	poll_modifications (a_file_name: PATH): NATURAL_8
			-- Polls the modification state of a file and returns the modified state.
			-- Note: Calling this will also update any monitors.
			--
			-- `a_file_name': The file name to determine if change notifications are being published for.
			-- `Result': The type of modification applied to the file. See {FILE_NOTIFIER_MODIFICATION_TYPES} for the respective flags
		require
			is_interface_usable: is_interface_usable
			attached_a_file_name: attached a_file_name
			a_file_name_is_valid_file_name: is_valid_file_name (a_file_name)
		deferred
		end

feature -- Events

	file_modified_events: EVENT_TYPE [TUPLE [file_name: PATH; modification_type: NATURAL_8]]
			-- Events fired after check a file and discovering there have been modifications.
			--
			-- `file_name': The name of the file modified.
			-- `modification_type': The type of modification applied to the file. See {FILE_NOTIFIER_MODIFICATION_TYPES} for the respective flags
		require
			is_interface_usable: is_interface_usable
		deferred
		ensure
			result_attached: attached Result
		end

feature -- Events: Connection point

	file_notifier_connection: EVENT_CONNECTION_I [FILE_NOTIFIER_EVENT_OBSERVER, FILE_NOTIFIER_S]
			-- <Precursor>
		local
			l_result: like internal_file_notifier_connection
		do
			l_result := internal_file_notifier_connection
			if l_result = Void then
				create {EVENT_CONNECTION [FILE_NOTIFIER_EVENT_OBSERVER, FILE_NOTIFIER_S]} Result.make (
					agent (ia_observer: FILE_NOTIFIER_EVENT_OBSERVER): ARRAY [TUPLE [event: EVENT_TYPE [TUPLE]; action: PROCEDURE]]
						do
							Result := << [file_modified_events, agent ia_observer.on_file_modified] >>
						end)
				automation.auto_dispose (Result)
				internal_file_notifier_connection := Result
			else
				Result := l_result
			end
		end

feature {NONE} -- Implementation: Internal cache

	internal_file_notifier_connection: detachable like file_notifier_connection
			-- Cached version of `file_notifier_connection'.
			-- Note: Do not use directly!

;note
	copyright:	"Copyright (c) 1984-2013, Eiffel Software"
	license:	"GPL version 2 (see http://www.eiffel.com/licensing/gpl.txt)"
	licensing_options:	"http://www.eiffel.com/licensing"
	copying: "[
			This file is part of Eiffel Software's Eiffel Development Environment.
			
			Eiffel Software's Eiffel Development Environment is free
			software; you can redistribute it and/or modify it under
			the terms of the GNU General Public License as published
			by the Free Software Foundation, version 2 of the License
			(available at the URL listed under "license" above).
			
			Eiffel Software's Eiffel Development Environment is
			distributed in the hope that it will be useful, but
			WITHOUT ANY WARRANTY; without even the implied warranty
			of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
			See the GNU General Public License for more details.
			
			You should have received a copy of the GNU General Public
			License along with Eiffel Software's Eiffel Development
			Environment; if not, write to the Free Software Foundation,
			Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA
		]"
	source: "[
			Eiffel Software
			5949 Hollister Ave., Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Website http://www.eiffel.com
			Customer support http://support.eiffel.com
		]"

end
