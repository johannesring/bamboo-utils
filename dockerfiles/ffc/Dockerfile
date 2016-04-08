FROM bamboo-base

# Add repositories
COPY dijitso ${HOME}/build/src/dijitso
COPY ffc ${HOME}/build/src/ffc
COPY fiat ${HOME}/build/src/fiat
COPY instant ${HOME}/build/src/instant
COPY ufl ${HOME}/build/src/ufl

# Copy scripts
COPY bin ${HOME}/bin

# Set permissions
RUN sudo chown -R fenics:fenics ${HOME}
