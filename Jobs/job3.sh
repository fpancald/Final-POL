#!/bin/csh
#$ -M fpancald@nd.edu
#$ -m ae
#$ -r y
#$ -q long
#$ -N job3


module load matlab

matlab -nodisplay -nosplash < job3.m
