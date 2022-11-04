biocolllection ID is the key ID that links different data sets together.
It is the for the samples collected at particular time point of a participant.
The collected samples include blood, nasal swab and EDTA.
biocolllection ID is the concatenation of "20_" and "participant ID"
and "-T" and "sample collection time (days since T0)".

The title of the sample in the RNA-seq data is the biocolllection ID suffixed with plate number.

1. samples_lists.xlsx:
  This file has four sheets, each sheet gives the collections of samples
  that are used in each study. Please note that some blood samples (represented
  by the biocollection ID) can be assayed in more than one RNA-seq plate.  

2. PCR_and_Symptoms_Full_Info.xlsx:
  This file gives all the detailed PCR test on the SARS-CoV-2 virus and also
  the self reported symptoms information on all time points that we collected
  for all participants in this RNA-seq data set. Please note that we don't
  necessarily have the RNA-seq data on all time points in this file due to
  possibly two reasons: no blood is collected at this time point or no RNA-seq
  has been performed on the blood at this time point. 
