#!/bin/bash

# Written by: tyak9569
# Date: 03_17_23
# Purpose: fastQC script for tyak9569

#SBATCH --partition=amilan     # Alpine partition
#SBATCH --qos=normal                 # Summit qos
#SBATCH --time=006:00:00           # Max wall time in HHH:MM:SS
#SBATCH --ntasks 32           # Number of tasks per job
#SBATCH --nodes=1             # Number of nodes per job
#SBATCH --job-name=fastQC       # Job submission name
#SBATCH --output=o.fastQC.%j.out   # Output file name with Job ID

# purge all existing modules

module purge

# load the module needed to run the software container, and set up temporary directories

module load singularity
export SINGULARITY_TMPDIR=/gpfs/alpine1/scratch/$USER
export SINGULARITY_CACHEDIR=/gpfs/alpine1/scratch/$USER

# Create directories if needed

indirectory=/gpfs/alpine1/scratch/$USER/wbh
outdirectory=/gpfs/alpine1/scratch/$USER/wbh/fastQC

# mkdir -p /scratch/alpine/$USER/wbh/fastQC
# mkdir -p /scratch/alpine/$USER/wbh/fastQC/raw
# mkdir -p /scratch/alpine/$USER/wbh/fastQC/trimmed
# mkdir -p /scratch/alpine/$USER/wbh/fastQC/aligned

# Running Fastqc

# Raw
raw=${indirectory}/rawdata/*.fq.gz
for f in ${raw}
do
  	singularity run /projects/lowryc/software/containers/rnaseq.sif fastqc -t 32 -o ${outdirectory}/raw/ -d ${indirectory}/rawdata $f
done

# Trimmed
# trimmed=${indirectory}/trimmedReads/*_trimmed.fq.gz
# for f in ${trimmed}
# do
#   	singularity run /projects/lowryc/software/containers/rnaseq.sif fastqc -t 32 -o ${outdirectory}/trimmed/ -d ${indirectory}/trimmedReads $f
# done

# Aligned
# aligned=${indirectory}/aligned/*.bam
# for f in ${aligned}
# do
#   	singularity run /projects/lowryc/software/containers/rnaseq.sif fastqc -t 32 -o ${outdirectory}/aligned/ -d ${indirectory}/aligned $f
# done