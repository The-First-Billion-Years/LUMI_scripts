#!/bin/bash
module load cray-python/3.10.10

# create lya_env environment in project directory
conda create --prefix /home/projects/ku_00155/apps/modulefiles/.conda/envs/lya_env python=3.7
source activate lya_env

# install requirements
conda install pip

# Make sure the code can find the data
export LYA_DATA_DIR=/home/projects/ku_00155/data/LyaInference_data/

# Afterwards we clone and install the LyaInference package itself
cd /home/projects/ku_00155/apps/
git clone https://github.com/charlottenosam/LyaInference.git
cd LyaInference
pip install -e .

# install pyqt for KDE
pip uninstall -y pyqt_fit
pip install git+https://github.com/charlottenosam/pyqt-fit.git
echo pip install git+https://github.com/charlottenosam/pyqt-fit.git

# test installation
python -c "import reionizer; print('Imported reionizer succesfully'); print(reionizer.get_xHI_tab())"