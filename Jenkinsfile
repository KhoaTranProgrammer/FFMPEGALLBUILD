pipeline {
    agent any

    parameters {
        choice(name: 'OS_COMPILER', choices: ['Windows_w64devkit', 'Linux_UbuntuGcc'], description: 'Select target OS and compiler')
    }
  
    stages {
        stage('Setup') {
            steps {
                script {
                    if (params.OS_COMPILER == 'Windows_w64devkit') {
                        bat 'Setup\\Windows\\Setup.bat --install Setup\\Windows\\default.yml'
                    }
                    if (params.OS_COMPILER == 'Linux_UbuntuGcc') {
                        sh 'Setup/Ubuntu/Setup.sh --install Setup/Ubuntu/default.yml'
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
                    if (params.OS_COMPILER == 'Linux_UbuntuGcc') {
                        sh '''#!/usr/bin/env bash
                            source Setup/Ubuntu/Setup.sh --activate Setup/Ubuntu/default.yml && python Scripts/ControlProcess.py -ji JSON/FFMPEG_Ubuntu.json -st Download
                        '''
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
                    if (params.OS_COMPILER == 'Linux_UbuntuGcc') {
                        sh '''#!/usr/bin/env bash
                            source Setup/Ubuntu/Setup.sh --activate Setup/Ubuntu/default.yml && python Scripts/ControlProcess.py -ji JSON/FFMPEG_Ubuntu.json -st Patch
                        '''
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
                    if (params.OS_COMPILER == 'Linux_UbuntuGcc') {
                        sh '''#!/usr/bin/env bash
                            source Setup/Ubuntu/Setup.sh --activate Setup/Ubuntu/default.yml && python Scripts/ControlProcess.py -ji JSON/FFMPEG_Ubuntu.json -st Configure
                        '''
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
                    if (params.OS_COMPILER == 'Linux_UbuntuGcc') {
                        sh '''#!/usr/bin/env bash
                            source Setup/Ubuntu/Setup.sh --activate Setup/Ubuntu/default.yml && python Scripts/ControlProcess.py -ji JSON/FFMPEG_Ubuntu.json -st Build
                        '''
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
                    if (params.OS_COMPILER == 'Linux_UbuntuGcc') {
                        sh '''#!/usr/bin/env bash
                            source Setup/Ubuntu/Setup.sh --activate Setup/Ubuntu/default.yml && python Scripts/ControlProcess.py -ji JSON/FFMPEG_Ubuntu.json -st Package
                        '''
                    }
                }
            }
            post {
                success {
                    archiveArtifacts artifacts: 'Package/*.md,Package/*.zip,Package/*.tar.gz'
                    script {
                        if (params.OS_COMPILER == 'Windows_w64devkit') {
                            currentBuild.description = readFile('Package/ffmpeg-Windows-w64devkit.md')
                        }
                        if (params.OS_COMPILER == 'Linux_UbuntuGcc') {
                            currentBuild.description = readFile('Package/ffmpeg-Ubuntu-gcc.md')
                        }
                    }
                }
            }
        }
    }
}
