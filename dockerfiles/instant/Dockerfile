FROM bamboo-base

# Add repositories
COPY instant ${FENICS_HOME}/build/src/instant

# Copy scripts
COPY bin ${FENICS_HOME}/bin

# Set permissions
RUN sudo chown -R fenics:fenics ${FENICS_HOME}
