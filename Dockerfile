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
  lcmaps-plugins-condor-update \
  lcmaps-plugins-mount-under-scratch \
  lcmaps-plugins-namespace \
  redhat-lsb-core \
  which

RUN yum -y install \
attr cyrus-sasl-devel e2fsprogs-devel expat-devel singularity \
file-devel giflib-devel gmp-devel gpm-devel kernel-devel libacl-devel \
libattr-devel libcap-devel libcom_err-devel libcurl-devel libdrm-devel \
libdrm-devel libstdc++-devel libuuid-devel libxml2-devel lockdev-devel \
libjpeg-turbo-devel openldap-devel netpbm-devel popt-devel python-devel \
rpm-devel tcl-devel tk-devel openssh-clients PyXML HEP_OSlibs_SL6 \
voms-clients3 wlcg-voms-alice wlcg-voms-atlas wlcg-voms-lhcb wlcg-voms-cms \
wlcg-voms-ops ca-policy-egi-core emi-wn \
HEP_OSlibs
