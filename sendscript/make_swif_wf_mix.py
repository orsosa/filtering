#!/usr/bin/env python
import glob
import os
from sys import argv
import subprocess
from optparse import OptionParser

track = "analysis"
parser = OptionParser()
parser.add_option("-o","--outpath", action="store", type="string",dest="outdir", help="path to store the output files", metavar="<OUTDIR>")
parser.add_option("-l", "--file-list", action="store", type="string", dest="filelist", help="input file list", metavar="<FILELIST>")
parser.add_option("-s", "--suffix", action="store", type="string", dest="suff", help="suffix for output file", metavar="<SUFF>")
parser.add_option("-r", "--reaction", action="store", type="string", dest="react", help="reaction. e.g.: :pi+_pi-", metavar="<REACT>")
parser.add_option("-d", "--debug", action="store_true", dest="debug", default=False, help="set debug run. [default %default]")
parser.add_option("-m", "--no-merge", action="store_true", dest="merge", default=False, help="don't merge results. [default %default]")
parser.add_option("-w", "--workflow", action="store", type="string", dest="workflow", help="worflow name", metavar="<WF>")

(opt, args) = parser.parse_args()
############## global setting ###########
app="/home/osoto/Clas12AnaHipo4/examples/particle_mix_tree"
script="/home/osoto/dihadron/filtering/runscripts/run_mix.sh"
WF = opt.workflow
outdir=opt.outdir
FILELIST=opt.filelist
REACT=opt.react
SUFF=opt.suff
DEBUG = opt.debug
MERGE = ""
if opt.merge:
    MERGE="-DONTMERGE"
if (DEBUG):
    track = "debug"
##########################################################
####### check dir ####
def checkdir(path):
    if not os.path.isdir(path):
        print "The directory " + path + " does not exist"
        print "creating it"
        cmd = "mkdir -p " + path
        subprocess.call(cmd,shell=True)
        return 0

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
    global outdir, app, script,opt
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
    checkdir(outdir)
    cmd += " ./" + script.split("/")[-1] + " " + outdir + " " + REACT + " " + SUFF + " " + MERGE
    if DEBUG : print (cmd)
    subprocess.call(cmd,shell=True)

######### create workflow #####
def create_wf():
    global WF,opt
    cmd="swif create " + WF
    if DEBUG : print (cmd)
    subprocess.call(cmd,shell=True)

#### run workflow ############
def run_wf():
    global WF,opt
    cmd="swif run -workflow " + WF
    subprocess.check_call(cmd.split(" "))

######## main routine ####

def main():
    global WF,opt
    create_wf()
    flist = import_flist(FILELIST)
    c=0
    for fn in flist:
        add_job(fn,WF,c)
        c = c+1
        if ( track=="debug") and (c>0): break
if __name__=="__main__":
    main()
    run_wf()

