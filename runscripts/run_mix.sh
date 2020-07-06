#!/bin/bash
if [ -z "$1" ]; then
    echo "output dir must be given"     
    echo "./run_mix.sh <outdir> <reaction> <suffix> [-DONTMERGE]" 
    exit;
fi
outdir=$1
shift;
if [ -z "$1" ]; then
    echo "reaction must be given"     
    echo "./run_mix.sh <outdir> <reaction> <suffix> [-DONTMERGE]" 
    exit;
fi
REACT=$1
shift;
if [ -z "$1" ]; then
    echo "suffix must be given"     
    echo "./run_mix.sh <outdir> <reaction> <suffix> [-DONTMERGE]" 
    exit;
fi
SUFF=$1
shift;
MERGE=true
if [ "$1" == "-DONTMERGE" ]; then
    MERGE=false
fi

source ~/.bashrc
echo $LD_LIBRARY_PATH
ps
fn="`ls *.root | head -1`"
BN=10
BS="`root -l -q -b $fn -e "Long64_t Ne = evData->GetEntries();(int)ceil((double)Ne/$BN)" | tail -1 | awk '{print $2}'`"
#### setting reaction and output file suffix ###

################################################

count=0
st=0
for i in $(seq 0 $(($BN-1)) ); do
    ./particle_mix_tree -r $REACT -s $st -n $BS -o pmix_${count}.root -f $fn -q
    count=$(( $count + 1 ))
    st=$(( $st + $BS ))
done;
wait
echo "outdir: "$outdir
if $MERGE; then
    hadd pmix_all.root pmix_*.root
    swif outfile pmix_all.root file:$outdir/${fn/.root/}_${SUFF}.root
else
    count=0
    for i in $(seq 0 $(($BN-1)) ); do
	swif outfile pmix_${count}.root file:$outdir/${fn/.root/}_${SUFF}_${count}.root
	count=$(( $count + 1 ))
    done;
fi
