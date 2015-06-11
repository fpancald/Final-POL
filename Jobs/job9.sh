#!/bin/csh
#$ -M fpancald@nd.edu
#$ -m ae
#$ -r y
#$ -q long
#$ -N job9


module load matlab

matlab -nodisplay -nosplash < job9.m
