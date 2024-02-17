# 1. Introduction
This repository targets to build ffmpeg library from source code. It provides pre-built ffmpeg binary frequently and also share guideline for user to build by themselve with expected configuration.

# 2. OS/Compilers Support
| OS | Compiler |
| :---:   | :---: |
| Windows | gcc 13.1.0   |
| Ubuntu | gcc 13.2.0   |

# 3. Tools
| Tools | Information |
| :---: | :---------: |
| Ffmpeg | Link: https://github.com/FFmpeg/FFmpeg.git |
| w64devkit-1.19.0.zip (gcc 13.1.0) | Link: https://github.com/skeeto/w64devkit/releases/download/v1.19.0/w64devkit-1.19.0.zip |
| SDL2 | Link: https://github.com/libsdl-org/SDL/releases/download/release-2.28.5/SDL2-devel-2.28.5-VC.zip |
| Miniconda (Windows) | Link: https://repo.anaconda.com/miniconda/Miniconda3-latest-Windows-x86_64.exe |
| Miniconda (Ubuntu) | Link: https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh |
| Miniconda python and toolset | Define in Setup/{OS}/*.yml |

# 4. How To Build?
## 4.1 Windows
### A. Setting up environment (For first time only)
1. Open Git Bash For Windows(Install git tool if is not available https://git-scm.com/)
2. Clone FFMPEGALLBUILD: git clone https://github.com/KhoaTranProgrammer/FFMPEGALLBUILD.git or download zip package: https://github.com/KhoaTranProgrammer/FFMPEGALLBUILD/archive/refs/heads/master.zip
3. Change workind directory to FFMPEGALLBUILD: cd FFMPEGALLBUILD
4. Checkout submodule: git submodule update --init --recursive
5. Open cmd from FFMPEGALLBUILD repo location
6. Run: Setup\Windows\Setup.bat --install Setup\Windows\default.yml
### B. Build process
1. Open cmd from FFMPEGALLBUILD repo location
2. Activate environment run: Setup\Windows\Setup.bat --activate Setup\Windows\default.yml
3. Run: python .\Scripts\ControlProcess.py -ji .\JSON\FFMPEG.json -st Download-Patch-Configure-Build-Package
4. If build process is successful, output package will be created at Package\ffmpeg-Windows-w64devkit.zip
### C. Check binary output
In order to ensure the build process is completely.
1. Playback media: Package\bin\ffplay.exe Data\calahan.m4v
2. In order to understand more about ffmpeg, please refer to Package\share\doc\ffmpeg\general.html
## 4.2 Ubuntu
### A. Setting up environment (For first time only)
1. Open terminal and Install git tool if is not available: sudo apt install git
2. Clone FFMPEGALLBUILD: git clone https://github.com/KhoaTranProgrammer/FFMPEGALLBUILD.git or download zip package: https://github.com/KhoaTranProgrammer/FFMPEGALLBUILD/archive/refs/heads/master.zip
3. Change workind directory to FFMPEGALLBUILD: cd FFMPEGALLBUILD
4. Checkout submodule: git submodule update --init --recursive
5. Run: Setup/Ubuntu/Setup.sh --install Setup/Ubuntu/default.yml
### B. Build process
1. Open terminal from FFMPEGALLBUILD repo location
2. Activate environment run: source Setup/Ubuntu/Setup.sh --activate Setup/Ubuntu/default.yml
3. Run: python Scripts/ControlProcess.py -ji JSON/FFMPEG_Ubuntu.json -st Download-Configure-Build-Package
4. If build process is successful, output package will be created at Package/ffmpeg-Ubuntu-gcc.tar.gz
### C. Check binary output
In order to ensure the build process is completely.
1. Playback media: Package/bin/ffplay Data/calahan.m4v
2. In order to understand more about ffmpeg, please refer to Package/share/man