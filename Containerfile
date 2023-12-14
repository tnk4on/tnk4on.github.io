#FROM registry.fedoraproject.org/fedora
FROM registry.access.redhat.com/ubi9/ubi
LABEL maintainer="Shion Tanaka / Twitter(@tnk4on)"

RUN dnf update -y
#RUN dnf install ruby ruby-devel @development-tools g++ -y
RUN dnf install ruby ruby-devel g++ git -y
RUN gem install jekyll
RUN dnf clean all 

WORKDIR /srv/jekyll