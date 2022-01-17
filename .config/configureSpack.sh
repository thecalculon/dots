git clone https://github.com/spack/spack.git ~/spack
cd ~/spack
git checkout releases/v0.17
source ~/spack/share/spack/setup-env.sh
# spack install openmpi@3.1.16
spack install hdf5 mpi=yes fortran=yes
spack install fftw
spack install fftw@2.1.5







