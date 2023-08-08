# Monadic Exceptions

This gem aims to provide an interface from plain ruby exceptions to monads(using the [dry-monad gem](https://dry-rb.org/gems/dry-monads/1.3/maybe/))

## Initial goals for this gem

- Initially I'm planning just to provide a interface between `Exception ->
Result[Failure(), Success()]` where I try to provide as much information I can
get from that exception so it's easier for you to manage it.
