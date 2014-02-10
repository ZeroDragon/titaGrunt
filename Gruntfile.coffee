module.exports = (grunt) ->
    grunt.loadNpmTasks 'grunt-contrib-watch'
    grunt.loadNpmTasks 'grunt-yui-compressor'
    grunt.loadNpmTasks 'grunt-contrib-coffee'
    grunt.loadNpmTasks 'grunt-contrib-clean'
    grunt.loadNpmTasks 'grunt-titanium'

    grunt.registerTask('default',['watch'])

    grunt.initConfig {
        clean:{
            css:{
                src: ['app/controllers/src/*.js']
            }
        },
        coffee:{
            options:{
                bare:true
            },
            compileDefault:{
                files:[]
            }
        },
        min:{
            dist:{
                options:{
                    report:false
                },
                files:[
                    {
                        'expand': true,
                        'cwd': 'app/controllers/',
                        'src': 'src/*.js',
                        'dest': 'app/controllers/',
                        'ext': '.js',
                        'flatten': true
                    }
                ]
            }
        },
        titanium: {
            ios: {
                options: {
                    command: 'build',
                    platform: 'ios'
                }
            },
            iosTest:{
                options: {
                    command: 'build',
                    platform: 'ios',
                    buildOnly: true
                }
            }
        },
        watch:{
            scripts:{
                files: ['app/controllers/src/*.coffee'],
                tasks: [ 'coffee', 'min' ,'clean' ],
            },
            options:{
                forever:true,
                livereload:true,
                nospawn: true
            }
        }
    }

    grunt.event.on 'watch', (actions, filepath) ->
        arrfile = filepath.split('/')
        filename = arrfile.pop()
        cwd = arrfile.join('/')
        
        if grunt.file.isMatch('app/controllers/src/*.coffee',filepath)
            grunt.config(
                ['coffee','compileDefault','files'],
                [
                    {
                        expand: true,
                        cwd: cwd,
                        src: filename,
                        dest: cwd,
                        ext: '.js',
                        ###rename:(dest,matchedSrcPath,options)->
                            filename = matchedSrcPath
                            return dest+'/../'+filename###
                    }
                ]
            )