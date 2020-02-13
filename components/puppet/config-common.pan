# #
# Software subject to following license(s):
#   Apache 2 License (http://www.opensource.org/licenses/apache2.0)
#   Copyright (c) Responsible Organization
#

# #
# Current developer(s):
#   Andrea Sartirana <sartiran@llr.in2p3.fr>
#

# 
# #
# puppet, 19.12.0, 1, Thu Feb 13 2020
#

unique template components/puppet/config-common;

include 'components/puppet/schema';

# Set prefix to root of component configuration.
prefix '/software/components/puppet';

'version' = '19.12.0';
#'package' = 'NCM::Component';

'active' ?= true;
'dispatch' ?= true;
