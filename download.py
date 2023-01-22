import synapseclient 
import synapseutils 

syn = synapseclient.Synapse() 
syn.login('username','password') 
files = synapseutils.syncFromSynapse(syn, 'syn3193805',path='D:\\UNETR') 
for f in files:
    print(f.path)
    