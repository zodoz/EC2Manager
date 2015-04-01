module.exports =
  watch:
    mainStyles:
      files: ['src/styles/*.less']
      tasks: ['less:main']
      options:
        livereload: true
    mainScripts:
      files: ['src/scripts/**/*.coffee']
      tasks: ['coffee:main']
      options:
        livereload: true
    mainViews:
      files: ['src/views/*.jade']
      options:
        livereload: true
  less:
    main:
      options:
        paths: ['src/styles']
        strictMath: true
        sourceMap: true
        outputSourceFiles: true
        sourceMapURL: 'main.css.map'
        sourceMapFilename: "dist/css/main.css.map",
        sourceMapBasepath: "src/styles/"
      files:
        "dist/css/main.css": "src/styles/main.less"
  coffee:
    main:
      options:
        sourceMap: true
        sourceMapDir: 'dist/js/'
      files:
        'dist/js/login.js': 'src/scripts/login.coffee'
        'dist/js/modules.js': 'src/scripts/modules.coffee'
        'dist/js/helpers.js': [
          'src/scripts/constants/*.coffee'
          'src/scripts/services/SessionService.coffee'
          'src/scripts/services/UserService.coffee'
        ]
        'dist/js/NavbarCtrl.js': 'src/scripts/NavbarCtrl.coffee'
