FROM quay.io/fenicsproject/dev-env:latest

USER root

# Install ccache and nose
RUN apt-get -qq update && \
    apt-get -y install ccache python-nose && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install pytest-cov
RUN pip install pytest-cov

USER fenics

# Use ccache
RUN echo "export PATH=/usr/lib/ccache:\${PATH}" >> ${FENICS_HOME}/.bash_profile && \
    echo "ccache --max-size=5G > /dev/null 2>&1" >> ${FENICS_HOME}/.bash_profile

ENTRYPOINT ["sudo","-E","/sbin/my_init","--quiet","--","sudo","-u","fenics","/bin/bash","-l","-c"]
