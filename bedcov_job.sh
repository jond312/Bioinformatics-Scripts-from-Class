#!/bin/bash
#
#SBATCH --nodes=1
#SBATCH --tasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --time=4:00:00
#SBATCH --mem=8GB
#SBATCH --job-name=bedcov_task3
#SBATCH --output=/scratch/jdm808/ngs.week6/bedcov_task3_output.log
#SBATCH --error=/scratch/jdm808/ngs.week6/bedcov_task3_error.log
#SBATCH --mail-type=FAIL
#SBATCH --account=pr_284_general
#SBATCH --mail-user=jdm808@nyu.edu
module load samtools/intel/1.20
BED_FILE="/scratch/work/courses/BI7653/hw6.2025/chromosome_1.500bp_intervals.bed"
CR2342_BAM="/scratch/work/courses/BI7653/hw6.2025/CR2342.bam"
CR407_BAM="/scratch/work/courses/BI7653/hw6.2025/CR407.bam"
OUTPUT="coverage_output.txt"
samtools index $CR2342_BAM
samtools index $CR407_BAM
samtools bedcov $BED_FILE $CR2342_BAM $CR407_BAM > $OUTPUT
