# #
# Software subject to following license(s):
#   Apache 2 License (http://www.opensource.org/licenses/apache2.0)
#   Copyright (c) Responsible Organization
#

# #
# Current developer(s):
#   Luis Fernando Muñoz Mejías <mejias@delta.ft.uam.es>
#

# 
# #
# filesystems, 19.12.0-rc4, rc4_1, Tue Feb 11 2020
#

unique template components/filesystems/config-common;

include 'components/filesystems/schema';

# Set prefix to root of component configuration.
prefix '/software/components/filesystems';

#'version' = '19.12.0-rc4';
#'package' = 'NCM::Component';

'active' ?= true;
'dispatch' ?= true;
