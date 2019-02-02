#!/bin/bash
cd /pypreprocess && . continuous_integration/install_spm12.sh
source /neurodebian-travis.sh -y
cd /pypreprocess && python3 setup.py install
cd /pypreprocess/pypreprocess/examples/easy_start && python3 nipype_preproc_spm_auditory.py