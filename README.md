# 2024-Ca-channel-manuscript
The pdb file here is an example of the motif with C4 symmetry used to define the framework of the pore.

To design a channel starting from the motif pdb file:

(1) Run the example .sh script to generate the pore-lining secondary structures using RFdiffusion.

(2) Run the example .sh script to generate the protein backbone of the channels with L residues in each monomer using RFdiffusion.

(3) Run the .sh file or .sh file to design sequences on the generated protein backbones using ProteinMPNN or LigandMPNN, respectively.
    - The omit_AA.jsonl file is an example for adding position-specfic amino acid constraints

## Relevant repositores

RFdiffusion: https://github.com/RosettaCommons/RFdiffusion

ProteinMPNN: https://github.com/dauparas/ProteinMPNN

LigandMPNN: https://github.com/dauparas/LigandMPNN
