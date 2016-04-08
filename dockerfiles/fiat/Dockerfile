FROM bamboo-base

# Add repositories
COPY fiat ${HOME}/build/src/fiat

# Copy scripts
COPY bin ${HOME}/bin

# Set permissions
RUN sudo chown -R fenics:fenics ${HOME}
