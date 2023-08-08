# #
# Software subject to following license(s):
#   Apache 2 License (http://www.opensource.org/licenses/apache2.0)
#   Copyright (c) Centre National de la Recherche Scientifique
#

# #
# Current developer(s):
#   Charles LOOMIS <loomis@lal.in2p3.fr>
#

# 
# #
# libvirtd, 23.6.0-rc4, rc4_1, Tue Aug 08 2023
#

unique template components/libvirtd/config;

include 'components/libvirtd/schema';

'/software/packages'=pkg_repl('ncm-libvirtd','23.6.0-rc4_1','noarch');
'/software/components/libvirtd/dependencies/pre' ?=  list ('spma');

'/software/components/libvirtd/active' ?= true;
'/software/components/libvirtd/dispatch' ?= true;
