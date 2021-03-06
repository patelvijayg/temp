#!/bin/bash
apt-get update && apt-get install vim -y 
apt install -y sudo bc unzip git wget vim python3 python3-pip build-essential software-properties-common libxml2-dev libxslt1-dev
#pip3 install --upgrade pip
pip3 install numpy lxml scipy nose nibabel scikit-learn nipype pandas matplotlib nilearn configobj
#echo "deb http://security.ubuntu.com/ubuntu precise-security main" >> /etc/apt/sources.list
add-apt-repository ppa:openjdk-r/ppa -y && apt-get update && apt-get install -y openjdk-8-jdk && update-alternatives --config java
git clone https://github.com/neurospin/pypreprocess.git
sed -i 's/securuty/security/g' pypreprocess/continuous_integration/install_spm12.sh
echo 'export SPM_DIR=/root/opt/spm12/spm12' >> ~/.bashrc
echo 'export SPM_MCR=/root/opt/spm12/spm12.sh' >> ~/.bashrc
echo 'export MCR_HOME=/root/opt/spm12/mcr/v713/' >> ~/.bashrc
echo 'export SPM_HOME=/root/opt/spm12/spm12' >> ~/.bashrc
echo 'export LD_LIBRARY_PATH=/root/opt/spm12/mcr/v713/runtime/glnxa64' >> ~/.bashrc
echo 'export PATH=$PATH:$LD_LIBRARY_PATH' >> ~/.bashrc
source ~/.bashrc
wget http://neuro.debian.net/_files/neurodebian-travis.sh
sed -i 's/coreutils/coreutils -y/g' neurodebian-travis.sh
echo "---------------copy part is done"
cd /pypreprocess && . continuous_integration/install_spm12.sh
source /neurodebian-travis.sh -y
cd /pypreprocess && python3 setup.py install
cd /pypreprocess/examples/easy_start && python3 nipype_preproc_spm_auditory.py
