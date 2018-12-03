neurodocker \
  generate singularity \
  --base=neurodebian:stretch \
  --pkg-manager=apt \
  --install wget  \
  --fsl version=5.0.11 \
  --ants version=2.2.0 \
  --env BASILDIR=/basil_asl-master  FSLDIR=/opt/fsl-5.0.11 \
  --add-to-entrypoint 'export BASILDIR=/basil_asl-master' \
  --add-to-entrypoint 'export FSLDIR=/opt/fsl-5.0.11' \
  --add-to-entrypoint 'export ANTSPATH=/opt/ants-2.2.0' \
  --add-to-entrypoint 'export PATH=$PATH:$BASILDIR' \
  --run-bash 'cd / && wget https://github.com/PennBBL/basil_asl/archive/master.zip && unzip master.zip && chmod +x /basil_asl-master/*' \
  --run-bash 'BASILDIR=/basil_asl-master FSLDIR=/opt/fsl-5.0.11  ANTSPATH=/opt/ants-2.2.0 ' \
  --run-bash ' echo ==========================' \
  --run-bash 'cat $ND_ENTRYPOINT' \
  --run-bash ' echo ==========================' \
  --entrypoint '/neurodocker/startup.sh /basil_asl-master/perf_asl "$@"' > Singularity
