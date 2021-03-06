This repository contains the various R files that I used to analyze data and create visualizations for the upcoming paper "Prevelar Raising and Merger in Manitoba English", which has been accepted for publication at the Journal of English Linguistics, pending revisions (hopefully to appear in 2022).

Most of these scripts will not run properly without the associated data files, which are not contained in this repository. The data itself derives from the Languages in the Prairies Project overseen by Dr. Nicole Rosen at the University of Manitoba, and is not open-source, so cannot be included here. The scripts themselves are my own, and I provide them here in case they may prove useful to anyone.

- **_prelims.R** is a common source that loads the LIPP data and packages required by other scripts
- **city_pop.R** generates a bar chart of cross-provincial populations
- **Demographics.Rmd** produces a compilation of data and demographic information for the LIPP participants
- **density_plots.Rmd** produces vowel density distributions in F1 x F2 space
- **duration_boxplots.Rmd** productions vowel duration boxplots
- **lbms_schematic.R** replicates figure 1.1 from the Introduction to "The Low-Back-Merger Shift: Uniting the Canadian Vowel Shift, the California Vowel Shift, and Short Front Vowel Shifts across North America" (Kara Becker, 2019, Publication of the American Dialect Society 104(1), p. 1)
- **maps.Rmd** produces a map of North America identifying prevelar raising regions.
- **MB_vowels.Rmd** enerates plots of the LIPP mean vowel positions in F1 x F2 space
- **prevelar_schematic.R** modifies figure 1.1 from the Introduction to "The Low-Back-Merger Shift: Uniting the Canadian Vowel Shift, the California Vowel Shift, and Short Front Vowel Shifts across North America" (Kara Becker, 2019, Publication of the American Dialect Society 104(1), p. 1)
- **trajectories.Rmd** produces GAMMs plots

