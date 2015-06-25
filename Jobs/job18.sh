#!/bin/csh
#$ -M fpancald@nd.edu
#$ -m ae
#$ -r y
#$ -q long
#$ -N job18


module load matlab

matlab -nodisplay -nosplash < job18.m
