#
# Parameters
#

# Name of the docker-equivalent executable for building images.
# OCI: open container interface.
# Common values: docker, podman
DOCKER := $(or $(OCI_EXE), docker)
BUILD_DOCKER := $(or $(BUILD_DOCKER), $(DOCKER))

# The build sub-command. Use:
#
#   export "BUILD_CMD=buildx build --platform linux/amd64,linux/arm64"
#
# to generate multi-platform images.
BUILD_CMD := $(or $(BUILD_CMD), build)

# DockerHub organization to pull/push the images from/to
ORG = slicer

IMAGES_WITH_CREDENTIALS = \
  qt5-centos7 \
  qt5-almalinux8-gcc14
IMAGES_WITHOUT_CREDENTIALS =

# These images are built using the "build implicit rule"
ALL_IMAGES = $(IMAGES_WITH_CREDENTIALS) $(IMAGES_WITHOUT_CREDENTIALS)

# Tag to associated with the image
TAG = latest

# Generated Dockerfiles.
GEN_IMAGES := $(ALL_IMAGES)

GEN_IMAGE_DOCKERFILES = $(addsuffix /Dockerfile,$(GEN_IMAGES))

# Docker composite files
DOCKER_COMPOSITE_SOURCES = \
	common.label-and-env
DOCKER_COMPOSITE_FOLDER_PATH = common/
DOCKER_COMPOSITE_PATH = $(addprefix $(DOCKER_COMPOSITE_FOLDER_PATH),$(DOCKER_COMPOSITE_SOURCES))

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
# Dockerfile configuration implicit rules
#
$(GEN_IMAGE_DOCKERFILES): %Dockerfile: %Dockerfile.in $(DOCKER_COMPOSITE_PATH)
	sed \
		-e '/common.label-and-env/ r $(DOCKER_COMPOSITE_FOLDER_PATH)common.label-and-env' \
		$< > $@

.PHONY: $(GEN_IMAGE_DOCKERFILES)

#
# build implicit rule
#
$(IMAGES_WITH_CREDENTIALS): %: %/Dockerfile
ifndef QT_ACCOUNT_LOGIN
	$(error QT_ACCOUNT_LOGIN env. variable is undefined)
endif
ifndef QT_ACCOUNT_PASSWORD
	$(error QT_ACCOUNT_PASSWORD env. variable is undefined)
endif
	$(eval REPO := buildenv-$@)
	$(eval IMAGEID := $(shell $(BUILD_DOCKER) images -q $(ORG)/$(REPO):$(TAG)))
	$(BUILD_DOCKER) $(BUILD_CMD) --pull -t $(ORG)/$(REPO):$(TAG) \
		--build-arg IMAGE=$(ORG)/$(REPO) \
		--build-arg VERSION=$(TAG) \
		--build-arg VCS_REF=`git rev-parse --short HEAD` \
	  --build-arg VCS_URL=`git config --get remote.origin.url` \
		--build-arg BUILD_DATE=`date -u +"%Y-%m-%dT%H:%M:%SZ"` \
		--build-arg QT_ACCOUNT_LOGIN=$(QT_ACCOUNT_LOGIN) \
		--build-arg QT_ACCOUNT_PASSWORD=$(QT_ACCOUNT_PASSWORD) \
		$@
	CURRENT_IMAGEID=$$($(BUILD_DOCKER) images -q $(ORG)/$(REPO)) && \
	if [ -n "$(IMAGEID)" ] && [ "$(IMAGEID)" != "$$CURRENT_IMAGEID" ]; then $(BUILD_DOCKER) rmi "$(IMAGEID)" || true; fi

.PHONY: $(IMAGES_WITH_CREDENTIALS)

#
# build implicit rule
#
$(IMAGES_WITHOUT_CREDENTIALS): %: %/Dockerfile
	$(eval REPO := buildenv-$@)
	$(eval IMAGEID := $(shell $(BUILD_DOCKER) images -q $(ORG)/$(REPO):$(TAG)))
	$(BUILD_DOCKER) $(BUILD_CMD) --pull -t $(ORG)/$(REPO):$(TAG) \
		--build-arg IMAGE=$(ORG)/$(REPO) \
		--build-arg VERSION=$(TAG) \
		--build-arg VCS_REF=`git rev-parse --short HEAD` \
	  --build-arg VCS_URL=`git config --get remote.origin.url` \
		--build-arg BUILD_DATE=`date -u +"%Y-%m-%dT%H:%M:%SZ"` \
		$@
	CURRENT_IMAGEID=$$($(BUILD_DOCKER) images -q $(ORG)/$(REPO)) && \
	if [ -n "$(IMAGEID)" ] && [ "$(IMAGEID)" != "$$CURRENT_IMAGEID" ]; then $(BUILD_DOCKER) rmi "$(IMAGEID)" || true; fi

.PHONY: $(IMAGES_WITHOUT_CREDENTIALS)

#
# run implicit rule
#
.SECONDEXPANSION:
$(addsuffix .run,$(ALL_IMAGES)):
	$(eval REPO := buildenv-$(firstword $(subst ., ,$@)))
	$(BUILD_DOCKER) run -ti --rm $(ORG)/$(REPO):$(TAG) bash

.PHONY: $(addsuffix .run,$(ALL_IMAGES))

#
# clean rule
#
clean:
	for d in $(GEN_IMAGE_DOCKERFILES) ; do rm -f $$d ; done

.PHONY: clean

#
# pull implicit rule
#
.SECONDEXPANSION:
$(addsuffix .pull,$(ALL_IMAGES)):
	$(eval REPO := buildenv-$(firstword $(subst ., ,$@)))
	$(BUILD_DOCKER) pull $(ORG)/$(REPO):$(TAG)

pull: $(addsuffix .pull,$(ALL_IMAGES))

.PHONY: pull $(addsuffix .pull,$(ALL_IMAGES))

#
# push implicit rule
#
.SECONDEXPANSION:
$(addsuffix .push,$(ALL_IMAGES)):
	$(eval REPO := buildenv-$(firstword $(subst ., ,$@)))
	$(BUILD_DOCKER) push $(ORG)/$(REPO):$(TAG)

push: $(addsuffix .push,$(ALL_IMAGES))

.PHONY: push $(addsuffix .push,$(ALL_IMAGES))
