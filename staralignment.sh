#!/bin/bash
#
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --time=4:00:00
#SBATCH --mem=14GB
#SBATCH --job-name=star_align
#SBATCH --output=/scratch/jdm808/ngs.week7/star_align_output.log
#SBATCH --error=/scratch/jdm808/ngs.week7/star_align_error.log
#SBATCH --mail-type=FAIL
#SBATCH --account=pr_284_general
#SBATCH --mail-user=jdm808@nyu.edu
module purge
module load star/intel/2.7.11a
sample=PDAC253
fastq_processed=/scratch/work/courses/BI7653/hw7.2025/fastqs_processed
star_genome=/scratch/work/courses/BI7653/hw7.2025/STAR.genome
output_dir=/scratch/jdm808/ngs.week7
STAR \
--runThreadN ${SLURM_CPUS_PER_TASK} \
--genomeDir $star_genome \
--readFilesIn $fastq_processed/${sample}_1PE.fP.fastq.gz $fastq_processed/${sample}_2PE.rP.fastq.gz \
--readFilesCommand zcat \
--outFileNamePrefix $output_dir/$sample \
--outSAMtype BAM SortedByCoordinate \
--limitBAMsortRAM 12000000000 \
--outTmpDir ${SLURM_JOBTMP}/${SLURM_JOBID}
echo _ESTATUS_ [ STAR ]: $?
module purge
module load samtools/intel/1.20
samtools index $output_dir/${sample}Aligned.sortedByCoord.out.bam
echo _ESTATUS_ [ samtools index ]: $? 

PDAC253log.Final.out contents:
                                 Started job on |       Mar 12 17:16:22
                             Started mapping on |       Mar 12 17:16:28
                                    Finished on |       Mar 12 17:30:30
       Mapping speed, Million of reads per hour |       141.88
                          Number of input reads |       33184131
                      Average input read length |       150
                                    UNIQUE READS:
                   Uniquely mapped reads number |       5037558
                        Uniquely mapped reads % |       15.18%
                          Average mapped length |       149.00
                       Number of splices: Total |       1452300
            Number of splices: Annotated (sjdb) |       1157564
                       Number of splices: GT/AG |       1427996
                       Number of splices: GC/AG |       15585
                       Number of splices: AT/AC |       685
               Number of splices: Non-canonical |       8034
                      Mismatch rate per base, % |       0.43%
                         Deletion rate per base |       0.02%
                        Deletion average length |       1.60
                        Insertion rate per base |       0.02%
                       Insertion average length |       1.52
                             MULTI-MAPPING READS:
        Number of reads mapped to multiple loci |       1457762
             % of reads mapped to multiple loci |       4.39%
        Number of reads mapped to too many loci |       26095598
             % of reads mapped to too many loci |       78.64%
                                  UNMAPPED READS:
  Number of reads unmapped: too many mismatches |       0
       % of reads unmapped: too many mismatches |       0.00%
            Number of reads unmapped: too short |       582761
                 % of reads unmapped: too short |       1.76%
                Number of reads unmapped: other |       10452
                     % of reads unmapped: other |       0.03%
                                  CHIMERIC READS:
                       Number of chimeric reads |       0
                            % of chimeric reads |       0.00%
