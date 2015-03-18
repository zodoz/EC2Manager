module.exports =
  copy:
    jquery:
      files: [
          expand: true
          cwd: 'bower_components/jquery/dist'
          src: [
            'jquery.min.js'
            'jquery.min.map'
          ]
          dest: 'dist/js/'
      ]
