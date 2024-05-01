.PHONY: eigen json fplus frugal denoising

ifndef PREFIX
$(warning Using default installation path in build tree)
PREFIX := $(shell pwd)/install
endif

denoising: frugal
	make -C denoising/code all PREFIX=$(PREFIX)

install:
	$(MAKE) -C frugal.build install
	$(MAKE) -C fplus.build install
	$(MAKE) -C json.build install
	$(MAKE) -C eigen.build install
	cd $(PREFIX)/include && ln -s eigen3/Eigen .

eigen:
	rm -rf $@.build && mkdir -p $@.build
	cd $@.build && cmake -DCMAKE_INSTALL_PREFIX=$(PREFIX) ../eigen
	$(MAKE) -C $@.build

json:
	rm -rf $@.build && mkdir -p $@.build
	cd $@.build && cmake -DCMAKE_INSTALL_PREFIX=$(PREFIX) ../json
	$(MAKE) -C $@.build

fplus:
	rm -rf $@.build && mkdir -p $@.build
	cd $@.build && cmake -DCMAKE_INSTALL_PREFIX=$(PREFIX) ../FunctionalPlus
	$(MAKE) -C $@.build

frugal: eigen fplus json
	rm -rf $@.build && mkdir -p $@.build
	cd $@.build && cmake -DCMAKE_INSTALL_PREFIX=$(PREFIX) ../frugally-deep
	$(MAKE) -C $@.build

clean:
	rm -rf *build 
	$(MAKE) -C denoising/code clean

