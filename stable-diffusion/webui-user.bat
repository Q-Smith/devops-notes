@echo off

set PYTHON=
set GIT=
set VENV_DIR=
set COMMANDLINE_ARGS=--skip-version-check --skip-torch-cuda-test --disable-nan-check --allow-code --xformers --no-half --medvram

call webui.bat
