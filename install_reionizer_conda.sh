#!/bin/bash
test -s ~/.alias && . ~/.alias || true
module load cray-python/3.10.10

mkdir /project/project_465001138/apps/envs/lya_env
python3 -m venv /project/project_465001138/apps/envs/lya_env
source /project/project_465001138/apps/envs/lya_env/bin/activate

# create lya_env environment in project directory
# conda create --prefix /project/project_465001138/apps/.conda/envs/lya_env python=3.7
# source activate lya_env

# install requirements
# conda install pip

# Make sure the code can find the data
export LYA_DATA_DIR=/project/project_465001138/data/LyaInference_data/

# Afterwards we clone and install the LyaInference package itself
cd /project/project_465001138/apps/
git clone git@github.com:charlottenosam/LyaInference.git
cd LyaInference
pip install -e .

# install pyqt for KDE
pip uninstall -y pyqt_fit
pip install git+ssh://git@github.com/charlottenosam/pyqt-fit.git
echo pip install git+ssh://git@github.com/charlottenosam/pyqt-fit.git

# test installation
python -c "import reionizer; print('Imported reionizer succesfully'); print(reionizer.get_xHI_tab())"