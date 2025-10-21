#!/bin/bash
# Here we are doing sequence design on the protein backbones.
# This script needs to run in a subdirectory of LigandMPNN repository. 
# For example:
#   1. Download LigandMPNN (https://github.com/dauparas/LigandMPNN).
#   2. Setup the conda or other environment (see README in the LigandMPNN repository).
#   3. Copy this script into the folder with LigandMPNN and run this script.


## --model_type: Select "per_residue_label_membrane_mpnn" for ProteinMPNN with per residue membrane label
## --pdb_path: Path to the folder that contains the protein backbones to be sequence designed.
## --out_folder: The folder that will contain the designed sequences.
## --batch_size: How many sequences to design for each batch
## --number_of_batches: Batch size
## --fixed_residues: Which residue(s) to be fixed during the sequence design step.
## --temperature: the sampling temperature in MPNN
## --omit_AA_per_residue: Specify what residues are exluded for each position. Format: {"A100": "DENQRKYW"}. See the example_ligandmpnn_omit_AA_per_res.json as a guide to custom change the position and type of amino acid for a specific residue.

##--pack_side_chains and --repack_everything will pack the side chains. Optional for quick visualization of the output. 

##--transmembrane_buried: The positions specified to be buried (hydrophobic), largely the residues that are designed to be exposed to the lipid within the membrane.

##--homo_oligomer: Set to 1 if designing a homo-oligomer, and to 0 if not.

python run.py --model_type "per_residue_label_membrane_mpnn" \
        --pdb_path "/path/to/pdb" \
        --out_folder "/path/to/designed_sequences" \
        --batch_size 50 \
        --number_of_batches 1 \
        --fixed_residues "A112 B112 C112 D112" \
        --temperature 0.1 \
        --omit_AA_per_residue "/path/to/example_ligandmpnn_omit_AA_per_res.json" \
        --pack_side_chains 1 \
        --repack_everything 1 \
        --transmembrane_buried "A15 A16 A19 A23 A26 A27 A30 A34 A37 A86 A123 A127 A130 A134 A137 A141 A144 A145 A181 A188 A203 A206 A207 A209 A210 A213 A214 A216 A217 A220 A221 A224 A225 A227 B15 B16 B19 B23 B26 B27 B30 B34 B37 B86 B123 B127 B130 B134 B137 B141 B144 B145 B181 B188 B203 B206 B207 B209 B210 B213 B214 B216 B217 B220 B221 B224 B225 B227 C15 C16 C19 C23 C26 C27 C30 C34 C37 C86 C123 C127 C130 C134 C137 C141 C144 C145 C181 C188 C203 C206 C207 C209 C210 C213 C214 C216 C217 C220 C221 C224 C225 C227 D15 D16 D19 D23 D26 D27 D30 D34 D37 D86 D123 D127 D130 D134 D137 D141 D144 D145 D181 D188 D203 D206 D207 D209 D210 D213 D214 D216 D217 D220 D221 D224 D225 D227"\
        --seed 13 \
        --homo_oligomer 1