#!/bin/bash
# Here we are doing sequence design on the protein backbones.
# This script needs to run in a subdirectory of ProteinMPNN repository. 
# For example:
#   1. Download ProteinMPNN (https://github.com/dauparas/ProteinMPNN).
#   2. Setup the "mlfold" conda environment (see README in the ProteinMPNN repository).
#   3. Make a directory in the main folder with ProteinMPNN (e.g., submit).
#   4. Copy this script into the folder made in step 3.


source activate mlfold

# Path to the folder that contains the protein backbones to be sequence designed.
path="/path/to/protein/backbone"

folder_with_pdbs=$path
path_for_parsed_chains=$path"/parsed_pdbs.jsonl"
path_for_assigned_chains=$path"/assigned_pdbs.jsonl"
path_for_tied_positions=$path"/tied_pdbs.jsonl"

# Indicate which chain(s) to design.
chains_to_design="A B C D"

path_for_fixed_positions=$path"/fixed_pdbs_0_2.jsonl"

# Path to the omit_AA.jsonl file
path_for_omit_AA=$path"/example_omit_AA.jsonl"
# See the example_omit_AA.jsonl as a guide to custom change the position and type of amino acid for a specific residue.
# Format: {"pdb_name": {"A": [[[1, 2], "DERK"], [[3,4], "AILV"]]}, {"B": [[[1, 2], "DERK"], [[3,4], "AILV"]]}}
# This means for the pdb file called "pdb_name" (without the ".pdb" suffix), the amino acids DERK are excluded on residue 1-2 on chain A and chain B, and the amino acids AILV are excluded on residue 3-4 on chain A and chain B.

path_for_designed_sequences=$path

# Indicate which residue(s) to be fixed during the sequence design step.
fixed_positions="112, 112, 112, 112"


python ../helper_scripts/parse_multiple_chains.py --input_path=$folder_with_pdbs --output_path=$path_for_parsed_chains

python ../helper_scripts/assign_fixed_chains.py --input_path=$path_for_parsed_chains --output_path=$path_for_assigned_chains --chain_list "$chains_to_design"

python ../helper_scripts/make_fixed_positions_dict.py --input_path=$path_for_parsed_chains --output_path=$path_for_fixed_positions --chain_list "$chains_to_design" --position_list "$fixed_positions"

python ../helper_scripts/make_tied_positions_dict.py --input_path=$path_for_parsed_chains --output_path=$path_for_tied_positions --homooligomer 1

python ../protein_mpnn_run.py \
        --jsonl_path $path_for_parsed_chains \
        --chain_id_jsonl $path_for_assigned_chains \
        --tied_positions_jsonl $path_for_tied_positions \
        --fixed_positions_jsonl $path_for_fixed_positions \
        --out_folder $path_for_designed_sequences \
        --num_seq_per_target 50 \
        --sampling_temp "0.2" \
        --omit_AA_jsonl $path_for_omit_AA \
        --batch_size 8 \
        --pack_side_chains 1 \
        --use_seed 1 \
        --seed 13 