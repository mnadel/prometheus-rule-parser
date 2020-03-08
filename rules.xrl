Definitions.

SYMBOL = [A-Za-z][A-Za-z0-9_]+
DUR    = [1-9][0-9]*[hms]
VALUE  = "[^"]+?"
WS     = [\s\t]*

Rules.

{WS}                           : skip_token.
ALERT{WS}{SYMBOL}              : {token, {alert, word(TokenChars, second)}}.
FOR{WS}{DUR}                   : {token, {duration, word(TokenChars, second)}}.
LABELS{WS}\{                   : {token, {labels}}.
ANNOTATIONS{WS}\{              : {token, {annos}}.
{SYMBOL}{WS}={WS}{VALUE}{WS},? : {token, {keyval, tupleize(TokenChars)}}.
\}                             : skip_token.

Erlang code.

tupleize(Str) ->
    Trim = fun(S) -> string:trim(S, both) end,
    DelComma = fun(S) -> string:join(string:replace(S, ",", "", all), "") end,
    DelQuote = fun(S) -> string:join(string:replace(S, "\"", "", all), "") end,
    Split = string:split(Str, "="),
    NoComma = lists:map(DelComma, Split),
    NoQuote = lists:map(DelQuote, NoComma),
    [A,B] = lists:map(Trim, NoQuote),
    {A,B}.

word(Sentence, first) ->
    [First, _] = string:split(Sentence, " "),
    string:trim(First, both);
word(Sentence, second) ->
    [_, Second] = string:split(Sentence, " "),
    string:trim(Second, both).

