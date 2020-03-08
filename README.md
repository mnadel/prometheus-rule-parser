A [leex](http://erlang.org/doc/man/leex.html) specification to tokenize Prometheus v1 alerting rules.

In the REPL:

```
erl> leex:file(rules).
erl> c(rules).
erl> {ok, Tokens, _} = rules:string("ALERT MyAlert FOR 5m") LABELS { sev=\"warn\", team=\"sre\" }").
erl> yecc:file(rules_parser).
erl> c(rules_parser).
erl> rules_parser:parse(Tokens).
```

## Notes

1. The tokenizer can handle everything but IF conditions.
2. The parser can only handle ALERT and FOR keywords.
