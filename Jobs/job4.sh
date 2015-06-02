#!/bin/csh
#$ -M fpancald@nd.edu
#$ -m ae
#$ -r y
#$ -q long
#$ -N job4


module load matlab

matlab -nodisplay -nosplash < job4.m
