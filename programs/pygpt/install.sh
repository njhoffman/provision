#!/usr/bin/env bash

# https://github.com/szczyglis-dev/py-gpt/tree/master
# plugins: command: code interpreter, files i/o, web search
# https://pygpt.readthedocs.io/en/latest/plugins.html#command-code-interpreter

sudo snap install pygpt
curl -fsSL https://ollama.com/install.sh | sh

wget https://pygpt.net/download/2.3.4/pygpt-2.3.4.zip
unzip pygpt-2.3.4.zip
cd pygpt-2.3.4 && ./pygpt

pipx install pygpt-net

# Running from GitHub source code
# Clone git repository or download .zip file:
git clone https://github.com/szczyglis-dev/py-gpt.git
cd py-gpt
# Create virtual environment:
python3 -m venv venv
source venv/bin/activate
# Install requirements:
pip install -r requirements.txt
# Run the application:
python3 run.py
# Install with Poetry
# Clone git repository or download .zip file:
git clone https://github.com/szczyglis-dev/py-gpt.git
cd py-gpt
# Install Poetry (if not installed):
pip install poetry
# Create a new virtual environment that uses Python 3.10:
poetry env use python3.10
poetry shell
# Install requirements:
poetry install
# Run the application:
poetry run python3 run.py

## cli usage
# This command opens the PyGPT interface in your terminal. Chat Mode.
pygpt chat
# This starts a chat session with the default assistant. Assistant Mode.
pygpt assistant $ASSISTANT_NAME
# Use this to interact with a specific assistant you've created. Completions Mode.
pygpt complete "Your prompt here"
# This generates a completion for the provided prompt. Image Generation.
pygpt image "Your prompt here"
# Generates an image using DALL-E 3 based on the provided prompt.
# Choosing a Model.
pygpt chat --model gpt-4
# Use the --model flag to specify the model for your session. Setting Temperature.
pygpt chat --temperature 0.7
# Control the creativity of the output using the --temperature flag. Executing Code.
pygpt execute "print('Hello, World!')"
# This executes Python code directly within PyGPT. File Operations.
pygpt read "your_file.txt"
# Using inline commands:
/help
# This displays the help text within the PyGPT interface, listing available commands.
# Accessing plugins:
/plugins
# This lists the installed plugins in PyGPT.
# Executing commands:
/execute echo "Hello, world!"
# This executes the specified command in your shell and displays the output within PyGPT.

## Debugging and Logging
# In Settings -> Developer dialog, you can enable the Show debug menu option to turn on the debugging menu. The menu allows you to inspect the status of application elements.
# In the debugging menu, there is a Logger option that opens a log window.
# In the window, the program’s operation is displayed in real-time.
# Logging levels:
# By default, all errors and exceptions are logged to the file:
${HOME}/.config/pygpt-net/app.log
# To increase the logging level (ERROR level is default), run the application with --debug argument:
python3 run.py --debug=1
# or
python3 run.py --debug=2
