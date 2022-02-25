pipeline {
    agent any
    stages {
        stage('build') {
            steps {
                checkout scm
                script {
                    sh """
                        mkdir build
                        cmake -S game/src -B build
                        cmake --build build
                        tar --exclude='_deps' --exclude='CMakeFiles' --exclude='lib' --exclude='common' -czf build.tar.gz -C build .
                    """
                }
                archiveArtifacts artifacts: 'build.tar.gz'
            }
        }
        stage('test') {
            steps {
                script {
                    try {
                        sh """
                            cd build
                            ctest
                        """
                    }
                    catch (err) {                                        
                        unstable(message: "Unit tests have failed, please review the results.")
                    }
                    sh """
                        tar -czf test.tar.gz -C build/Testing/Temporary .
                    """

                }
                archiveArtifacts artifacts: 'test.tar.gz'
            }
        }
        stage('cleanup') {
            steps {
                cleanWs()
            }
        }
    }
}
