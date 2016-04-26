FROM bamboo-base

# Add repositories
COPY fiat ${FENICS_HOME}/build/src/fiat

# Copy scripts
COPY bin ${FENICS_HOME}/bin

# Set permissions
RUN sudo chown -R fenics:fenics ${FENICS_HOME}
