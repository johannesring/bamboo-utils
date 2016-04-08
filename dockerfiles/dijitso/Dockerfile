FROM bamboo-base

# Add repositories
COPY dijitso ${HOME}/build/src/dijitso
COPY instant ${HOME}/build/src/instant

# Copy scripts
COPY bin ${HOME}/bin

# Set permissions
RUN sudo chown -R fenics:fenics ${HOME}
