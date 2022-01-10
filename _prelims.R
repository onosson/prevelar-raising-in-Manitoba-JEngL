############################################################
# CHANGE THIS SETTING TO CONTROL DATA LOADING MANUALLY
#
# 0 = skip, 1 = run
reload_all_data <- 0

if (reload_all_data==1) {
  rm(list=ls())
  reload_all_data <- 1}

if (!exists("FAVE_data")) {reload_all_data <- 1}

# Set the percentage of outlier tokens to exclude
excluded_range <- 0.25
do_clean <- 1 # force running of data clean process (automatically runs if new datafiles detected)

never_delete <- c("FAVE_clean","FAVE_data","LIPP_FAVE_EuroWinn","LIPP_FAVE_FiliWinn","LIPP_FAVE_MennEast","LIPP_FAVE_MennWest","never_delete")

############################################################
# load packages
library(tidyverse)
library(stringr)
library(patchwork)
library(ggrepel)
library(ggforce)
library(ggstatsplot)
library(viridis)
library(extrafont)
library(Cairo)
library(sjPlot)
library(lme4)
library(purrr)
library(broom.mixed)
library(formattable)

############################################################
# PRELIMINARIES

# clean up
gc()

# if reload required, first check if files exist -- deleting FAVE_clean.csv will load all data individually
if (reload_all_data==1) {
  if(file.exists("FAVE_clean.csv")) {
    FAVE_data <- read_csv("FAVE_data.csv")
    FAVE_clean <- read_csv("FAVE_clean.csv")
    reload_all_data <- 0
  }
}

# re-load FAVE data; defunct since all files have been transcribed
# if (reload_all_data==1) {source("_FAVE_LOAD_DATA.R")}

############################################################
# CLEAN UP
rm(list=ls()[! ls() %in% never_delete])
