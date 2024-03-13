.PHONY: eigen json fplus frugal denoising

all: eigen json fplus frugal denoising

ifndef PREFIX
$(warning Using default installation path in build tree: ./install)
PREFIX := ../install
endif

eigen:
	rm -rf build && mkdir -p build && cd build && cmake -DCMAKE_INSTALL_PREFIX=$(PREFIX) ../eigen && make install && cd $(PREFIX)/include && ln -s eigen3/Eigen .

json:
	rm -rf build && mkdir -p build && cd build && cmake -DCMAKE_INSTALL_PREFIX=$(PREFIX) ../json && make install

fplus:
	rm -rf build && mkdir -p build && cd build && cmake -DCMAKE_INSTALL_PREFIX=$(PREFIX) ../FunctionalPlus && make install

frugal:
	rm -rf build && mkdir -p build && cd build && cmake -DCMAKE_INSTALL_PREFIX=$(PREFIX) ../frugally-deep && make install

clean:
	rm -rf build 
	make -C denoising/code clean

denoising:
	make -C denoising/code all

