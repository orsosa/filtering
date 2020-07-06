#!/usr/bin/env python
import glob
import os
from sys import argv
import subprocess
############## global setting ###########
#outdir="/volatile/clas12/users/osoto/sim"
#outdir="/volatile/clas12/users/osoto/data/skim4March"
#outdir="/volatile/clas12/users/osoto/sim/H500_0_test"
#outdir="/volatile/clas12/users/osoto/sim/cooked631"
#outdir="/volatile/clas12/users/osoto/sim/GA_Oct28"
outdir="/volatile/clas12/users/osoto/sim/GA_Jan2020"
app="/home/osoto/Clas12AnaHipo4/examples/get_simple_tree_th_mf"
script="/home/osoto/dihadron/filtering/runscripts/run_sim.sh"
WF="sim_ga"
#flist=import_flist("simdata.txt")
#flist=import_flist("simfiles_noasym.txt")
#flist =import_flist("simfiles_avakian.txt")
#flist = import_flist("simfiles_march-19.txt")
#flist = import_flist("simfiles_H500_test.txt")
#flist = import_flist("simfiles_ha_cooked631.txt")
if len(argv)<4:
    print "you must give <WFname> <filelist> and <output path> optionally [RAM (mb)] [NCORES]"
    exit(1)

WF = argv[1]
outdir = argv[3]
FILELIST = argv[2]

RAM = "7000" # mb
NCORES = "5"

if len(argv)==5:
    RAM = argv[4]

if len(argv)==6:
    NCORES = argv[5]

DEBUG=False
####### get file list in path given the regexp ####
def get_file_list(path,regexp="*.hipo"):
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
    global outdir, app, script, NCORES, RAM
    size=os.path.getsize(fname)/1024./1024.*1.15
    fn=fname.split("/")[-1]
    jname = wf + "_" + str(c)
    #cmd="swif add-job -workflow " + wf + " -time 10min -project clas12 -track analysis -disk " + "{0:.0f}".format(size) + "mb "
    cmd = "swif add-job -workflow " + wf + " -time 48h -project clas12 -track analysis -disk " + "{0:.0f}".format(size) + "mb "
    cmd += " -cores " + NCORES
    cmd += " -ram "+ RAM +"mb"
    cmd += " -name " + jname
    cmd += " -input " + app.split("/")[-1] + " file:" + app
    cmd += " -input " + fn + " file:" + fname
    cmd += " -input " + script.split("/")[-1] + " file:" + script   
    cmd += " ./" + script.split("/")[-1] + " " + outdir + " " + NCORES
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
    global WF,FILELIST
    create_wf()
    flist = import_flist(FILELIST)
    #flist = import_flist("simfiles_ha_cooked631_parj03.txt")
    c=0
    for fn in flist:
        add_job(fn,WF,c)
        c = c+1
if __name__=="__main__":
    main()
    run_wf()

