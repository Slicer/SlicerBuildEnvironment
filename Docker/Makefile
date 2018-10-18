#
# Parameters
#

# Name of the docker executable
DOCKER = docker

# DockerHub organization to pull/push the images from/to
ORG = slicer

IMAGES = qt4-centos5 qt4-ubuntu1004 qt5-centos7

# These images are built using the "build implicit rule"
ALL_IMAGES = $(IMAGES)

# Tag to associated with the image
TAG = slicer-4.10

# On CircleCI, do not attempt to delete container
# See https://circleci.com/docs/docker-btrfs-error/
RM = --rm
ifeq ("$(CIRCLECI)", "true")
	RM =
endif

#
# images: This target builds all IMAGES (because it is the first one, it is built by default)
#
images: $(IMAGES)
.PHONY: images

#
# display
#
display_images:
	for image in $(ALL_IMAGES); do echo $$image:$(TAG); done

$(VERBOSE).SILENT: display_images
.PHONY: display_images

#
# build implicit rule
#
$(ALL_IMAGES): %: %/Dockerfile
	$(eval REPO := buildenv-$@)
	$(eval IMAGEID := $(shell $(DOCKER) images -q $(ORG)/$(REPO):$(TAG)))
	$(DOCKER) build --pull -t $(ORG)/$(REPO):$(TAG) \
		--build-arg IMAGE=$(ORG)/$(REPO):$(TAG) \
		--build-arg VCS_REF=`git rev-parse --short HEAD` \
	  --build-arg VCS_URL=`git config --get remote.origin.url` \
		--build-arg BUILD_DATE=`date -u +"%Y-%m-%dT%H:%M:%SZ"` \
		$@
	CURRENT_IMAGEID=$$($(DOCKER) images -q $(ORG)/$(REPO)) && \
	if [ -n "$(IMAGEID)" ] && [ "$(IMAGEID)" != "$$CURRENT_IMAGEID" ]; then $(DOCKER) rmi "$(IMAGEID)" || true; fi

.PHONY: $(ALL_IMAGES)

#
# run implicit rule
#
.SECONDEXPANSION:
$(addsuffix .run,$(ALL_IMAGES)):
	$(eval REPO := buildenv-$(firstword $(subst ., ,$@)))
	$(DOCKER) run -ti --rm $(ORG)/$(REPO):$(TAG) bash

.PHONY: $(addsuffix .run,$(ALL_IMAGES))

#
# pull implicit rule
#
.SECONDEXPANSION:
$(addsuffix .pull,$(ALL_IMAGES)):
	$(eval REPO := buildenv-$(firstword $(subst ., ,$@)))
	$(DOCKER) pull $(ORG)/$(REPO):$(TAG)

pull: $(addsuffix .pull,$(ALL_IMAGES))

.PHONY: pull $(addsuffix .pull,$(ALL_IMAGES))

#
# push implicit rule
#
.SECONDEXPANSION:
$(addsuffix .push,$(ALL_IMAGES)):
	$(eval REPO := buildenv-$(firstword $(subst ., ,$@)))
	$(DOCKER) push $(ORG)/$(REPO):$(TAG)

push: $(addsuffix .push,$(ALL_IMAGES))

.PHONY: push $(addsuffix .push,$(ALL_IMAGES))
