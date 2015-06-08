#!/bin/csh
#$ -M fpancald@nd.edu
#$ -m ae
#$ -r y
#$ -q long
#$ -N job6


module load matlab

matlab -nodisplay -nosplash < job6.m
