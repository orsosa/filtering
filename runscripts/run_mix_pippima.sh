#!/bin/bash
outdir=$1
source ~/.bashrc
echo $LD_LIBRARY_PATH
ps
fn="`ls *.root | head -1`"
BN=10
BS="`root -l -q -b $fn -e "Long64_t Ne = evData->GetEntries();(int)ceil((double)Ne/$BN)" | tail -1 | awk '{print $2}'`"
#### setting reaction and output file suffix ###
REACT=":pi+_pi-_gamma"
SUFF="pippima_all"
################################################

count=0
st=0
for i in $(seq 0 $BN); do
    ./particle_mix_tree -r $REACT -s $st -n $BS -o pmix_${count}.root -f $fn
    count=$(( $count + 1 ))
    st=$(( $st + $BS ))
done;
wait
hadd pmix_all.root pmix_*.root

echo "outdir: "$outdir

swif outfile pmix_all.root file:$outdir/${fn/.root/}_${SUFF}.root


