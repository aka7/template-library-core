# #
# Software subject to following license(s):
#   Apache 2 License (http://www.opensource.org/licenses/apache2.0)
#   Copyright (c) Responsible Organization
#

# #
# Current developer(s):
#   Laura del Caño Novales <laura.delcano@ft.uam.es>
#

# 
# #
# amandaserver, 19.12.0-rc2, rc2_1, Tue Jan 21 2020
#

unique template components/amandaserver/config-common;

include 'components/amandaserver/schema';

# Set prefix to root of component configuration.
prefix '/software/components/amandaserver';

#'version' = '19.12.0-rc2';
#'package' = 'NCM::Component';

'active' ?= true;
'dispatch' ?= true;
