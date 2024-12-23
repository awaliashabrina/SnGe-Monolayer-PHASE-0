#!/bin/bash

#SBATCH --ntasks=16               # Contoh menggunakan 64 core CPU
#SBATCH --mem=32GB               # Contoh menggunakan RAM 128GB
#SBATCH --time=48:00:00           # Contoh menetapkan walltime maks 10 jam
#SBATCH --output=result-%j.out    # Output terminal program
#SBATCH --error=result-%j.err     # Output verbose program

# Memuat modul PHASE/0
# module load phase0/2020.02-GCC11-MKL-FFTW3-LibM
module load phase0/2021.02-GCC11-MKL-FFTW3-LibM

# RUN COMMAND
# mpirun wajib menggunakan flag protokol UCX
# mpirun -np $SLURM_NTASKS phase
# mpirun -np $SLURM_NTASKS --mca pml ucx --mca osc ucx phase

mpirun -np $SLURM_NTASKS --mca osc ucx phase
