

class S_OPT_PULL 

inherit

	S_CONTEXT
		redefine
			set_context_attributes
		end


creation

	make

	
feature 

	make (node: OPT_PULL_C) is
		do
			save_attributes (node);
			title := node.title;
			if node.text_modified then
				text := node.text;
			end;
		end;

	context (a_parent: COMPOSITE_C): OPT_PULL_C is
		do
			!!Result;
			create_context (Result, a_parent);
		end;

	set_context_attributes (a_context: OPT_PULL_C) is
		do
			if not (text = Void) then
				a_context.set_text (text);
			end;
			if not (title = Void) then
				a_context.set_title (title)
			end;
			a_context.forbid_recompute_size;
			set_attributes (a_context);
			a_context.allow_recompute_size;
		end;

	
feature {NONE}

	title, text: STRING;

end

