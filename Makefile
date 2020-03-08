clean:
	rm rules.erl rules.beam rules_parser.erl rules_parser.beam

lex:
	 erl -noshell -eval "leex:file(rules), halt()."
	 erlc rules.erl

yacc:
	erl -noshell -eval "yecc:file(rules_parser), halt()."
	erlc rules_parser.erl

all: lex yacc

