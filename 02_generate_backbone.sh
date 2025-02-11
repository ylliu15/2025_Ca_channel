#!/bin/bash
# Here we are building the protein backbones by motif-scaffolding the pore helices.
# Specifically,
#   - residues 1-32 on chain A,B,C and D that form the pore helices are the "motif" to be scaffolded;
#   - 70 and 120 residues (randomly sampled) are added at the N-term and C-term of each pore helix, respectively.
# Length of each chain should be identical.

./path/to/run_inference.py --config-name=symmetry contigmap.contigs=[\"70,A1-32,120\ 70,B1-32,120\ 70,C1-32,120\ 70,D1-32,120\"] inference.symmetry='C4' inference.output_prefix=/path/to/output/prefix_ inference.input_pdb=/path/to/01_example_pore_helix.pdb inference.num_designs=100
