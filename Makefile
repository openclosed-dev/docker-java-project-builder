build_dir := $(HOME)/build
dist_dir := $(HOME)/distribution

.PHONY: all build clean fetch
.DEFAULT_GOAL := all

all: build
	cp $(build_dir)/subproject1/build/libs/subproject1.jar $(dist_dir)/
	cp $(build_dir)/subproject2/build/libs/subproject2.jar $(dist_dir)/

fetch:
	@mkdir -p $(build_dir)
	cd $(HOME)/repo && git archive --format=tar $(GIT_BRANCH) | tar -C $(build_dir) -xf -

build: fetch
	@echo 'Current build profile is $(BUILD_PROFILE)'
	gradle build -p $(build_dir)

clean:
	rm -rf $(dist_dir)/*
