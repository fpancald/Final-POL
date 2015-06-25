#!/bin/csh
#$ -M fpancald@nd.edu
#$ -m ae
#$ -r y
#$ -q long
#$ -N job16


module load matlab

matlab -nodisplay -nosplash < job16.m
