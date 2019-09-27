FROM cern/cc7-base:latest

MAINTAINER Matthias J. Schnepf  <matthias.jochen.schnepf@cern.ch>

# CERN CA
#ADD cerngridca.crt /etc/pki/ca-trust/source/anchors/cerngridca.crt
#ADD cernroot.crt /etc/pki/ca-trust/source/anchors/cernroot.crt
RUN update-ca-trust


ADD repos/UMD-4-updates.repo /etc/yum.repos.d/
ADD repos/egi-trustanchors.repo /etc/yum.repos.d/

ADD http://repository.egi.eu/sw/production/cas/1/GPG-KEY-EUGridPMA-RPM-3 /etc/pki/rpm-gpg/

RUN yum -y update
RUN yum clean all
RUN yum -y groupinstall 'Development Tools'
RUN yum -y install -y ca-policy-egi-core
RUN yum -y install \
  authconfig \
  boost-devel \
  glibc-headers \
  globus-proxy-utils \
  globus-gass-copy-progs \
  which

RUN yum -y install \
attr cyrus-sasl-devel e2fsprogs-devel expat-devel \
file-devel giflib-devel gmp-devel gpm-devel kernel-devel libacl-devel \
libattr-devel libcap-devel libcom_err-devel libcurl-devel libdrm-devel \
libdrm-devel libstdc++-devel libuuid-devel libxml2-devel lockdev-devel \
libjpeg-turbo-devel netpbm-devel popt-devel python-devel \
rpm-devel tcl-devel tk-devel openssh-clients PyXML \ 
voms-clients3 wlcg-voms-cms emi-wn \
HEP_OSlibs time tar perl bzip2 gcc freetype glibc-headers glibc-devel \
subversion make gcc gcc-c++ binutils patch wget python python3 libxml2-devel \
libX11-devel libXpm-devel libXft-devel libXext-devel bzip2-devel openssl-devel \
ncurses-devel readline-devel mesa-libGL-devel libgfortran.x86_64 glew-devel \
git krb5-workstation libtool-ltdl lcg-util.x86_64 bc tcsh atlas \
gsl gsl-devel xrootd-client 
