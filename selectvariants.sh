#!/bin/bash
#
#SBATCH --nodes=1
#SBATCH --tasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --time=48:00:00
#SBATCH --mem=4GB
#SBATCH --job-name=selectVariants
#SBATCH --output=/scratch/jdm808/ngs.week5/selectvariants_output.log
#SBATCH --error=/scratch/jdm808/ngs.week5/selectvariants_error.log
#SBATCH --mail-type=FAIL
#SBATCH --account=pr_284_general
#SBATCH --mail-user=jdm808@nyu.edu

module purge
module load gatk/4.3.0.0

gatk SelectVariants \
-R /scratch/work/courses/BI7653/hw4.2025/sarek/GATKBundle/Homo_sapiens_assembly38.fasta \
-V /scratch/work/courses/BI7653/hw5.2025/joint_germline_recalibrated.vcf.gz \
--select-type-to-include SNP \
--exclude-filtered \
-O /scratch/jdm808/ngs.week5/filtered_snps.vcf.gz
