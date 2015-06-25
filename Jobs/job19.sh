#!/bin/csh
#$ -M fpancald@nd.edu
#$ -m ae
#$ -r y
#$ -q long
#$ -N job19


module load matlab

matlab -nodisplay -nosplash < job19.m
