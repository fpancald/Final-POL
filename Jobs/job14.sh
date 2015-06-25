#!/bin/csh
#$ -M fpancald@nd.edu
#$ -m ae
#$ -r y
#$ -q long
#$ -pe smp 12
#$ -N job14


module load matlab

matlab -nodisplay -nosplash < job14.m
