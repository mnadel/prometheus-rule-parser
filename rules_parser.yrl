Terminals alert duration labels keyval annos.

Nonterminals rule.

Rootsymbol rule.

rule -> alert duration : new_rule('$1', '$2').

Erlang code.

new_rule(Rule, Dur) ->
    {Rule, Dur}.

