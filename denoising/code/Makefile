#********************************************************
# MAKEFILE for BUILDING EXAMPLES FOR HIPO4 LIBRARY
# AUTHOR: GAVALIAN DATE: 10/24/2018
#********************************************************

ifndef HIPO_DIR
ifdef HIPO
$(warning $$HIPO_DIR is not set, using $$HIPO instead)
HIPO_DIR = $(HIPO)
else
$(error $$HIPO_DIR is not set)
endif
endif

ifndef PREFIX
$(warning Using default installation path in build tree)
PREFIX := $(shell pwd)/../../install
endif

HIPOCFLAGS  := -I$(HIPO_DIR)/include/hipo4 -I$(PREFIX)/include
HIPOLIBS    := -L$(HIPO_DIR)/lib -lhipo4

LZ4LIBS     := -L$(HIPO_DIR)/lz4/lib -llz4 -lpthread
LZ4INCLUDES := -I$(HIPO_DIR)/lz4/lib

CXX       := g++
CXXFLAGS  += -Wall -fPIC -std=c++14 -Wunknown-pragmas
LD        := g++
LDFLAGS   :=

OBJECTS  = denoise.o drift.o
OBJECTS2 = denoise2.o drift.o

all:  denoise2 install

install:
	install -d $(PREFIX)/bin $(PREFIX)/share/denoising/network
	install denoise2.exe $(PREFIX)/bin
	install network/* $(PREFIX)/share/denoising/network

denoise: $(OBJECTS)
	$(CXX) -o denoise.exe $(OBJECTS)  $(HIPOLIBS) $(LZ4LIBS)

denoise2: $(OBJECTS2)
	$(CXX) -o denoise2.exe $(OBJECTS2)  $(HIPOLIBS) $(LZ4LIBS)

clean:
	@echo 'Removing all build files'
	@rm -rf *.o *~ *.exe example*hipo 

%.o: %.cc
	$(CXX) -c $< -O3 $(CXXFLAGS) $(HIPOCFLAGS) $(LZ4INCLUDES)

