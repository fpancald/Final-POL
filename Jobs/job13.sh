#!/bin/csh
#$ -M fpancald@nd.edu
#$ -m ae
#$ -r y
#$ -q long
#$ -N job13


module load matlab

matlab -nodisplay -nosplash < job13.m
