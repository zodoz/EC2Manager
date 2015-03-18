config =
  db:
    url: 'mongodb://localhost/ec2Manager'
  passport:
    secret: 'EC2ManagerSecret'
  bcrypt:
    saltWorkFactor: 10
  app:
    port: 3000
    sessionSecret: 'secret key'

module.exports = config
