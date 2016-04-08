FROM bamboo-base

# Add repositories
COPY ufl ${HOME}/build/src/ufl

# Copy scripts
COPY bin ${HOME}/bin

# Set permissions
RUN sudo chown -R fenics:fenics ${HOME}
