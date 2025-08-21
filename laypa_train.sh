#!/bin/bash
#Set job requirements
#SBATCH -t 10:00:00
#SBATCH --mail-type=BEGIN,END
#SBATCH --mail-user=e.m.biesot@student.vu.nl
#SBATCH -p gpu_mig
#SBATCH --gpus=1

source activate base
conda activate laypa

python tooling/dataset_creation.py -i training_data -o training_data_split
python train.py -c configs/config_stamboeken.yaml -t training_data_split/train_filelist.txt -v training_data_split/val_filelist.txt --num-gpus 1 --opts SOLVER.IMS_PER_BATCH 2 SOLVER.MAX_ITER 50000