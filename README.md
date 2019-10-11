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

## How to install and use it

To use the library, just use:

```
npm install --save frappuccino
```

And import it on your code:

```coffeescript
Promise = require 'frappuccino'
```

You can do it on JavaScript too :wink:

```javascript
const Promise = require('frappuccino')
```

## How to run the tests

Clone the repository, and run:

```
npm install
```

Then you will be able to run the tests by:

```
npm test
```

## How to run the linter

Clone the repository, and run:

```
npm install
```

Then you will be able to run the linter by:

```
npm run lint
```
