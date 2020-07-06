#!/usr/bin/env python

import glob
import os
from sys import argv
import subprocess
############## global setting ###########
outdir="/volatile/clas12/users/osoto/data/mix/RGA/trains/v16_v2"
app="/home/osoto/Clas12AnaHipo4/examples/particle_mix_tree"
script="/home/osoto/dihadron/filtering/runscripts/run_mix_pippimaa.sh"
WF="pippimaa_dstRGA"
DEBUG=False
track="analysis"
####### get file list in path given the regexp ####
def get_file_list(path,regexp="*.root"):
    flist=glob.glob(path + "/" + regexp)
    return flist

###### import file list from file ############
def import_flist(fname):
    infile=open(fname)
    flist=[]
    for line in infile:
        flist.append(line.strip())
    return flist

##### add job to workflow
def add_job(fname,wf,c=0):
    global outdir, app, script
    size = os.path.getsize(fname)/1024./1024.*1.15
    fn = fname.split("/")[-1]
    jname = wf + "_" + str(c)
    cmd  = "swif add-job -workflow " + wf + " -ram 650mb -project clas12 -disk " + "{0:.0f}".format(size) + "mb "
    cmd += " -name " + jname
    cmd += " -track " + track
    #cmd += " -cores 10"
    cmd += " -shell /bin/bash" 
    cmd += " -input " + app.split("/")[-1] + " file:" + app
    cmd += " -input " + fn + " file:" + fname
    cmd += " -input " + script.split("/")[-1] + " file:" + script
    cmd += " ./" + script.split("/")[-1] + " " + outdir
    if DEBUG : print (cmd)
    subprocess.call(cmd,shell=True)

######### create workflow #####
def create_wf():
    global WF
    cmd="swif create " + WF
    if DEBUG : print (cmd)
    subprocess.call(cmd,shell=True)

#### run workflow ############
def run_wf():
    global WF
    cmd="swif run -workflow " + WF
    subprocess.check_call(cmd.split(" "))

######## main routine ####

def main():
    global WF
    create_wf()
    flist = import_flist("filelist/rga_dst_evdata_trains_v16_v2.txt")
    c=0
    for fn in flist:
        add_job(fn,WF,c)
        c = c+1
        if ( track=="debug") and (c>0): break
if __name__=="__main__":
    main()
    run_wf()

