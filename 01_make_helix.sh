#!/bin/bash
# Here we are building pore helices by motif-scaffolding the pore-definnig residues.
# Specifically,
#   - residue 1-3 and 4-6 on chain A,B,C and D are the pore-defining residues to be scaffolded;
#   - 27 residues (randomly sampled) are added bewteen residue 1-3 and residue 4-6.
# Length of each chain should be identical.

./path/to/run_inference.py --config-name=symmetry contigmap.contigs=[\"A1-3,27,A4-6\ B1-3,27,B4-6\ C1-3,27,C4-6\ D1-3,27,D4-6\"] inference.symmetry='C4' inference.output_prefix=/path/to/output/prefix_ inference.input_pdb=/path/to/00_example_motif.pdb inference.num_designs=50
