SUBDIRS = update_tarballs xgcc uboot linux allwinner debootstrap keys sdcard
RAMDIR?=/ram
STACK=old

help:
	@cat README
	@echo SUBDIRS = $(SUBDIRS)

all clean allclean: noroot check_stack
	@mkdir -p $(RAMDIR)
	for zzz in $(SUBDIRS); do make -C $$zzz $@ || exit 1; done
ifeq ($(strip $(STACK)),new)
	patch -Rs -p2 < whole.patch
endif

noroot:
	@if [ $(USER) = root ]; then \
	  echo "**************************************************************" ; \
	  echo "               YOU ARE DOING THIS THE WRONG WAY" ; \
	  echo "It is a very bad idea to build as root. The build process will" ; \
	  echo "                     use sudo as necessary." ; \
	  echo "**************************************************************" ; \
	  false ; \
	fi

check_stack:
ifeq ($(strip $(STACK)),new)
	patch -s -p2 < whole.patch
endif