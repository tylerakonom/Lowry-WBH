# Whole-blood transcriptomic response to whole-body hyperthermia in participants with major depressive disorder

Tyler N. Akonom, Mary A. Allen, Tommy K. Begay, Charles L. Raison, Christopher A. Lowry

For submission in [Brain, Behavior, and Immunity](https://www.sciencedirect.com/journal/brain-behavior-and-immunity). July 2025.


## Abstract

Depression is the leading cause of global disability according to the World Health Organization, and Major Depressive Disorder (MDD) makes up a majority of these cases. Current pharmacological interventions suffer from significant limitations and side effects, highlighting a need for novel therapeutic approaches. Whole-body hyperthermia (WBH) has been identified as a promising avenue of treatment; however, a comprehensive understanding of the mechanisms responsible for the antidepressant effects of WBH remains elusive. In this study we utilized high-throughput RNA sequencing (RNA-seq) to compare the whole-blood transcriptomic response, 30 minutes post intervention, of participants with MDD exposed to WBH or sham WBH. Briefly, 34 individuals with moderate to severe MDD (HDRS score > 16) were randomized to a WBH (n = 17) or sham WBH (n = 17) condition. Of 34 participants who were randomized, 22 participants provided blood samples (13 WBH and 9 sham WBH) that were available for sequencing, and 18 participants provided blood samples (9 WBH [33% female] and 9 sham WBH [44% female]) that were included in final RNA-seq analysis. Through differentially expressed gene (DEG) analysis with a false discovery rate (FDR) adjusted p-value (q-value) < 0.01 we identified 17 upregulated DEGs including multiple genes encoding heat-shock proteins (e.g., HSP70 [HSPA1A, HSPA1B, HSPA4], HSP90 [HSP90AB1, HSP90AA1], and HSP110 families [HSPH1]). Resulting log-fold changes and unadjusted p-values for all genes were used in Gene Set Enrichment Analysis (GSEA), which identified enriched (family-wise error rate-adjusted p-value < 0.05) biological processes (BPs) including “chaperone mediated protein folding”, “chaperone cofactor dependent protein refolding”, “cellular response to heat”, “positive regulation of response to cytokine stimulus”, “B cell receptor signaling pathway”, “peptide antigen assembly with MHC protein complex”, “positive regulation of type I interferon production”, and “positive regulation of interferon beta production”. These data identify novel genes and BPs that warrant further investigation as potential mediators of the antidepressant effects of WBH.


## Background

We set out to identify changes in gene expression and biological processes in participants with major depressive disorder immediately post intervention by whole-body hyperthermia versus sham whole-body hyperthermia as a follow-up to []Janssen et al.](https://jamanetwork.com/journals/jamapsychiatry/fullarticle/2521478).
 
## Data Processing

*Getting raw reads ready for analysis.*

All files were uploaded to the Alpine module as part of the research computing program at CU Boulder. Basic tutorials on how to work with the RC computing environment and FAQs are located [here](https://curc.readthedocs.io/en/latest/). All files were uploaded to the users scratch folder, then processed. Software was called from the container located in the Alpine module at:

	/projects/lowryc/software/containers/


#### Pre-processing

Pre-processing scripts were completed using shell commands located [here](https://github.com/tylerakonom/Lowry-WBH/tree/main/shell_scripts). Raw reads were trimmed with [trimReads.sh](https://github.com/tylerakonom/Lowry-WBH/blob/main/shell_scripts/trimReads.sh), aligned with [alignReads.sh](https://github.com/tylerakonom/Lowry-WBH/blob/main/shell_scripts/alignReads.sh), and annotated / counted in R with [rsubread.Rmd](https://github.com/tylerakonom/Lowry-WBH/blob/main/r_scripts/rsubread.Rmd).

#### Differential Expression

Differential expression was analyzed using [wbh_deseq2.Rmd](https://github.com/tylerakonom/Lowry-WBH/blob/main/r_scripts/wbh_deseq2.Rmd) with a threshold set at a false-discovery rate-adjusted *p*-value < 0.01.