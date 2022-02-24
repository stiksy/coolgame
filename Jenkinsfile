pipeline {
    checkout scm
    docker.image(rikorose/gcc-cmake) {  
        stages {
            stage('build') {
                steps {
                    cmakeBuild(
                        installation: 'InSearchPath'
                    )
                }
            }
        }   
    }
}
