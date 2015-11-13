docker build --tag="fedora/ora12c_soft" -f Dockerfile.1 .

docker run --privileged=true \
           -it --cidfile="cidfile" \
           fedora/ora12c_soft  \
           /bin/bash -c  "/tmp/privileged_actions.sh"

docker commit $(cat cidfile) fedora/ora12c_soft

#docker build --tag="fedora/ora12c" -f Dockerfile.2 .
