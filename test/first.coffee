chai = require 'chai'
expect = chai.expect

describe 'Math', ->
  it 'returns the biggest number of the arguments', ->
    max = Math.max 1, 2, 10, 3
    expect max
      .to.equal 10
