@echo off
title Streamlit App Launcher
echo =============================================
echo    Streamlit App Launcher (app_DL.py)
echo =============================================

:: Check for virtual environment and activate it if present
if exist venv (
    echo Activating virtual environment (venv)...
    call venv\Scripts\activate.bat
) else (
    echo Warning: No virtual environment 'venv' found.
    echo Running with default system Python.
)

:: Start Streamlit in the background on port 8501 headlessly
echo Starting Streamlit server on http://localhost:8501...
start /B python -m streamlit run app_DL.py --server.port 8501 --server.headless true

:: Wait 3 seconds for the server to start
timeout /t 3 /nobreak >nul

:: Open the page in Google Chrome if available, otherwise default browser
echo Launching Google Chrome...
start chrome http://localhost:8501

echo ---------------------------------------------
echo Streamlit is running.
echo To stop the server, close this command window.
echo =============================================
pause
