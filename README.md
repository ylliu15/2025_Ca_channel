# 2025-Ca-channel-manuscript

Here shows the example commands to design a Ca channel from defined selectivity filter geometry.


## Relevant repositories

RFdiffusion: https://github.com/RosettaCommons/RFdiffusion

ProteinMPNN: https://github.com/dauparas/ProteinMPNN

LigandMPNN: https://github.com/dauparas/LigandMPNN

AlphaFold2: https://github.com/google-deepmind/alphafold

AlphaFold3: https://alphafoldserver.com/welcome

### Step 1: Pore helix generation.

- The `00_example_motif.pdb` is used as the input at this step. It shows the residues that define the selectivity filer and the pore exit.
    - One more residue (regardless of amino acid identity) is needed to add to both N- and C-term of the motif residue for RFdiffusion to work.
- Set up the environment (SE3nv) for running RFdiffusion (see RFdiffusion repository).
- Run the `01_make_helix.sh` to build the pore helices. This step normally takes less than 10 mintues per job (depending on the length of the pore helices).
- The output will look like `01_example_pore_helix.pdb`. 

### Step 2: Protein backbone generation

- The pore helices generated at step 1 (e.g., `01_example_pore_helix.pdb`) are used as the input at this step.
- Set up the environment (SE3nv) for running RFdiffusion.
- Run the `02_generate_backbone.sh` to build the protein scaffold. This step normally takes 30-60 minutes per job for a protein backbone consisting of 600-800 amino acids.
- A good output will look like `02_example_backbone.pdb`.
  
### Step 3: Protein sequence design

- The protein backbone generated at step 2 (e.g., `02_example_backbone.pdb`) is used as the input at this step.
- Set up the environment (mlfold) for running ProteinMPNN (see ProteinMPNN repository).
- Run the `03_sequence_design_MPNN.sh` to design sequences on the protein backbone. This step normally takes 30 minutes to generate 50-100 sequences per input protein backbone.
- Optional: To exclude specific amino acids at specific positions, edit and use the `example_omit_AA.jsonl`.
  - Instructions on editing/making new `example_omit_AA.jsonl` files can be found inside `03_sequence_design_MPNN.sh`.

### To predict the structures encoded by the generated sequences, AlphaFold2 or AlphaFold3 can be used (links attached above).

