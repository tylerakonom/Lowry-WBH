#!/bin/bash

# Written by: tyak9569
# Date: 20200903
# Purpose: fastQC script for tyak9569

#SBATCH --partition=shas     # Summit partition
#SBATCH --qos=normal                 # Summit qos
#SBATCH --time=002:00:00           # Max wall time in HHH:MM:SS
#SBATCH --ntasks 24           # Number of tasks per job
#SBATCH --nodes=1             # Number of nodes per job
#SBATCH --job-name=fastQC       # Job submission name
#SBATCH --output=o.fastQC.%j.out   # Output file name with Job ID

# purge all existing modules
module purge

# load the module needed to run the software container, and set up temporary directories
module load singularity
export SINGULARITY_TMPDIR=/gpfs/summit/scratch/$USER
export SINGULARITY_CACHEDIR=/gpfs/summit/scratch/$USER

# Create directories
/gpfs/summit/scratch/tyak9569/wbh/rawdata
mkdir -p /gpfs/summit/scratch/tyak9569/wbh/fastQC
mkdir -p /gpfs/summit/scratch/tyak9569/wbh/fastQC/rawdata
mkdir -p /gpfs/summit/scratch/tyak9569/wbh/fastQC/trimmed
mkdir -p /gpfs/summit/scratch/tyak9569/wbh/fastQC/sorted

# Running Fastqc

# Raw
FILES1=/projects/tyak9569/wbh/rawdata/*.fq.gz
for f in $FILES1
do
  	singularity run /projects/lowryc/software/containers/rnaseq.sif fastqc -t 24 -o /scratch/summit/tyak9569/dnFGFR/fastQC/raw/ -d /projects/tyak9569/dnFGFR/data/ $f
done

# Trimmed
FILES1=/scratch/summit/tyak9569/dnFGFR/trimmedReads/*.fq.gz
for f in $FILES1
do
  	singularity run /projects/lowryc/software/containers/rnaseq.sif fastqc -t 24 -o /scratch/summit/tyak9569/dnFGFR/fastQC/trimmed/ -d /scratch/summit/tyak9569/dnFGFR/trimmedReads/ $f
done

# Sorted
FILES1=/scratch/summit/tyak9569/dnFGFR/aligned/sorted/*.bam
for f in $FILES1
do
  	singularity run /projects/lowryc/software/containers/rnaseq.sif fastqc -t 24 -o /scratch/summit/tyak9569/dnFGFR/fastQC/sorted/ -d /scratch/summit/tyak9569/dnFGFR/aligned/sorted/ $f
done