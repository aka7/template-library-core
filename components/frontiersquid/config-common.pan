# #
# Software subject to following license(s):
#   Apache 2 License (http://www.opensource.org/licenses/apache2.0)
#   Copyright (c) Responsible Organization
#

# #
# Current developer(s):
#   Guillaume PHILIPPON <philippo@lal.in2p3.fr>
#

# #
# Author(s): Jane SMITH, Joe DOE
#

# #
      # frontiersquid, 14.4.0-rc3-SNAPSHOT, rc3_SNAPSHOT20140507141750, 20140507-1517
      #

unique template components/frontiersquid/config-common;

include { 'components/frontiersquid/schema' };

# Set prefix to root of component configuration.
prefix '/software/components/frontiersquid';

'version' = '14.4.0';
#'package' = 'NCM::Component';

'active' ?= true;
'dispatch' ?= true;
