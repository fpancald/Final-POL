#!/bin/csh
#$ -M fpancald@nd.edu
#$ -m ae
#$ -r y
#$ -q long
#$ -N job17


module load matlab

matlab -nodisplay -nosplash < job17.m
