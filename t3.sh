#!/bin/bash
cd /pypreprocess && . continuous_integration/install_spm12.sh
source neurodebian-travis.sh -y
cd /pypreprocess/examples/easy_start && python3 nipype_preproc_spm_auditory.py