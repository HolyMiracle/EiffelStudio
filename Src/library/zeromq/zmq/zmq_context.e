note
	description: "[
		An �MQ Context where �MQ sockets live within.

		Each �MQ socket  lives  within  a  specific  context.  Creating  and
		destroying context is a counterpart of library
		initialisation/deinitialisation as used elsewhere. Ability to create
		multiple  contexts saves  the  day  when an application happens to
		link (indirectly and involuntarily) with several instances of �MQ.

		Implementation notes: the fact that �MQ can work in a threaded
		enviroment is currently hidden by this Liberty wrappers

		TODO: add support for pollability (ZMQ_POLL)
		]"
	status: "See notice at end of class."
	legal: "See notice at end of class."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ZMQ_CONTEXT

inherit
	WRAPPER_BASE
		rename
			make as make_base
		end

create
	make

feature {NONE} -- Creation

	make
			-- Context creation for non in-process communication.
		do
			make_base ({ZMQ_API}.zmq_ctx_new)
		end

feature -- Status report

	exists: BOOLEAN
			-- Is current properly initialized?
		do
			Result := item /= default_pointer
		end

	number_of_io_threads: INTEGER
			-- Number of I/O threads in the ZMQ thread pool.
		require
			exists: exists
		do
			Result := {ZMQ_API}.zmq_ctx_get (item, {ZMQ_CONSTANTS}.zmq_io_threads)
			check always_success: Result /= -1 end
		ensure
			number_of_io_threads_non_negative: Result >= 0
		end

	maximum_number_of_sockets: INTEGER
			-- Maximum number of sockets allowed in current context.
		require
			exists: exists
		do
			Result := {ZMQ_API}.zmq_ctx_get (item, {ZMQ_CONSTANTS}.zmq_max_sockets)
			check always_success: Result /= -1 end
		ensure
			maximum_number_of_sockets_positive: Result > 0
		end

feature -- Element change

	set_number_of_io_threads (v: INTEGER)
			-- Set `number_of_io_threads' with `v'.
		require
			v_non_negative: v >= 0
		local
			res: INTEGER
		do
			res := {ZMQ_API}.zmq_ctx_set (item, {ZMQ_CONSTANTS}.zmq_io_threads, v)
			check always_success: res /= -1 end
		ensure
			number_of_io_threads_set: number_of_io_threads = v
		end

	set_maximum_number_of_sockets (v: INTEGER)
			-- Set `maximum_number_of_sockets' with `v'.
		require
			v_positive: v > 0
		local
			res: INTEGER
		do
			res := {ZMQ_API}.zmq_ctx_set (item, {ZMQ_CONSTANTS}.zmq_max_sockets, v)
			check always_success: res /= -1 end
		ensure
			maximum_number_of_sockets_set: maximum_number_of_sockets = v
		end

feature {NONE} -- Implementation

	dispose
			-- <Precursor>
		local
			l_done: BOOLEAN
		do
			from
				l_done := item = default_pointer
			until
				l_done
			loop
				l_done := {ZMQ_API}.zmq_ctx_destroy (item) = 0
				if not l_done then
						 -- Only retry if we were interrupted.
					l_done := {ZMQ_API}.errno /= {ZMQ_ERROR_CODES}.eintr
				end
			end
			item := default_pointer
		end

feature {ANY} -- Socket creations

	new_p2p_socket: ZMQ_SOCKET
			-- A new P2P socket  to  communicate with a single peer. Allows for only a single connect or a single bind. There's no  message  routing or message filtering involved.

			-- Compatible peer sockets: ZMQ_P2P.
		require
			exists: exists
		do
			create Result.make ({ZMQ_API}.zmq_socket (item, {ZMQ_CONSTANTS}.zmq_pair))
		end

	new_pub_socket: ZMQ_SOCKET
			--   ZMQ_PUB
			--          Socket  to  distribute  data. Recv fuction is not implemented
			--          for this socket type.  Messages  are  distributed  in  fanout
			--          fashion to all the peers.

			--          Compatible peer sockets: ZMQ_SUB.
		require
			exists: exists
		do
			create Result.make ({ZMQ_API}.zmq_socket (item, {ZMQ_CONSTANTS}.zmq_pub))
		end

	new_sub_socket: ZMQ_SOCKET
			-- ZMQ_SUB
			-- Socket to subscribe for data. Send function is not imple 
			-- mented for this socket type. Initially, socket is subscribed
			-- for no messages. Use ZMQ_SUBSCRIBE option to specify which
			-- messages to subscribe for.

			-- Compatible peer sockets: ZMQ_PUB.
		require
			exists: exists
		do
			create Result.make ({ZMQ_API}.zmq_socket (item, {ZMQ_CONSTANTS}.zmq_sub))
		end

	new_req_socket: ZMQ_SOCKET
			-- A new socket to send requests and receive replies. Requests are
			-- load-balanced  among  all  the peers. This socket type allows
			-- only an alternated sequence of send's and recv's.

			--          Compatible peer sockets: ZMQ_REP, ZMQ_XREP.
		require
			exists: exists
		do
			create Result.make ({ZMQ_API}.zmq_socket (item, {ZMQ_CONSTANTS}.zmq_req))
		end

	new_rep_socket: ZMQ_SOCKET
			-- A new socket to receive requests and send replies. This socket type
			-- allows only an alternated sequence of recv's and send's. Each send
			-- is routed to the peer  that  issued  the  last  received request.

			-- Compatible peer sockets: ZMQ_REQ, ZMQ_XREQ.
		require
			exists: exists
		do
			create Result.make ({ZMQ_API}.zmq_socket (item, {ZMQ_CONSTANTS}.zmq_rep))
		end

		--   ZMQ_XREQ
		--          Special  socket  type to be used in request/reply middleboxes
		--          such as zmq_queue(7).  Requests forwarded using  this  socket
		--          type  should  be  tagged  by  a proper postix identifying the
		--          original requester.  Replies  received  by  this  socket  are
		--          tagged  with  a  proper  postfix that can be use to route the
		--          reply back to the original requester.

		--          Compatible peer sockets: ZMQ_REP, ZMQ_XREP.

		--   ZMQ_XREP
		--          Special socket type to be used in  request/reply  middleboxes
		--          such  as  zmq_queue(7).   Requests received using this socket
		--          are already properly  tagged  with  postfix  identifying  the
		--          original  requester. When sending a reply via XREP socket the
		--          message should be tagged with a postfix from a  corresponding
		--          request.

		--          Compatible peer sockets: ZMQ_REQ, ZMQ_XREQ.

		--   ZMQ_UPSTREAM
		--          Socket  to  receive messages from up the stream. Messages are
		--          fair-queued from among all the connected peers. Send function
		--          is not implemented for this socket type.

		--          Compatible peer sockets: ZMQ_DOWNSTREAM.

		--   ZMQ_DOWNSTREAM
		--          Socket  to  send messages down stream. Messages are load-bal 
		--          anced among all the connected peers.  Send  function  is  not
		--          implemented for this socket type.

		--          Compatible peer sockets: ZMQ_UPSTREAM.

		-- zmq_socket RETURN VALUE
		--       Function  returns  socket handle is successful. Otherwise it returns
		--       NULL and sets errno to one of the values below.
		--
		--ERRORS
		--       EINVAL invalid socket type.
		--
		--       EMTHREAD
		--              the number of application threads allowed to own 0MQ  sockets
		--              was exceeded. See app_threads parameter to zmq_init function.

note
	copyright: "Copyright (c) 1984-2013, Eiffel Software and others"
	license:   "Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			Eiffel Software
			5949 Hollister Ave., Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Website http://www.eiffel.com
			Customer support http://support.eiffel.com
		]"

end
