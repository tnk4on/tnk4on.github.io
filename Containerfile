FROM registry.fedoraproject.org/fedora
LABEL maintainer="Shion Tanaka / Twitter(@tnk4on)"

RUN dnf update -y
RUN dnf install ruby ruby-devel @development-tools g++ -y
RUN gem install jekyll
RUN dnf clean all 

WORKDIR /srv/jekyll