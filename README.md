# 1. Introduction
This repository targets to build ffmpeg library from source code. It provides pre-built ffmpeg binary frequently and also share guideline for user to build by themselve with expected configuration.

# 2. OS/Compilers Support
| OS | Compiler |
| :---:   | :---: |
| Windows | gcc 13.1.0   |

# 3. Tools
| Tools | Information |
| :---: | :---------: |
| Ffmpeg | Link: https://github.com/FFmpeg/FFmpeg.git |
| w64devkit-1.19.0.zip (gcc 13.1.0) | Link: https://github.com/skeeto/w64devkit/releases/download/v1.19.0/w64devkit-1.19.0.zip |
| SDL2 | Link: https://github.com/libsdl-org/SDL/releases/download/release-2.28.5/SDL2-devel-2.28.5-VC.zip |
| Miniconda | Link: https://repo.anaconda.com/miniconda/Miniconda3-latest-Windows-x86_64.exe |
| Miniconda python and toolset | Define in Setup/{OS}/*.yml |

# 4. How To Build?
## 4.1 Windows
### A. Setting up environment (For first time only)
1. Clone FFMPEGALLBUILD: git clone https://github.com/KhoaTranProgrammer/FFMPEGALLBUILD.git or download zip package: https://github.com/KhoaTranProgrammer/FFMPEGALLBUILD/archive/refs/heads/master.zip
2. Open cmd from FFMPEGALLBUILD repo location
3. Run: Setup\Windows\Setup.bat --install Setup\Windows\default.yml
### B. Build process
1. Open cmd from FFMPEGALLBUILD repo location
2. Activate environment run: Setup\Windows\Setup.bat --activate Setup\Windows\default.yml
3. Run: python .\Scripts\ControlProcess.py -ji .\JSON\FFMPEG.json -st Download-Patch-Configure-Build-Package
4. If build process is successful, output package will be created at Package\ffmpeg-Windows-w64devkit.zip
