Promise = require '../src/'

test 'should work with thenables', (done) ->
  value = 'frappuccino, more like frappugreat'
  thenable =
    then: (fulfill) -> fulfill value

  f1 = jest.fn()

  new Promise (fulfill) -> fulfill value
    .then -> thenable
    .then f1

  setTimeout ( ->
    expect(f1.mock.calls.length).toBe 1
    expect(f1.mock.calls[0][0]).toBe value
    done()
  ), 50
