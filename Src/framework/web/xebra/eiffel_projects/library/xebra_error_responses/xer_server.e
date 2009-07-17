note
	description: "[
		Represents X_RESPONSES that are generated by a Xebra Server
	]"
	legal: "See notice at end of class."
	status: "Pre-release"
	date: "$Date$"
	revision: "$Revision$"

deferred class
	XER_SERVER

feature -- Access

	producer: STRING
			-- The producer of the response
		do
			Result := "Xebra Server "
		end
end
