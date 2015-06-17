#!/bin/csh
#$ -M fpancald@nd.edu
#$ -m ae
#$ -r y
#$ -q long
#$ -N job12


module load matlab

matlab -nodisplay -nosplash < job12.m
