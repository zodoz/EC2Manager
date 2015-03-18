sinon = require 'sinon'
chai = require 'chai'
expect = chai.expect
mongoose = require 'mongoose'
mockgoose = require 'mockgoose'
ctrlUser = require '../../src/controllers/ctrlUser.coffee'

mockgoose mongoose
mongoose.connect 'mongodb://localhost/test'

describe 'CtrlUser', ->
  it '#save', (done) ->
    ctrlUser.createNewUser 'testUser', 'testPass', 'testEmail', (err, user)->
      expect err
        .to.be.null
      testUser.save (err) ->
        expect testUser.password
          .to.not.eql 'testPass'
        console.log 'reached save condition'
        done()
