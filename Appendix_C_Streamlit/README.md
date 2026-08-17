# Deep Learning App (`app_DL.py`) — Setup & Launch Guide

This document is a **Markdown (.md) file**, which is a standard plain text file. You can open and read it on **any computer** using any basic text editor (such as Notepad on Windows, TextEdit on macOS, VS Code, or web browsers on GitHub).

This directory contains the interactive Streamlit application `app_DL.py` associated with Appendix C. Follow the instructions below to configure and run the application.

---

## 1. Online Access (No Installation Required)

You can run the application directly in your web browser without downloading or installing anything:
- **Streamlit App URL:** [https://y5ss6jtuccvpbdvuy7kdgl.streamlit.app/](https://y5ss6jtuccvpbdvuy7kdgl.streamlit.app/)

---

## 2. Quick Launch (Double-Click Shortcuts)

If you prefer to run the application locally, we have created double-clickable launcher shortcuts for both macOS and Windows to make launching the app as simple as possible.

### For macOS Users
1. Double-click **`run_app.command`** inside this folder from Finder.
2. A Terminal window will open to activate the virtual environment and start the Streamlit server.
3. **Google Chrome** will automatically launch and open the application at `http://localhost:8501`.
4. To stop the application, return to the Terminal window and press **`Ctrl + C`**.

### For Windows Users
1. Double-click **`run_app.bat`** inside this folder from File Explorer.
2. A Command Prompt window will open and launch the Streamlit server.
3. **Google Chrome** will automatically open the application at `http://localhost:8501`.
4. To stop the application, close the Command Prompt window.

---

## 3. Manual Command Line Launch

If you prefer to launch the application manually via the command line:

### Prerequisites
Make sure you have **Python 3.9** or higher installed.

### Step-by-Step Execution

1. **Open your terminal or command prompt and navigate to this folder:**
   ```bash
   cd Appendix_C_Streamlit
   ```

2. **Set up a virtual environment (Recommended):**
   ```bash
   # Create a virtual environment
   python3 -m venv venv
   
   # Activate the environment (macOS/Linux)
   source venv/bin/activate
   
   # Activate the environment (Windows)
   venv\Scripts\activate
   ```

3. **Install the dependencies:**
   ```bash
   pip install --upgrade pip
   pip install -r requirements.txt
   ```

4. **Launch the application:**
   ```bash
   streamlit run app_DL.py
   ```
   The application will automatically open in your default browser at `http://localhost:8501`.
