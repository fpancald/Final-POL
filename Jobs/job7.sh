#!/bin/csh
#$ -M fpancald@nd.edu
#$ -m ae
#$ -r y
#$ -q long
#$ -N job7


module load matlab

matlab -nodisplay -nosplash < job7.m
