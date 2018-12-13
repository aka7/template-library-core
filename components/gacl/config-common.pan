# #
# Software subject to following license(s):
#   Apache 2 License (http://www.opensource.org/licenses/apache2.0)
#   Copyright (c) Responsible Organization
#

# #
# Current developer(s):
#   Michel Jouvin <jouvin@lal.in2p3.fr>
#

# #
# Author(s): Jane SMITH, Joe DOE
#

# #
# gacl, 18.12.0-rc0, rc0_1, Thu Dec 13 2018
#

unique template components/gacl/config-common;

include 'components/gacl/schema';

# Set prefix to root of component configuration.
prefix '/software/components/gacl';

'version' = '18.12.0';
#'package' = 'NCM::Component';

'active' ?= true;
'dispatch' ?= true;
