#!/bin/bash 
## pippim
./sendscript/make_swif_wf_mix_dstRGA.py;
./sendscript/make_swif_wf_mix_dstRGB.py; 
./sendscript/make_swif_wf_mix_dstRGA_OB.py;
./sendscript/make_swif_wf_mix_pippim_sim.py

##pimpim
./sendscript/make_swif_wf_mix_dstRGA_pimpim.py;
./sendscript/make_swif_wf_mix_dstRGB_pimpim.py; 
./sendscript/make_swif_wf_mix_dstRGA_OB_pimpim.py;
./sendscript/make_swif_wf_mix_pimpim_sim.py

##pippip
./sendscript/make_swif_wf_mix_dstRGA_pippip.py;
./sendscript/make_swif_wf_mix_dstRGB_pippip.py; 
./sendscript/make_swif_wf_mix_dstRGA_OB_pippip.py;
./sendscript/make_swif_wf_mix_pippip_sim.py

##pipaa (rhop)
./sendscript/make_swif_wf_mix_dstRGA_rhop.py;
./sendscript/make_swif_wf_mix_dstRGB_rhop.py; 
./sendscript/make_swif_wf_mix_dstRGA_OB_rhop.py;
./sendscript/make_swif_wf_mix_pipaa_sim.py

##pimaa (rhom)
./sendscript/make_swif_wf_mix_dstRGA_rhom.py;
./sendscript/make_swif_wf_mix_dstRGB_rhom.py; 
./sendscript/make_swif_wf_mix_dstRGA_OB_rhom.py;
./sendscript/make_swif_wf_mix_pimaa_sim.py

