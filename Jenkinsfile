pipeline {
    agent any
    stages {
        stage('build') {
            steps {
                cleanWs()
                checkout scm
                script {
                    sh """
                        mkdir coolgame/build
                        cmake -S coolgame/game/src -B coolgame/build
                        cmake --build coolgame/build
                        tar --exclude='_deps' --exclude='CMakeFiles' --exclude='lib' --exclude='common' -czf build.tar.gz -C coolgame/build .
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
                            cd coolgame/build
                            ctest
                        """
                    }
                    catch (err) {                                        
                        unstable(message: "Unit tests have failed, please review the results.")
                    }
                    sh """
                        tar -czf test.tar.gz -C coolgame/build/Testing/Temporary .
                    """

                }
                archiveArtifacts artifacts: 'test.tar.gz'
            }
        }
    }
}
