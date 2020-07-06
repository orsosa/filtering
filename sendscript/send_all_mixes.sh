#!/bin/bash 
## pippim
/home/osoto/dihadron/filtering/sendscript/make_swif_wf_mix.py -l /home/osoto/dihadron/filtering/filelist/simGA_jun2020.txt -o /volatile/clas12/users/osoto/sim/mix -r :pi+_pi- -s pippim_all -w pippim_simga_jun2020 -m

# ## pipaa
# /home/osoto/dihadron/filtering/sendscript/make_swif_wf_mix.py -l /home/osoto/dihadron/filtering/filelist/simGA_jun2020_last.txt -o /volatile/clas12/users/osoto/sim/mix -r :pi+_gamma_gamma -s pipaa_all -w pipaa_simga_jun2020 -m

# ## pimaa
# /home/osoto/dihadron/filtering/sendscript/make_swif_wf_mix.py -l /home/osoto/dihadron/filtering/filelist/simGA_jun2020_last.txt -o /volatile/clas12/users/osoto/sim/mix -r :pi-_gamma_gamma -s pimaa_all -w pimaa_simga_jun2020 -m


# ## pippim
# /home/osoto/dihadron/filtering/sendscript/make_swif_wf_mix.py -l /home/osoto/dihadron/filtering/filelist/simGA_oct2019.txt -o /volatile/clas12/users/osoto/sim/mix -r :pi+_pi- -s pippim_all -w pippim_rgaob_simga_2019

# ## pipaa
# /home/osoto/dihadron/filtering/sendscript/make_swif_wf_mix.py -l /home/osoto/dihadron/filtering/filelist/simGA_oct2019.txt -o /volatile/clas12/users/osoto/sim/mix -r :pi+_gamma_gamma -s pipaa_all -w pipaa_simga_2019

# ## pimaa
# /home/osoto/dihadron/filtering/sendscript/make_swif_wf_mix.py -l /home/osoto/dihadron/filtering/filelist/simGA_oct2019.txt -o /volatile/clas12/users/osoto/sim/mix -r :pi-_gamma_gamma -s pimaa_all -w pimaa_simga_2019


# ## pippim
# /home/osoto/dihadron/filtering/sendscript/make_swif_wf_mix.py -l /home/osoto/dihadron/filtering/filelist/rgaob_dst_evdata_pass1_v0.txt -o /volatile/clas12/users/osoto/data/mix/RGAOB/trains/pass1/v0 -r :pi+_pi- -s pippim_all -w pippim_rgaob_pass1 -d

# ## pipaa
# /home/osoto/dihadron/filtering/sendscript/make_swif_wf_mix.py -l /home/osoto/dihadron/filtering/filelist/rgaob_dst_evdata_pass1_v0.txt -o /volatile/clas12/users/osoto/data/mix/RGAOB/trains/pass1/v0 -r :pi+_gamma_gamma -s pipaa_all -w pipaa_rgaob_pass1 -d

# ## pimaa
# /home/osoto/dihadron/filtering/sendscript/make_swif_wf_mix.py -l /home/osoto/dihadron/filtering/filelist/rgaob_dst_evdata_pass1_v0.txt -o /volatile/clas12/users/osoto/data/mix/RGAOB/trains/pass1/v0 -r :pi-_gamma_gamma -s pimaa_all -w pimaa_rgaob_pass1 -d

## pippim
# /home/osoto/dihadron/filtering/sendscript/make_swif_wf_mix.py -l /home/osoto/dihadron/filtering/filelist/rga_evdata_dst_pass1_v0.txt -o /volatile/clas12/users/osoto/data/mix/RGA/trains/pass1/v0 -r :pi+_pi- -s pippim_all -w pippim_rga_pass1

# ##pimpim
# /home/osoto/dihadron/filtering/sendscript/make_swif_wf_mix.py -l /home/osoto/dihadron/filtering/filelist/rga_evdata_dst_pass1_v0.txt -o /volatile/clas12/users/osoto/data/mix/RGA/trains/pass1/v0 -r :pi-_pi- -s pimpim_all -w pimpim_rga_pass1

# ##pippip
# /home/osoto/dihadron/filtering/sendscript/make_swif_wf_mix.py -l /home/osoto/dihadron/filtering/filelist/rga_evdata_dst_pass1_v0.txt -o /volatile/clas12/users/osoto/data/mix/RGA/trains/pass1/v0 -r :pi+_pi+ -s pippip_all -w pippip_rga_pass1

# ##pipaa (rhop)
# /home/osoto/dihadron/filtering/sendscript/make_swif_wf_mix.py -l /home/osoto/dihadron/filtering/filelist/rga_evdata_dst_pass1_v0.txt -o /volatile/clas12/users/osoto/data/mix/RGA/trains/pass1/v0 -r :pi+_gamma_gamma -s pipaa_all -w pipaa_rga_pass1

# ##pimaa (rhom)
# /home/osoto/dihadron/filtering/sendscript/make_swif_wf_mix.py -l /home/osoto/dihadron/filtering/filelist/rga_evdata_dst_pass1_v0.txt -o /volatile/clas12/users/osoto/data/mix/RGA/trains/pass1/v0 -r :pi-_gamma_gamma -s pimaa_all -w pimaa_rga_pass1

# ##pippimaa (eta-omega)
# /home/osoto/dihadron/filtering/sendscript/make_swif_wf_mix.py -l /home/osoto/dihadron/filtering/filelist/rga_evdata_dst_pass1_v0.txt -o /volatile/clas12/users/osoto/data/mix/RGA/trains/pass1/v0 -r :pi+_pi-_gamma_gamma -s pippimaa_all -w pippimaa_rga_pass1

## pip2pim2
#/home/osoto/dihadron/filtering/sendscript/make_swif_wf_mix.py -l /home/osoto/dihadron/filtering/filelist/rga_evdata_dst_pass1_v0.txt -o /volatile/clas12/users/osoto/data/mix/RGA/trains/pass1/v0 -r :pi+_pi+_pi-_pi- -s 2pip2pim_all -w pip2pim2_rga_pass1

## pippim4a
#/home/osoto/dihadron/filtering/sendscript/make_swif_wf_mix.py -l /home/osoto/dihadron/filtering/filelist/rga_evdata_dst_pass1_v0.txt -o /volatile/clas12/users/osoto/data/mix/RGA/trains/pass1/v0 -r :pi+_pi-_gamma_gamma_gamma_gamma -s pippim4a_all -w pippim4a_rga_pass1 
