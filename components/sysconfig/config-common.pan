# #
# Software subject to following license(s):
#   Apache 2 License (http://www.opensource.org/licenses/apache2.0)
#   Copyright (c) Responsible Organization
#

# #
# Current developer(s):
#   Charles Loomis <loomis@lal.in2p3.fr>
#

# #
# Author(s): Jane SMITH, Joe DOE
#

# #
      # sysconfig, 13.1.2, 1, 20131015-1106
      #

unique template components/sysconfig/config-common;

include { 'components/sysconfig/schema' };

# Set prefix to root of component configuration.
prefix '/software/components/sysconfig';

#'version' = '13.1.2';
#'package' = 'NCM::Component';

'active' ?= true;
'dispatch' ?= true;
