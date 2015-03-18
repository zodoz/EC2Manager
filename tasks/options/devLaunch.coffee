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
      script: 'app.coffee'
      options:
        ext: 'coffee'
        watch: [
          'app.coffee'
          'src/tasks'
        ]
