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
  versions:
    angularUi: '0.12.1'
    angular: '1.3.14'
    jquery: '2.1.3'

module.exports = config
