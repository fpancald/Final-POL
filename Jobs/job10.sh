#!/bin/csh
#$ -M fpancald@nd.edu
#$ -m ae
#$ -r y
#$ -q long
#$ -N job10


module load matlab

matlab -nodisplay -nosplash < job10.m
