#!/bin/csh
#$ -M fpancald@nd.edu
#$ -m ae
#$ -r y
#$ -q long
#$ -N job11


module load matlab

matlab -nodisplay -nosplash < job11.m
