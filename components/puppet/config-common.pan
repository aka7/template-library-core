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
# puppet, 17.2.0-rc2, rc2_1, Wed Mar 01 2017
#

unique template components/puppet/config-common;

include 'components/puppet/schema';

# Set prefix to root of component configuration.
prefix '/software/components/puppet';

'version' = '17.2.0';
#'package' = 'NCM::Component';

'active' ?= true;
'dispatch' ?= true;
