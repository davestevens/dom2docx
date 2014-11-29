all: build test-build

build:
	coffee -cb src

test-build:
	coffee -cb test/src

watch:
	coffee -cwb src

test-watch:
	coffee -cwb test/src

watch-all:
	coffee -cwb .

.PHONY: build test-build clean watch test-watch watch-all
