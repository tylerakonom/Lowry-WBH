indirectory=/scratch/alpine/tyak9569/wbh/trimmedReads/

for pathandfilename in `ls ${indirectory}*_1_trimmed.fq.gz`; do
name=`basename $pathandfilename _1_trimmed.fq.gz`
echo $pathandfilename
echo $name
sbatch --export=filename=$name /scratch/alpine/tyak9569/wbh/aligned/alignReads.sh 
done