build_dir := $(HOME)/build
dist_dir := $(HOME)/distribution

.PHONY: build clean dist fetch rebuild
.DEFAULT_GOAL := rebuild

rebuild: clean dist

fetch:
	@mkdir -p $(build_dir)
	cd $(HOME)/repo && git archive --format=tar $(GIT_BRANCH) | tar -C $(build_dir) -xf -

dist: build
	cp $(build_dir)/subproject1/build/libs/subproject1.jar $(dist_dir)/
	cp $(build_dir)/subproject2/build/libs/subproject2.jar $(dist_dir)/

build: fetch
	@echo 'Current build profile is $(BUILD_PROFILE)'
	gradle build -p $(build_dir)

clean:
	rm -rf $(dist_dir)/*
