.PHONY: eigen json fplus frugal denoising

ifndef PREFIX
$(warning Using default installation path in build tree)
PREFIX := $(shell pwd)/install
endif

denoising: frugal
	make -C denoising/code all PREFIX=$(PREFIX)

eigen:
	rm -rf build && mkdir -p build && cd build && cmake -DCMAKE_INSTALL_PREFIX=$(PREFIX) ../eigen && make install && cd $(PREFIX)/include && ln -s eigen3/Eigen .

json:
	rm -rf build && mkdir -p build && cd build && cmake -DCMAKE_INSTALL_PREFIX=$(PREFIX) ../json && make install

fplus:
	rm -rf build && mkdir -p build && cd build && cmake -DCMAKE_INSTALL_PREFIX=$(PREFIX) ../FunctionalPlus && make install

frugal: eigen fplus json
	rm -rf build && mkdir -p build && cd build && cmake -DCMAKE_INSTALL_PREFIX=$(PREFIX) ../frugally-deep && make install

clean:
	rm -rf build 
	make -C denoising/code clean

