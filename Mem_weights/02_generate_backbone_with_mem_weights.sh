#!/bin/bash
# Here we are building the protein backbones by motif-scaffolding the pore helices.
# Specifically,
#   - residues 1-32 on chain A,B,C and D that form the pore helices are the "motif" to be scaffolded;
#   - 70 and 120 residues (randomly sampled) are added at the N-term and C-term of each pore helix, respectively.
# Length of each chain should be identical.

### Specific to diffusion_membrane:
# The weight/checkpoint BFF_100.pt can be found in the link provided in Note.md.
# Use the make_fake_ss_adj.py to generate necessary adj and ss guidance files (these are just empty/fake ones to enable the usage of the specific BFF_100.pt weight/checkpoint). Then update the path for "scaffoldguided.scaffold_dir"

./path/to/run_inference.py --config-name=symmetry contigmap.contigs=[\"70,A1-32,120\ 70,B1-32,120\ 70,C1-32,120\ 70,D1-32,120\"] inference.symmetry='C4' inference.final_step=5 denoiser.noise_scale_ca=0.5 denoiser.noise_scale_frame=0.5 inference.ckpt_override_path=/path/to/model/BFF_100.pt inference.output_prefix=/path/to/output/prefix_ scaffoldguided.scaffoldguided=True scaffoldguided.scaffold_dir=/path/to/fake_scaffold inference.input_pdb=/path/to/01_example_pore_helix.pdb inference.num_designs=100
