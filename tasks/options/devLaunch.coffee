module.exports =
  concurrent:
    dev:
      options:
        logConcurrentOutput: true
      tasks: [
        'nodemon'
        'watch'
      ]
  nodemon:
    dev:
      script: 'app.js'
      options:
        ext: 'coffee'
        watch: [
          'app.coffee'
          'src/tasks'
        ]
