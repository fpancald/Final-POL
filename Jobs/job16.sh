#!/bin/csh
#$ -M fpancald@nd.edu
#$ -m ae
#$ -r y
#$ -q long
#$ -pe smp 12
#$ -N job16


module load matlab

matlab -nodisplay -nosplash < job16.m
