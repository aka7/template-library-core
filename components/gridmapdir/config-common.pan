# #
# Software subject to following license(s):
#   Apache 2 License (http://www.opensource.org/licenses/apache2.0)
#   Copyright (c) Responsible Organization
#

# #
# Current developer(s):
#   Charles Loomis <charles.loomis@cern.ch>
#

# #
# Author(s): Jane SMITH, Joe DOE
#

# #
# gridmapdir, 21.4.0-rc2, rc2_1, Sat May 01 2021
#

unique template components/gridmapdir/config-common;

include 'components/gridmapdir/schema';

# Set prefix to root of component configuration.
prefix '/software/components/gridmapdir';

'version' = '21.4.0';
#'package' = 'NCM::Component';

'active' ?= true;
'dispatch' ?= true;
