FROM gitlab-registry.cern.ch/linuxsupport/cc7-base:latest

MAINTAINER Matthias J. Schnepf  <matthias.jochen.schnepf@cern.ch>

# CERN CA
ADD cerngridca.crt /etc/pki/ca-trust/source/anchors/cerngridca.crt
ADD cernroot.crt /etc/pki/ca-trust/source/anchors/cernroot.crt
RUN update-ca-trust


ADD repos/UMD-4-updates.repo /etc/yum.repos.d/
ADD repos/batch7-stable.repo /etc/yum.repos.d/
ADD repos/htcondor-stable.repo  /etc/yum.repos.d/
ADD repos/egi-trustanchors.repo /etc/yum.repos.d/

ADD http://repository.egi.eu/sw/production/cas/1/GPG-KEY-EUGridPMA-RPM-3 /etc/pki/rpm-gpg/

RUN yum -y update
RUN yum clean all
RUN yum -y groupinstall 'Development Tools'
RUN yum -y install -y ca-policy-egi-core
RUN yum -y install \
  authconfig \
  boost-devel \
  glexec-wn \
  glibc-headers \
  globus-proxy-utils \
  globus-gass-copy-progs \
  redhat-lsb-core \
  which

RUN yum -y install \
attr cyrus-sasl-devel e2fsprogs-devel expat-devel singularity \
file-devel giflib-devel gmp-devel gpm-devel kernel-devel libacl-devel \
libattr-devel libcap-devel libcom_err-devel libcurl-devel libdrm-devel \
libdrm-devel libstdc++-devel libuuid-devel libxml2-devel lockdev-devel \
libjpeg-turbo-devel openldap-devel netpbm-devel popt-devel python-devel \
rpm-devel tcl-devel tk-devel openssh-clients PyXML HEP_OSlibs_SL6 \
voms-clients3 wlcg-voms-cms emi-wn \
HEP_OSlibs time tar perl bzip2 gcc freetype glibc-headers glibc-devel \
subversion make gcc gcc-c++ binutils patch wget python python3 libxml2-devel \
libX11-devel libXpm-devel libXft-devel libXext-devel bzip2-devel openssl-devel \
ncurses-dev-el readline-devel mesa-libGL-devel libgfortran.x86_64 glew-devel \
git krb5-workstation libtool-ltdl lcg-util.x86_64 bc tcsh atlas sssd-client \
gsl gsl-devel xrootd-client 
