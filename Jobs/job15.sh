#!/bin/csh
#$ -M fpancald@nd.edu
#$ -m ae
#$ -r y
#$ -q long
#$ -N job15


module load matlab

matlab -nodisplay -nosplash < job15.m
