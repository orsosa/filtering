#!/bin/bash
outdir=$1
nth=$2
mkdir outfiles
echo $LD_LIBRARY_PATH
ps

fn="`ls *.hipo | head -1`"

./get_simple_tree_th_mf -nth $nth -s $fn
hadd outfiles/pruned_simulH4.root outfiles/pruned_simulH4_[0-9]*.root

swif outfile outfiles/pruned_simulH4.root file:$outdir/${fn/.hipo/.root}
