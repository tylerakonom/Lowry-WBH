#!/bin/bash

# Written by: tyak9569
# Date: 02_23_2023
# Purpose: Hisat2 script for tyak9569

#SBATCH --partition=amilan    # Summit partition
#SBATCH --qos=normal                 # Summit qos
#SBATCH --time=001:00:00           # Max wall time in HHH:MM:SS
#SBATCH --ntasks=24           # Number of tasks per job  
#SBATCH --nodes=1             # Number of nodes per job
#SBATCH --job-name=hisat      # Job submission name
#SBATCH --output=hisat%j.out   # Output file name with Job ID


# purge all existing modules
module purge

# load the module needed to run the software container, and set up temporary directories
module load singularity
export SINGULARITY_TMPDIR=/scratch/alpine/$USER
export SINGULARITY_CACHEDIR=/scratch/alpine/$USER
outdirectory=/scratch/alpine/tyak9569/wbh/aligned
indirectory=/scratch/alpine/tyak9569/wbh/trimmedReads
genome=/scratch/alpine/tyak9569/wbh/genome/index/GCA_000001405.15_GRCh38_no_alt_analysis_set
mkdir -p ${outdirectory}
mkdir -p ${outdirectory}/hisatout

# Running HISAT2
singularity run /projects/lowryc/software/containers/rnaseq.sif hisat2 -p 4 --summary-file ${outdirectory}/hisatout/${filename}.txt -x ${genome} -1 ${indirectory}/${filename}_1_trimmed.fq.gz -2 ${indirectory}/${filename}_2_trimmed.fq.gz -S ${outdirectory}/${filename}.bam