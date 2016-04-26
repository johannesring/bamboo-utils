FROM bamboo-base

# Add repositories
COPY dijitso ${FENICS_HOME}/build/src/dijitso
COPY dolfin ${FENICS_HOME}/build/src/dolfin
COPY ffc ${FENICS_HOME}/build/src/ffc
COPY fiat ${FENICS_HOME}/build/src/fiat
COPY instant ${FENICS_HOME}/build/src/instant
COPY ufl ${FENICS_HOME}/build/src/ufl

# Copy scripts
COPY bin ${FENICS_HOME}/bin

# Set permissions
RUN sudo chown -R fenics:fenics ${FENICS_HOME}
