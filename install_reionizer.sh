python3 -m venv ~/software


module load LUMI
module load cotainr

# Build reionizer container, containing all needed astro packages
cotainr build reionizer_container.sif --system=lumi-c --conda-env=my_conda_env.yml



# Load container
# srun --partition=<partition> --account=<account> singularity exec my_container.sif python3 my_script.py

