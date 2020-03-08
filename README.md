A [leex](http://erlang.org/doc/man/leex.html) specification to tokenize Prometheus v1 alerting rules.

In the REPL:

```
erl> leex:file(rules).
erl> c(rules).
erl> rules:string("ALERT MyAlert FOR 5m LABELS { sev=\"warn\", team=\"sre\" }").
```
