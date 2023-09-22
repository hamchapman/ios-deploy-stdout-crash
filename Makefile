SHELL := bash
.SHELLFLAGS := -eu -o pipefail -c
.DELETE_ON_ERROR:
MAKEFLAGS += --warn-undefined-variables
MAKEFLAGS += --no-builtin-rules
MAKEFLAGS += --debug

.PHONY: build
build:
	xcodebuild \
		-derivedDataPath ios/DerivedData \
		-project ios-deploy-stdout-crash/ios-deploy-stdout-crash.xcodeproj \
		-scheme ios-deploy-stdout-crash \
		-destination generic/platform=iOS;
