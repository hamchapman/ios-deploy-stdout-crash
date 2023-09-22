SHELL := bash
.SHELLFLAGS := -eu -o pipefail -c
.DELETE_ON_ERROR:
MAKEFLAGS += --warn-undefined-variables
MAKEFLAGS += --no-builtin-rules
MAKEFLAGS += --debug

.PHONY: build-rust
build-rust:
	rustup component add rust-src --target aarch64-apple-ios;
	rustup target add aarch64-apple-ios;
	cargo build --target aarch64-apple-ios --release;

.PHONY: build-ios
build-ios:
	cp ruststdoutcrash.h ios-deploy-stdout-crash/ios-deploy-stdout-crash/ffi/ruststdoutcrash.h;
	xcodebuild \
		-derivedDataPath ios/DerivedData \
		-project ios-deploy-stdout-crash/ios-deploy-stdout-crash.xcodeproj \
		-scheme ios-deploy-stdout-crash \
		-destination generic/platform=iOS;
