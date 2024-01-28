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

@if "%_args1%"=="--install" (
    echo "Please waiting for installation ..."
    curl -O https://repo.anaconda.com/miniconda/Miniconda3-latest-Windows-x86_64.exe
    start /wait "" Miniconda3-latest-Windows-x86_64.exe /InstallationType=JustMe /RegisterPython=0 /S /D=%UserProfile%\Miniconda3
    del Miniconda3-latest-Windows-x86_64.exe
    CALL %UserProfile%\Miniconda3\Scripts\activate.bat %UserProfile%\Miniconda3
    conda env create --file %_args2%
) else if "%_args1%"=="--update" (
    echo "Please waiting for updating ..."
    CALL %UserProfile%\Miniconda3\Scripts\activate.bat %UserProfile%\Miniconda3
    conda env update --file %_args2% --prune
) else if "%_args1%"=="--activate" (
    echo "Please waiting for conda activation ..."
    CALL %UserProfile%\Miniconda3\Scripts\activate.bat %UserProfile%\Miniconda3
    for /f "tokens=1,2 delims==" %%a in (%_args2%) do (
        ECHO.%%a | FIND /I "name:" > Nul && ( for /f "tokens=1,2 delims= " %%i in ("%%a") do set name=%%j)
    )
    conda activate %name%
) else (
    echo "Do not support %_args1%"
)
