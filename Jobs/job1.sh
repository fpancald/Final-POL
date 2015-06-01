#!/bin/csh
#$ -M fpancald@nd.edu
#$ -m ae
#$ -r y
#$ -q short
#$ -N job1


module load matlab

matlab -nodisplay -nosplash < job1.m
