#!/bin/bash
# Move to the directory where this script is located
cd "$(dirname "$0")"

echo "============================================="
echo "   Streamlit App Launcher (app_DL.py)        "
echo "============================================="

# Check for virtual environment and activate it if present
if [ -d "venv" ]; then
    echo "Activating virtual environment (venv)..."
    source venv/bin/activate
else
    echo "Warning: No virtual environment 'venv' found."
    echo "Running with default system Python."
fi

# Run Streamlit in the background on port 8501 headlessly
echo "Starting Streamlit server on http://localhost:8501..."
python3 -m streamlit run app_DL.py --server.port 8501 --server.headless true > /dev/null 2>&1 &
STREAMLIT_PID=$!

# Wait 3 seconds for the server to start up
echo "Waiting for server to initialize..."
sleep 3

# Open the Streamlit page in Google Chrome
echo "Launching Google Chrome..."
open -a "Google Chrome" http://localhost:8501

echo "---------------------------------------------"
echo "Streamlit is running in the background (PID: $STREAMLIT_PID)."
echo "Do NOT close this terminal window unless you want to stop the app."
echo "Press Ctrl+C in this terminal window to stop the server."
echo "============================================="

# Trap Ctrl+C to terminate Streamlit before exiting
trap "echo -e '\nStopping Streamlit server...'; kill $STREAMLIT_PID; exit" INT
wait
