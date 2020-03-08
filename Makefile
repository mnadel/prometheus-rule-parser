lex:
	 erl -noshell -eval "leex:file(rules), halt()."
	 erlc rules.erl
