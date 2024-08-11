@echo off
REM Ensure this script is run from the /tests directory

:: Set the path to your compiled executable
set EXECUTABLE=..\cmake-build-debug\Debug\Prismio.exe

:: Set the path to your test file
set TEST_FILE=test.psmi

:: Check if the executable exists
if not exist "%EXECUTABLE%" (
    echo Error: Executable not found at %EXECUTABLE%
    exit /b 1
)

:: Check if the test file exists
if not exist "%TEST_FILE%" (
    echo Error: Test file not found at %TEST_FILE%
    exit /b 1
)

:: Run the executable with the test file
"%EXECUTABLE%" "%TEST_FILE%"
