module.exports =
  copy:
    angular:
      files: [
        expand: true
        cwd: 'bower_components/angular/'
        src: [
          'angular.min.js'
          'angular.min.js.map'
        ]
        dest: 'dist/js/'
      ]
    angularRoute:
      files: [
        expand: true
        cwd: 'bower_components/angular-route/'
        src: [
          'angular-route.min.js'
          'angular-route.min.js.map'
        ]
        dest: 'dist/js/'
      ]
