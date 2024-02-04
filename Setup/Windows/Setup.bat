:: Usage
:: In order to install new conda environment uses command: Setup.bat --install env.yml
:: In order to install update conda environment uses command: Setup.bat --update env.yml
:: In order to activate new conda environment uses command: Setup.bat --activate env.yml
:: If env.yml is not decided. Script will use default.yml

:: _args1: --install or --activate
@set "_args1=%1"

:: _argr2 is the location to yml file
@set "_args2=%2"

@if "%_args2%"=="" (
    set "_args2=default.yml"
)

echo "Use %_args2%"
set /p a=< %_args2%
echo %a%
set "_miniconda_dir=C:\Workspace\Miniconda3"

@echo off
@if "%_args1%"=="--install" (
    if not exist %_miniconda_dir% mkdir %_miniconda_dir%
    echo "Please waiting for installation ..."
    curl -O https://repo.anaconda.com/miniconda/Miniconda3-latest-Windows-x86_64.exe
    start /wait "" Miniconda3-latest-Windows-x86_64.exe /InstallationType=JustMe /RegisterPython=0 /S /D=%_miniconda_dir%
    del Miniconda3-latest-Windows-x86_64.exe
    echo "Miniconda is installed in location %_miniconda_dir%"
    CALL %_miniconda_dir%\Scripts\activate.bat %_miniconda_dir%
    conda env create --file %_args2%
) else if "%_args1%"=="--update" (
    echo "Please waiting for updating ..."
    CALL %_miniconda_dir%\Scripts\activate.bat %_miniconda_dir%
    echo "Miniconda is updated in location %_miniconda_dir%"
    conda env update --file %_args2% --prune
) else if "%_args1%"=="--activate" (
    echo "Please waiting for conda activation ..."
    CALL %_miniconda_dir%\Scripts\activate.bat %_miniconda_dir%
    echo "Miniconda is activated in location %_miniconda_dir%"
    for /f "tokens=1,2 delims= " %%i in ("%a%") do ( conda activate %%j )
) else (
    echo "Do not support %_args1%"
)

echo "The setup is complete"
