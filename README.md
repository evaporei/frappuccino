# frappuccino

> Promise library with coffee, ice and sugar!

You know when you order a Frappuccino on Starbucks, and sometimes it comes with more ice than you want, and other times it comes very tasty?

Yeah, I know what you're thinking, they are just like JavaScript Promises!

They can either go right, or go wrong.

```coffeescript
# right
new Promise (resolve, reject) ->
  resolve 'tasty frappuccino'

# wrong
new Promise (resolve, reject) ->
  reject 'basically ice but more expensive'
```

So I wanted to understand how JavaScript Promises work, and also I wanted to drink something refreshing. That's how `frappuccino` came to live!
