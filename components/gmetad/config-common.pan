# #
# Software subject to following license(s):
#   Apache 2 License (http://www.opensource.org/licenses/apache2.0)
#   Copyright (c) Responsible Organization
#

# #
# Current developer(s):
#   Ronald Starink <ronalds@nikhef.nl>
#

# 
# #
# gmetad, 19.12.0-rc4, rc4_1, Tue Feb 11 2020
#

unique template components/gmetad/config-common;

include 'components/gmetad/schema';

# Set prefix to root of component configuration.
prefix '/software/components/gmetad';

#'version' = '19.12.0-rc4';
#'package' = 'NCM::Component';

'active' ?= true;
'dispatch' ?= true;
