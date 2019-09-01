

PROTOC ?= $(shell which protoc)
COMMON_DEF_FILES = $(shell find common -name '*.proto')
SA_ENGINE_DEF_FILES = $(shell find sa_engine -name '*.proto')

.PHONY: all
all: common sa_engine

.PHONY: common
common:
	$(PROTOC) -I . $(COMMON_DEF_FILES) --go_out=plugins=grpc:.

.PHONY: sa_engine 
sa_engine:
	$(PROTOC) -I . $(SA_ENGINE_DEF_FILES) --go_out=plugins=grpc:. --proto_path=./common/
