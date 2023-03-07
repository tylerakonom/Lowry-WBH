#!/bin/bash

# Written by: tyak9569
# Purpose: Hisat2-Index script for tyak9569

#SBATCH --partition=shas     # Summit partition
#SBATCH --qos=normal                 # Summit qos
#SBATCH --time=00:40:00           # Max wall time in HHH:MM:SS
#SBATCH --ntasks=16           # Number of tasks per job
#SBATCH --nodes=1             # Number of nodes per job
#SBATCH --job-name=Hisat2-Index      # Job submission name
#SBATCH --output=o.Hisat2-Index.%j.out   # Output file name with Job ID
#SBATCH --mail-type=END            # Email user when job finishes
#SBATCH --mail-user=tyak9569@colorado.edu # Email address of user

# purge all existing modules
module purge

# load the module needed to run the software container, and set up temporary directories
module load singularity
export SINGULARITY_TMPDIR=/gpfs/summit/scratch/$USER
export SINGULARITY_CACHEDIR=/gpfs/summit/scratch/$USER
outdirectory=/gpfs/summit/scratch/tyak9569/wbh/genome/index
indirectory=/gpfs/summit/scratch/tyak9569/wbh/genome

mkdir -p ${outdirectory}

# Build Hisat2 Index
singularity run /projects/lowryc/software/containers/rnaseq.sif hisat2-build -p 16 ${indirectory}/GCA_000001405.15_GRCh38_no_alt_analysis_set.fna ${outdirectory}