module.exports =
  less:
    bootstrap:
      options:
        paths: ['bower_components/bootstrap/less']
        strictMath: true
        sourceMap: true
        outputSourceFiles: true
        sourceMapURL: 'bootstrap.css.map'
        sourceMapFilename: 'dist/css/bootstrap.css.map',
        sourceMapBasepath: 'bower_components/bootstrap/less'
      files:
        'dist/css/bootstrap.css': 'bower_components/bootstrap/less/bootstrap.less'

  concat:
    bootstrap:
      src: [
        'bower_components/bootstrap/js/transition.js'
        'bower_components/bootstrap/js/alert.js'
        'bower_components/bootstrap/js/button.js'
        'bower_components/bootstrap/js/carousel.js'
        'bower_components/bootstrap/js/collapse.js'
        'bower_components/bootstrap/js/dropdown.js'
        'bower_components/bootstrap/js/modal.js'
        'bower_components/bootstrap/js/tooltip.js'
        'bower_components/bootstrap/js/popover.js'
        'bower_components/bootstrap/js/scrollspy.js'
        'bower_components/bootstrap/js/tab.js'
        'bower_components/bootstrap/js/affix.js'
      ]
      dest: 'dist/js/bootstrap.js'

  copy:
    bootstrap:
      files: [
        expand: true
        cwd: 'bower_components/bootstrap/fonts'
        src: '*'
        dest: 'dist/fonts/'
      ]
