#!/bin/bash

if ! command -v python3 &> /dev/null; then

echo "Python is not found. Please, use 'apt install python3' and try again!"

exit 1

fi

if ! command -v pip &> /dev/null; then

echo "pip is not found. Please, use 'apt install python3-pip' and try again!"

exit 1

fi

if ! python3 -c "import venv" &> /dev/null; then

echo "venv is not found. Please, use 'apt install python3-venv' and try again!"

exit 1

fi

python3 -m venv angr_venv
source angr_venv/bin/activate

for module in archinfo pyvex cle claripy ailment angr
do

	pip install $module

done

deactivate

echo -e "\n=====================================================================
Install complete! Virtual environment 'angr_venv' has been created.\n
Activate it: source angr_venv/bin/activate\n
To deactivate just type 'deactivate'\n
To recreate virtual environment use: python3 -m venv <env_name>\n
To clear virtual environment use: python3 -m venv --clear <env_name>\n
To delete virtual environment use: rm -rf <env_directory>
====================================================================="



