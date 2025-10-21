#!/software/conda/envs/PPI_design/bin/python
import os,sys,glob,torch

# here 888 is the length of the full protein complex - change accordingly
ss=torch.full((888,), 3).float() # 3 is mask
adj=torch.full((888,888), 2).float() # 2 is mask
torch.save(ss, '/path/to/fake_scaffold/fake_ss.pt')
torch.save(adj, '/path/to/fake_scaffold/fake_adj.pt')
