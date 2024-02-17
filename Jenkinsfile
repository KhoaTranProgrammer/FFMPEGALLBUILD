pipeline {
    agent any

    parameters {
        choice(name: 'OS_COMPILER', choices: ['Windows_w64devkit'], description: 'Select target OS and compiler')
    }
  
    stages {
        stage('Setup') {
            steps {
                script {
                    if (params.OS_COMPILER == 'Windows_w64devkit') {
                        bat 'Setup\\Windows\\Setup.bat --install Setup\\Windows\\default.yml'
                    }
                }
            }
        }
        stage('Download') {
            steps {
                script {
                    if (params.OS_COMPILER == 'Windows_w64devkit') {
                        bat 'Setup\\Windows\\Setup.bat --activate Setup\\Windows\\default.yml && python .\\Scripts\\ControlProcess.py -ji .\\JSON\\FFMPEG.json -st Download'
                    }
                }
            }
        }
        stage('Patch') {
            steps {
                script {
                    if (params.OS_COMPILER == 'Windows_w64devkit') {
                        bat 'Setup\\Windows\\Setup.bat --activate Setup\\Windows\\default.yml && python .\\Scripts\\ControlProcess.py -ji .\\JSON\\FFMPEG.json -st Patch'
                    }
                }
            }
        }
        stage('Configure') {
            steps {
                script {
                    if (params.OS_COMPILER == 'Windows_w64devkit') {
                        bat 'Setup\\Windows\\Setup.bat --activate Setup\\Windows\\default.yml && python .\\Scripts\\ControlProcess.py -ji .\\JSON\\FFMPEG.json -st Configure'
                    }
                }
            }
        }
        stage('Build') {
            steps {
                script {
                    if (params.OS_COMPILER == 'Windows_w64devkit') {
                        bat 'Setup\\Windows\\Setup.bat --activate Setup\\Windows\\default.yml && python .\\Scripts\\ControlProcess.py -ji .\\JSON\\FFMPEG.json -st Build'
                    }
                }
            }
        }
        stage('Package') {
            steps {
                script {
                    if (params.OS_COMPILER == 'Windows_w64devkit') {
                        bat 'Setup\\Windows\\Setup.bat --activate Setup\\Windows\\default.yml && python .\\Scripts\\ControlProcess.py -ji .\\JSON\\FFMPEG.json -st Package'
                    }
                }
            }
            post {
                success {
                    archiveArtifacts artifacts: 'Package/*.md,Package/*.zip'
                    script {
                        if (params.OS_COMPILER == 'Windows_w64devkit') {
                            currentBuild.description = readFile('Package/ffmpeg-Windows-w64devkit.md')
                        }
                    }
                }
            }
        }
        stage('Deploy') {
            steps {
                script {
                    if (params.OS_COMPILER == 'Windows_w64devkit') {
                        bat 'Setup\\Windows\\Setup.bat --activate Setup\\Windows\\default.yml && python .\\Scripts\\ControlProcess.py -ji .\\JSON\\FFMPEG_w64devkit_Deploy.json -st Deploy'
                    }
                }
            }
        }
    }
}
