module.exports =
  copy:
    uiBootstrap:
      files: [
        expand: true
        cwd: 'bower_components/angular-ui-bootstrap-bower'
        src: 'ui-bootstrap-tpls.min.js'
        dest: 'dist/js/'
      ]
