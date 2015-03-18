sinon = require 'sinon'
chai = require 'chai'
expect = chai.expect
mongoose = require 'mongoose'
mockgoose = require 'mockgoose'
User = require '../../src/models/mdlUser'

mockgoose mongoose
mongoose.connect 'mongodb://localhost/test'

describe 'User', ->
  it '#save', (done) ->
    testUser = new User
      username: 'testUser'
      password: 'testPass'
      email: 'testEmail'
    testUser.save (err) ->
      expect testUser.password
        .to.not.eql 'testPass'
      console.log 'reached save condition'
      done()

  it '#isValidLogin', (done) ->
    testUser = new User
      username: 'testUser'
      password:'testPass'
      email: 'testEmail'
    testUser.save ->
      sinon.stub User, 'findOne'
        .yields null, testUser

      User.isValidLogin 'testUser', 'testPass', (err, retUser) ->
        expect err
          .to.be.null
        expect retUser.username
          .to.eql 'testUser'
        done()
