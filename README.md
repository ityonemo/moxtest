# Moxtest

testing mox

## Running

run `mix test` at the commandline in the moxtest directory.

note that the second test (which only outputs an IO.inspect on the returned function) returns an error code 500 instead of correctly trampolining to the mock module.


