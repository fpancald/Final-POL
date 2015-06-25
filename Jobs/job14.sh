#!/bin/csh
#$ -M fpancald@nd.edu
#$ -m ae
#$ -r y
#$ -q long
#$ -N job14


module load matlab

matlab -nodisplay -nosplash < job14.m
