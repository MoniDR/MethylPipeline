#!/usr/bin/env nextflow

// allows to print information and save it in log exacution file
log.info """\
    C Y T E D - M E T H Y L - N F   
    ===================================
    """
    .stripIndent(true)

process FASTQC {

    publishDir 'results', mode: 'copy', pattern: '*.html'

    input:
    path reads
 
    script:
    """
    fastqc -q $reads
    """
}

workflow {
    reads_ch = Channel.fromPath('/fast/data/fastq/LDT3/*fastq.gz')
    fastqc_ch = FASTQC(reads_ch)
}
