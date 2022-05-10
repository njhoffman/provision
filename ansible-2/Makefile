BUILDTAG="ubuntu:16.04"

.PHONY: docker/Dockerfile
Dockerfile: docker/Dockerfile.in
	sed "s/#BUILDTAG/${BUILDTAG}/" $< > ./docker/$@ || rm -f $@

