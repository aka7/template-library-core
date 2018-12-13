# #
# Software subject to following license(s):
#   Apache 2 License (http://www.opensource.org/licenses/apache2.0)
#   Copyright (c) Responsible Organization
#

# #
# Current developer(s):
#   Michel Jouvin <jouvin@lal.in2p3.fr>
#   Vladimir Bahyl <null>
#

# 
# #
# named, 18.12.0-rc0, rc0_1, Thu Dec 13 2018
#

unique template components/named/config;

include 'components/named/schema';

# Package to install
"/software/packages" = pkg_repl("ncm-named", "18.12.0-rc0_1", "noarch");

# Set prefix to root of component configuration.
prefix '/software/components/named';

'version' ?= '18.12.0';
'active' ?= true;
'dispatch' ?= true;
'dependencies/pre' ?= append('spma');

