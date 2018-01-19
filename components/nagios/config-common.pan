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
# nagios, 17.12.0-rc3, rc3_1, Fri Jan 19 2018
#

unique template components/nagios/config-common;

include 'components/nagios/schema';

# Set prefix to root of component configuration.
prefix '/software/components/nagios';

#'version' = '17.12.0-rc3';
#'package' = 'NCM::Component';

'active' ?= true;
'dispatch' ?= true;
