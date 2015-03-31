angular.moduel 'EC2Manager'
  .service 'Session', ->
    @create = (sessionId, userId) =>
      @id = sessionId
      @user = userId

    @destroy = =>
      @id = null
      @user = null
