FROM bamboo-base

# Add repositories
COPY dijitso ${FENICS_HOME}/build/src/dijitso
COPY instant ${FENICS_HOME}/build/src/instant

# Copy scripts
COPY bin ${FENICS_HOME}/bin

# Set permissions
RUN sudo chown -R fenics:fenics ${FENICS_HOME}
