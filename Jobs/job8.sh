#!/bin/csh
#$ -M fpancald@nd.edu
#$ -m ae
#$ -r y
#$ -q long
#$ -N job8


module load matlab

matlab -nodisplay -nosplash < job8.m
