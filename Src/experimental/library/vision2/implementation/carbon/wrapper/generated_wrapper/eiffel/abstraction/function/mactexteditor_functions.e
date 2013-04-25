-- This file has been generated by EWG. Do not edit. Changes will be lost!
-- functions wrapper
class MACTEXTEDITOR_FUNCTIONS

obsolete
	"Use class MACTEXTEDITOR_FUNCTIONS_EXTERNAL instead."

inherit

	MACTEXTEDITOR_FUNCTIONS_EXTERNAL

feature
	new_txnfind_upp (userroutine: POINTER): POINTER is
		local
		do
			Result := new_txnfind_upp_external (userroutine)
		end

	new_txnaction_name_mapper_upp (userroutine: POINTER): POINTER is
		local
		do
			Result := new_txnaction_name_mapper_upp_external (userroutine)
		end

	new_txncontextual_menu_setup_upp (userroutine: POINTER): POINTER is
		local
		do
			Result := new_txncontextual_menu_setup_upp_external (userroutine)
		end

	new_txnscroll_info_upp (userroutine: POINTER): POINTER is
		local
		do
			Result := new_txnscroll_info_upp_external (userroutine)
		end

	dispose_txnfind_upp (userupp: POINTER) is
		local
		do
			dispose_txnfind_upp_external (userupp)
		end

	dispose_txnaction_name_mapper_upp (userupp: POINTER) is
		local
		do
			dispose_txnaction_name_mapper_upp_external (userupp)
		end

	dispose_txncontextual_menu_setup_upp (userupp: POINTER) is
		local
		do
			dispose_txncontextual_menu_setup_upp_external (userupp)
		end

	dispose_txnscroll_info_upp (userupp: POINTER) is
		local
		do
			dispose_txnscroll_info_upp_external (userupp)
		end

	invoke_txnfind_upp (matchdata: POINTER; idatatype: INTEGER; imatchoptions: INTEGER; isearchtextptr: POINTER; encoding: INTEGER; absstartoffset: INTEGER; searchtextlength: INTEGER; ostartmatch: POINTER; oendmatch: POINTER; ofound: STRING; refcon: INTEGER; userupp: POINTER): INTEGER is
		local
			ofound_c_string: EWG_ZERO_TERMINATED_STRING
		do
			create ofound_c_string.make_shared_from_string (ofound)
			Result := invoke_txnfind_upp_external (matchdata, idatatype, imatchoptions, isearchtextptr, encoding, absstartoffset, searchtextlength, ostartmatch, oendmatch, ofound_c_string.item, refcon, userupp)
		end

	invoke_txnaction_name_mapper_upp (actionname: POINTER; commandid: INTEGER; inuserdata: POINTER; userupp: POINTER): POINTER is
		local
		do
			Result := invoke_txnaction_name_mapper_upp_external (actionname, commandid, inuserdata, userupp)
		end

	invoke_txncontextual_menu_setup_upp (icontextualmenu: POINTER; object: POINTER; inuserdata: POINTER; userupp: POINTER) is
		local
		do
			invoke_txncontextual_menu_setup_upp_external (icontextualmenu, object, inuserdata, userupp)
		end

	invoke_txnscroll_info_upp (ivalue: INTEGER; imaximumvalue: INTEGER; iscrollbarorientation: INTEGER; irefcon: INTEGER; userupp: POINTER) is
		local
		do
			invoke_txnscroll_info_upp_external (ivalue, imaximumvalue, iscrollbarorientation, irefcon, userupp)
		end

	txncreate_object (iframerect: POINTER; iframeoptions: INTEGER; otxnobject: POINTER): INTEGER is
		local
		do
			Result := txncreate_object_external (iframerect, iframeoptions, otxnobject)
		end

	txndelete_object (itxnobject: POINTER) is
		local
		do
			txndelete_object_external (itxnobject)
		end

	txninit_textension (idefaultfonts: POINTER; icountdefaultfonts: INTEGER; iusageflags: INTEGER): INTEGER is
		local
		do
			Result := txninit_textension_external (idefaultfonts, icountdefaultfonts, iusageflags)
		end

	txnversion_information (ofeatureflags: POINTER): INTEGER is
		local
		do
			Result := txnversion_information_external (ofeatureflags)
		end

	txnattach_object_to_window_ref (itxnobject: POINTER; iwindowref: POINTER): INTEGER is
		local
		do
			Result := txnattach_object_to_window_ref_external (itxnobject, iwindowref)
		end

	txnget_window_ref (itxnobject: POINTER): POINTER is
		local
		do
			Result := txnget_window_ref_external (itxnobject)
		end

	txnkey_down (itxnobject: POINTER; ievent: POINTER) is
		local
		do
			txnkey_down_external (itxnobject, ievent)
		end

	txnadjust_cursor (itxnobject: POINTER; iocursorrgn: POINTER) is
		local
		do
			txnadjust_cursor_external (itxnobject, iocursorrgn)
		end

	txnclick (itxnobject: POINTER; ievent: POINTER) is
		local
		do
			txnclick_external (itxnobject, ievent)
		end

	txnselect_all (itxnobject: POINTER) is
		local
		do
			txnselect_all_external (itxnobject)
		end

	txnfocus (itxnobject: POINTER; ibecomingfocused: INTEGER) is
		local
		do
			txnfocus_external (itxnobject, ibecomingfocused)
		end

	txnupdate (itxnobject: POINTER) is
		local
		do
			txnupdate_external (itxnobject)
		end

	txndraw_object (itxnobject: POINTER; icliprect: POINTER; idrawitems: INTEGER): INTEGER is
		local
		do
			Result := txndraw_object_external (itxnobject, icliprect, idrawitems)
		end

	txnforce_update (itxnobject: POINTER) is
		local
		do
			txnforce_update_external (itxnobject)
		end

	txnget_sleep_ticks (itxnobject: POINTER): INTEGER is
		local
		do
			Result := txnget_sleep_ticks_external (itxnobject)
		end

	txnidle (itxnobject: POINTER) is
		local
		do
			txnidle_external (itxnobject)
		end

	txngrow_window (itxnobject: POINTER; ievent: POINTER) is
		local
		do
			txngrow_window_external (itxnobject, ievent)
		end

	txnzoom_window (itxnobject: POINTER; ipart: INTEGER) is
		local
		do
			txnzoom_window_external (itxnobject, ipart)
		end

	txnbegin_action_group (itxnobject: POINTER; iactiongroupname: POINTER): INTEGER is
		local
		do
			Result := txnbegin_action_group_external (itxnobject, iactiongroupname)
		end

	txnend_action_group (itxnobject: POINTER): INTEGER is
		local
		do
			Result := txnend_action_group_external (itxnobject)
		end

	txncan_undo_action (itxnobject: POINTER; oactionname: POINTER): INTEGER is
		local
		do
			Result := txncan_undo_action_external (itxnobject, oactionname)
		end

	txncan_redo_action (itxnobject: POINTER; oactionname: POINTER): INTEGER is
		local
		do
			Result := txncan_redo_action_external (itxnobject, oactionname)
		end

	txnset_action_name_mapper (itxnobject: POINTER; istringforkeyproc: POINTER; iuserdata: POINTER): INTEGER is
		local
		do
			Result := txnset_action_name_mapper_external (itxnobject, istringforkeyproc, iuserdata)
		end

	txnundo (itxnobject: POINTER) is
		local
		do
			txnundo_external (itxnobject)
		end

	txnredo (itxnobject: POINTER) is
		local
		do
			txnredo_external (itxnobject)
		end

	txnclear_undo (itxnobject: POINTER): INTEGER is
		local
		do
			Result := txnclear_undo_external (itxnobject)
		end

	txncut (itxnobject: POINTER): INTEGER is
		local
		do
			Result := txncut_external (itxnobject)
		end

	txncopy (itxnobject: POINTER): INTEGER is
		local
		do
			Result := txncopy_external (itxnobject)
		end

	txnpaste (itxnobject: POINTER): INTEGER is
		local
		do
			Result := txnpaste_external (itxnobject)
		end

	txnclear (itxnobject: POINTER): INTEGER is
		local
		do
			Result := txnclear_external (itxnobject)
		end

	txnis_scrap_pastable: INTEGER is
		local
		do
			Result := txnis_scrap_pastable_external
		end

	txnget_selection (itxnobject: POINTER; ostartoffset: POINTER; oendoffset: POINTER) is
		local
		do
			txnget_selection_external (itxnobject, ostartoffset, oendoffset)
		end

	txnshow_selection (itxnobject: POINTER; ishowend: INTEGER) is
		local
		do
			txnshow_selection_external (itxnobject, ishowend)
		end

	txnis_selection_empty (itxnobject: POINTER): INTEGER is
		local
		do
			Result := txnis_selection_empty_external (itxnobject)
		end

	txnset_selection (itxnobject: POINTER; istartoffset: INTEGER; iendoffset: INTEGER): INTEGER is
		local
		do
			Result := txnset_selection_external (itxnobject, istartoffset, iendoffset)
		end

	txnget_continuous_type_attributes (itxnobject: POINTER; ocontinuousflags: POINTER; icount: INTEGER; iotypeattributes: POINTER): INTEGER is
		local
		do
			Result := txnget_continuous_type_attributes_external (itxnobject, ocontinuousflags, icount, iotypeattributes)
		end

	txnset_type_attributes (itxnobject: POINTER; iattrcount: INTEGER; iattributes: POINTER; istartoffset: INTEGER; iendoffset: INTEGER): INTEGER is
		local
		do
			Result := txnset_type_attributes_external (itxnobject, iattrcount, iattributes, istartoffset, iendoffset)
		end

	txnset_txnobject_controls (itxnobject: POINTER; iclearall: INTEGER; icontrolcount: INTEGER; icontroltags: POINTER; icontroldata: POINTER): INTEGER is
		local
		do
			Result := txnset_txnobject_controls_external (itxnobject, iclearall, icontrolcount, icontroltags, icontroldata)
		end

	txnget_txnobject_controls (itxnobject: POINTER; icontrolcount: INTEGER; icontroltags: POINTER; ocontroldata: POINTER): INTEGER is
		local
		do
			Result := txnget_txnobject_controls_external (itxnobject, icontrolcount, icontroltags, ocontroldata)
		end

	txnset_background (itxnobject: POINTER; ibackgroundinfo: POINTER): INTEGER is
		local
		do
			Result := txnset_background_external (itxnobject, ibackgroundinfo)
		end

	txnecho_mode (itxnobject: POINTER; iechocharacter: INTEGER; iencoding: INTEGER; ion: INTEGER): INTEGER is
		local
		do
			Result := txnecho_mode_external (itxnobject, iechocharacter, iencoding, ion)
		end

	txncount_runs_in_range (itxnobject: POINTER; istartoffset: INTEGER; iendoffset: INTEGER; oruncount: POINTER): INTEGER is
		local
		do
			Result := txncount_runs_in_range_external (itxnobject, istartoffset, iendoffset, oruncount)
		end

	txnget_indexed_run_info_from_range (itxnobject: POINTER; iindex: INTEGER; istartoffset: INTEGER; iendoffset: INTEGER; orunstartoffset: POINTER; orunendoffset: POINTER; orundatatype: POINTER; itypeattributecount: INTEGER; iotypeattributes: POINTER): INTEGER is
		local
		do
			Result := txnget_indexed_run_info_from_range_external (itxnobject, iindex, istartoffset, iendoffset, orunstartoffset, orunendoffset, orundatatype, itypeattributecount, iotypeattributes)
		end

	txndata_size (itxnobject: POINTER): INTEGER is
		local
		do
			Result := txndata_size_external (itxnobject)
		end

	txnwrite_range_to_cfurl (itxnobject: POINTER; istartoffset: INTEGER; iendoffset: INTEGER; idataoptions: POINTER; idocumentattributes: POINTER; ifileurl: POINTER): INTEGER is
		local
		do
			Result := txnwrite_range_to_cfurl_external (itxnobject, istartoffset, iendoffset, idataoptions, idocumentattributes, ifileurl)
		end

	txnread_from_cfurl (itxnobject: POINTER; istartoffset: INTEGER; iendoffset: INTEGER; idataoptions: POINTER; ifileurl: POINTER; odocumentattributes: POINTER): INTEGER is
		local
		do
			Result := txnread_from_cfurl_external (itxnobject, istartoffset, iendoffset, idataoptions, ifileurl, odocumentattributes)
		end

	txncopy_type_identifiers_for_range (itxnobject: POINTER; istartoffset: INTEGER; iendoffset: INTEGER; otypeidentifiersforrange: POINTER): INTEGER is
		local
		do
			Result := txncopy_type_identifiers_for_range_external (itxnobject, istartoffset, iendoffset, otypeidentifiersforrange)
		end

	txnget_data (itxnobject: POINTER; istartoffset: INTEGER; iendoffset: INTEGER; odatahandle: POINTER): INTEGER is
		local
		do
			Result := txnget_data_external (itxnobject, istartoffset, iendoffset, odatahandle)
		end

	txnget_data_encoded (itxnobject: POINTER; istartoffset: INTEGER; iendoffset: INTEGER; odatahandle: POINTER; iencoding: INTEGER): INTEGER is
		local
		do
			Result := txnget_data_encoded_external (itxnobject, istartoffset, iendoffset, odatahandle, iencoding)
		end

	txnset_data (itxnobject: POINTER; idatatype: INTEGER; idataptr: POINTER; idatasize: INTEGER; istartoffset: INTEGER; iendoffset: INTEGER): INTEGER is
		local
		do
			Result := txnset_data_external (itxnobject, idatatype, idataptr, idatasize, istartoffset, iendoffset)
		end

	txnflatten_object_to_cfdata_ref (itxnobject: POINTER; itxndatatype: INTEGER; odataref: POINTER): INTEGER is
		local
		do
			Result := txnflatten_object_to_cfdata_ref_external (itxnobject, itxndatatype, odataref)
		end

	txnrevert (itxnobject: POINTER): INTEGER is
		local
		do
			Result := txnrevert_external (itxnobject)
		end

	txnpage_setup (itxnobject: POINTER): INTEGER is
		local
		do
			Result := txnpage_setup_external (itxnobject)
		end

	txnprint (itxnobject: POINTER): INTEGER is
		local
		do
			Result := txnprint_external (itxnobject)
		end

	txnfind (itxnobject: POINTER; imatchtextdataptr: POINTER; idatatype: INTEGER; imatchoptions: INTEGER; istartsearchoffset: INTEGER; iendsearchoffset: INTEGER; ifindproc: POINTER; irefcon: INTEGER; ostartmatchoffset: POINTER; oendmatchoffset: POINTER): INTEGER is
		local
		do
			Result := txnfind_external (itxnobject, imatchtextdataptr, idatatype, imatchoptions, istartsearchoffset, iendsearchoffset, ifindproc, irefcon, ostartmatchoffset, oendmatchoffset)
		end

	txnset_font_defaults (itxnobject: POINTER; icount: INTEGER; ifontdefaults: POINTER): INTEGER is
		local
		do
			Result := txnset_font_defaults_external (itxnobject, icount, ifontdefaults)
		end

	txnget_font_defaults (itxnobject: POINTER; iocount: POINTER; ofontdefaults: POINTER): INTEGER is
		local
		do
			Result := txnget_font_defaults_external (itxnobject, iocount, ofontdefaults)
		end

	txnnew_font_menu_object (ifontmenuhandle: POINTER; imenuid: INTEGER; istarthiermenuid: INTEGER; otxnfontmenuobject: POINTER): INTEGER is
		local
		do
			Result := txnnew_font_menu_object_external (ifontmenuhandle, imenuid, istarthiermenuid, otxnfontmenuobject)
		end

	txnget_font_menu_handle (itxnfontmenuobject: POINTER; ofontmenuhandle: POINTER): INTEGER is
		local
		do
			Result := txnget_font_menu_handle_external (itxnfontmenuobject, ofontmenuhandle)
		end

	txndispose_font_menu_object (itxnfontmenuobject: POINTER): INTEGER is
		local
		do
			Result := txndispose_font_menu_object_external (itxnfontmenuobject)
		end

	txndo_font_menu_selection (itxnobject: POINTER; itxnfontmenuobject: POINTER; imenuid: INTEGER; imenuitem: INTEGER): INTEGER is
		local
		do
			Result := txndo_font_menu_selection_external (itxnobject, itxnfontmenuobject, imenuid, imenuitem)
		end

	txnprepare_font_menu (itxnobject: POINTER; itxnfontmenuobject: POINTER): INTEGER is
		local
		do
			Result := txnprepare_font_menu_external (itxnobject, itxnfontmenuobject)
		end

	txndraw_unicode_text_box (itext: POINTER; ilen: INTEGER; iobox: POINTER; istyle: POINTER; ioptions: POINTER): INTEGER is
		local
		do
			Result := txndraw_unicode_text_box_external (itext, ilen, iobox, istyle, ioptions)
		end

	txndraw_cfstring_text_box (itext: POINTER; iobox: POINTER; istyle: POINTER; ioptions: POINTER): INTEGER is
		local
		do
			Result := txndraw_cfstring_text_box_external (itext, iobox, istyle, ioptions)
		end

	txnget_line_count (itxnobject: POINTER; olinetotal: POINTER): INTEGER is
		local
		do
			Result := txnget_line_count_external (itxnobject, olinetotal)
		end

	txnget_line_metrics (itxnobject: POINTER; ilinenumber: INTEGER; olinewidth: POINTER; olineheight: POINTER): INTEGER is
		local
		do
			Result := txnget_line_metrics_external (itxnobject, ilinenumber, olinewidth, olineheight)
		end

	txnget_change_count (itxnobject: POINTER): INTEGER is
		local
		do
			Result := txnget_change_count_external (itxnobject)
		end

	txnget_count_for_action_type (itxnobject: POINTER; iactiontypename: POINTER; ocount: POINTER): INTEGER is
		local
		do
			Result := txnget_count_for_action_type_external (itxnobject, iactiontypename, ocount)
		end

	txnclear_count_for_action_type (itxnobject: POINTER; iactiontypename: POINTER): INTEGER is
		local
		do
			Result := txnclear_count_for_action_type_external (itxnobject, iactiontypename)
		end

	txnset_hirect_bounds (itxnobject: POINTER; iviewrect: POINTER; idestinationrect: POINTER; iupdate: INTEGER) is
		local
		do
			txnset_hirect_bounds_external (itxnobject, iviewrect, idestinationrect, iupdate)
		end

	txnget_hirect (itxnobject: POINTER; itxnrectkey: INTEGER; orectangle: POINTER): INTEGER is
		local
		do
			Result := txnget_hirect_external (itxnobject, itxnrectkey, orectangle)
		end

	txnresize_frame (itxnobject: POINTER; iwidth: INTEGER; iheight: INTEGER; itxnframeid: INTEGER) is
		local
		do
			txnresize_frame_external (itxnobject, iwidth, iheight, itxnframeid)
		end

	txnset_frame_bounds (itxnobject: POINTER; itop: INTEGER; ileft: INTEGER; ibottom: INTEGER; iright: INTEGER; itxnframeid: INTEGER) is
		local
		do
			txnset_frame_bounds_external (itxnobject, itop, ileft, ibottom, iright, itxnframeid)
		end

	txnget_view_rect (itxnobject: POINTER; oviewrect: POINTER) is
		local
		do
			txnget_view_rect_external (itxnobject, oviewrect)
		end

	txnrecalc_text_layout (itxnobject: POINTER) is
		local
		do
			txnrecalc_text_layout_external (itxnobject)
		end

	txnscroll (itxnobject: POINTER; iverticalscrollunit: INTEGER; ihorizontalscrollunit: INTEGER; ioverticaldelta: POINTER; iohorizontaldelta: POINTER): INTEGER is
		local
		do
			Result := txnscroll_external (itxnobject, iverticalscrollunit, ihorizontalscrollunit, ioverticaldelta, iohorizontaldelta)
		end

	txnregister_scroll_info_proc (itxnobject: POINTER; itxnscrollinfoupp: POINTER; irefcon: INTEGER) is
		local
		do
			txnregister_scroll_info_proc_external (itxnobject, itxnscrollinfoupp, irefcon)
		end

	txnset_scrollbar_state (itxnobject: POINTER; iactivestate: INTEGER): INTEGER is
		local
		do
			Result := txnset_scrollbar_state_external (itxnobject, iactivestate)
		end

	txnhipoint_to_offset (itxnobject: POINTER; ihipoint: POINTER; ooffset: POINTER): INTEGER is
		local
		do
			Result := txnhipoint_to_offset_external (itxnobject, ihipoint, ooffset)
		end

	txnoffset_to_hipoint (itxnobject: POINTER; ioffset: INTEGER; ohipoint: POINTER): INTEGER is
		local
		do
			Result := txnoffset_to_hipoint_external (itxnobject, ioffset, ohipoint)
		end

	txndrag_tracker (itxnobject: POINTER; itxnframeid: INTEGER; imessage: INTEGER; iwindow: POINTER; idragreference: POINTER; idifferentobjectsamewindow: INTEGER): INTEGER is
		local
		do
			Result := txndrag_tracker_external (itxnobject, itxnframeid, imessage, iwindow, idragreference, idifferentobjectsamewindow)
		end

	txndrag_receiver (itxnobject: POINTER; itxnframeid: INTEGER; iwindow: POINTER; idragreference: POINTER; idifferentobjectsamewindow: INTEGER): INTEGER is
		local
		do
			Result := txndrag_receiver_external (itxnobject, itxnframeid, iwindow, idragreference, idifferentobjectsamewindow)
		end

	txnset_command_event_support (itxnobject: POINTER; ioptions: INTEGER): INTEGER is
		local
		do
			Result := txnset_command_event_support_external (itxnobject, ioptions)
		end

	txnget_command_event_support (itxnobject: POINTER; ooptions: POINTER): INTEGER is
		local
		do
			Result := txnget_command_event_support_external (itxnobject, ooptions)
		end

	txnset_spell_check_as_you_type (itxnobject: POINTER; iactivate: INTEGER): INTEGER is
		local
		do
			Result := txnset_spell_check_as_you_type_external (itxnobject, iactivate)
		end

	txnget_spell_check_as_you_type (itxnobject: POINTER): INTEGER is
		local
		do
			Result := txnget_spell_check_as_you_type_external (itxnobject)
		end

	txnset_event_target (itxnobject: POINTER; ieventtarget: POINTER): INTEGER is
		local
		do
			Result := txnset_event_target_external (itxnobject, ieventtarget)
		end

	txnget_event_target (itxnobject: POINTER; oeventtarget: POINTER): INTEGER is
		local
		do
			Result := txnget_event_target_external (itxnobject, oeventtarget)
		end

	txnset_contextual_menu_setup (itxnobject: POINTER; imenusetupproc: POINTER; iuserdata: POINTER): INTEGER is
		local
		do
			Result := txnset_contextual_menu_setup_external (itxnobject, imenusetupproc, iuserdata)
		end

	txnget_accessibility_hiobject (itxnobject: POINTER; ohiobjectref: POINTER): INTEGER is
		local
		do
			Result := txnget_accessibility_hiobject_external (itxnobject, ohiobjectref)
		end

	hitext_view_create (inboundsrect: POINTER; inoptions: INTEGER; intxnframeoptions: INTEGER; outtextview: POINTER): INTEGER is
		local
		do
			Result := hitext_view_create_external (inboundsrect, inoptions, intxnframeoptions, outtextview)
		end

	hitext_view_get_txnobject (intextview: POINTER): POINTER is
		local
		do
			Result := hitext_view_get_txnobject_external (intextview)
		end

	hitext_view_set_background_color (intextview: POINTER; incolor: POINTER): INTEGER is
		local
		do
			Result := hitext_view_set_background_color_external (intextview, incolor)
		end

	hitext_view_copy_background_color (intextview: POINTER; outcolor: POINTER): INTEGER is
		local
		do
			Result := hitext_view_copy_background_color_external (intextview, outcolor)
		end

	new_txnaction_key_mapper_upp (userroutine: POINTER): POINTER is
		local
		do
			Result := new_txnaction_key_mapper_upp_external (userroutine)
		end

	dispose_txnaction_key_mapper_upp (userupp: POINTER) is
		local
		do
			dispose_txnaction_key_mapper_upp_external (userupp)
		end

	invoke_txnaction_key_mapper_upp (actionkey: INTEGER; commandid: INTEGER; userupp: POINTER): POINTER is
		local
		do
			Result := invoke_txnaction_key_mapper_upp_external (actionkey, commandid, userupp)
		end

	txnset_view_rect (itxnobject: POINTER; iviewrect: POINTER) is
		local
		do
			txnset_view_rect_external (itxnobject, iviewrect)
		end

	txnnew_object (ifilespec: POINTER; iwindow: POINTER; iframe: POINTER; iframeoptions: INTEGER; iframetype: INTEGER; ifiletype: INTEGER; ipermanentencoding: INTEGER; otxnobject: POINTER; otxnframeid: POINTER; irefcon: POINTER): INTEGER is
		local
		do
			Result := txnnew_object_external (ifilespec, iwindow, iframe, iframeoptions, iframetype, ifiletype, ipermanentencoding, otxnobject, otxnframeid, irefcon)
		end

	txnterminate_textension is
		local
		do
			txnterminate_textension_external
		end

	txnset_data_from_file (itxnobject: POINTER; ifilerefnum: INTEGER; ifiletype: INTEGER; ifilelength: INTEGER; istartoffset: INTEGER; iendoffset: INTEGER): INTEGER is
		local
		do
			Result := txnset_data_from_file_external (itxnobject, ifilerefnum, ifiletype, ifilelength, istartoffset, iendoffset)
		end

	txnconvert_to_public_scrap: INTEGER is
		local
		do
			Result := txnconvert_to_public_scrap_external
		end

	txnconvert_from_public_scrap: INTEGER is
		local
		do
			Result := txnconvert_from_public_scrap_external
		end

	txndraw (itxnobject: POINTER; idrawport: POINTER) is
		local
		do
			txndraw_external (itxnobject, idrawport)
		end

	txnattach_object_to_window (itxnobject: POINTER; iwindow: POINTER; iisactualwindow: INTEGER): INTEGER is
		local
		do
			Result := txnattach_object_to_window_external (itxnobject, iwindow, iisactualwindow)
		end

	txnis_object_attached_to_window (itxnobject: POINTER): INTEGER is
		local
		do
			Result := txnis_object_attached_to_window_external (itxnobject)
		end

	txnis_object_attached_to_specific_window (itxnobject: POINTER; iwindow: POINTER; oattached: STRING): INTEGER is
		local
			oattached_c_string: EWG_ZERO_TERMINATED_STRING
		do
			create oattached_c_string.make_shared_from_string (oattached)
			Result := txnis_object_attached_to_specific_window_external (itxnobject, iwindow, oattached_c_string.item)
		end

	txnset_rect_bounds (itxnobject: POINTER; iviewrect: POINTER; idestinationrect: POINTER; iupdate: INTEGER) is
		local
		do
			txnset_rect_bounds_external (itxnobject, iviewrect, idestinationrect, iupdate)
		end

	txnget_rect_bounds (itxnobject: POINTER; oviewrect: POINTER; odestinationrect: POINTER; otextrect: POINTER): INTEGER is
		local
		do
			Result := txnget_rect_bounds_external (itxnobject, oviewrect, odestinationrect, otextrect)
		end

	txnactivate (itxnobject: POINTER; itxnframeid: INTEGER; iactivestate: INTEGER): INTEGER is
		local
		do
			Result := txnactivate_external (itxnobject, itxnframeid, iactivestate)
		end

	txnpoint_to_offset (itxnobject: POINTER; ipoint: POINTER; ooffset: POINTER): INTEGER is
		local
		do
			Result := txnpoint_to_offset_external (itxnobject, ipoint, ooffset)
		end

	txnoffset_to_point (itxnobject: POINTER; ioffset: INTEGER; opoint: POINTER): INTEGER is
		local
		do
			Result := txnoffset_to_point_external (itxnobject, ioffset, opoint)
		end

	txncan_undo (itxnobject: POINTER; otxnactionkey: POINTER): INTEGER is
		local
		do
			Result := txncan_undo_external (itxnobject, otxnactionkey)
		end

	txncan_redo (itxnobject: POINTER; otxnactionkey: POINTER): INTEGER is
		local
		do
			Result := txncan_redo_external (itxnobject, otxnactionkey)
		end

	txnget_action_change_count (itxnobject: POINTER; ioptions: INTEGER; ocount: POINTER): INTEGER is
		local
		do
			Result := txnget_action_change_count_external (itxnobject, ioptions, ocount)
		end

	txnclear_action_change_count (itxnobject: POINTER; ioptions: INTEGER): INTEGER is
		local
		do
			Result := txnclear_action_change_count_external (itxnobject, ioptions)
		end

	txnset_data_from_cfurlref (itxnobject: POINTER; iurl: POINTER; istartoffset: INTEGER; iendoffset: INTEGER): INTEGER is
		local
		do
			Result := txnset_data_from_cfurlref_external (itxnobject, iurl, istartoffset, iendoffset)
		end

	txnsave (itxnobject: POINTER; itype: INTEGER; irestype: INTEGER; ipermanentencoding: INTEGER; ifilespecification: POINTER; idatareference: INTEGER; iresourcereference: INTEGER): INTEGER is
		local
		do
			Result := txnsave_external (itxnobject, itype, irestype, ipermanentencoding, ifilespecification, idatareference, iresourcereference)
		end

end