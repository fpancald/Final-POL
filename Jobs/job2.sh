#!/bin/csh
#$ -M fpancald@nd.edu
#$ -m ae
#$ -r y
#$ -q long
#$ -N job2


module load matlab

matlab -nodisplay -nosplash < job2.m
