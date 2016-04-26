FROM bamboo-base

# Add repositories
COPY ufl ${FENICS_HOME}/build/src/ufl

# Copy scripts
COPY bin ${FENICS_HOME}/bin

# Set permissions
RUN sudo chown -R fenics:fenics ${FENICS_HOME}
