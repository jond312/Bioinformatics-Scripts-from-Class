#!/bin/bash
#
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --time=08:00:00
#SBATCH --mem=4GB
#SBATCH --job-name=nf_core_rnaseq
#SBATCH --output=/scratch/jdm808/ngs.week8/nfcore_output.log
#SBATCH --error=/scratch/jdm808/ngs.week8/nfcore_error.log
#SBATCH --mail-type=FAIL
#SBATCH --account=pr_284_general
#SBATCH --mail-user=jdm808@nyu.edu

module purge
module load nextflow/24.10.4

SAMPLESHEET="/scratch/work/courses/BIT653/hw8.2025/rnaseq_samplesheet.csv"
PARAMSFILE="/scratch/work/courses/BIT653/hw8.2025/rnaseq-json"
GENOMEFASTA="/scratch/work/courses/BIT653/hw8.2025/hg38/Homo_sapiens.GRCh38.dna_sm.primary_assembly.fa.gz"
GENOMEGTF="/scratch/work/courses/BIT653/hw8.2025/hg38/Homo_sapiens.GRCh38.111.gtf.gz"

nextflow run nf-core/rnaseq -r 3.14.0 \
    --input $SAMPLESHEET \
    --outdir res \
    --fasta $GENOMEFASTA \
    --gtf $GENOMEGTF \
    --extra_salmon_quant_args "--gcBias" \
    --save_reference \
    -profile nyu_hpc \
    --account pr_284_general \
    -c /scratch/work/courses/BIT653/hw8.2025/rnaseq.config \
    --params-file $PARAMSFILE
