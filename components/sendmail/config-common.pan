# #
# Software subject to following license(s):
#   Apache 2 License (http://www.opensource.org/licenses/apache2.0)
#   Copyright (c) Responsible Organization
#

# #
# Current developer(s):
#   Jan Iven <jan.iven@cern.ch>
#

# 
# #
# sendmail, 18.6.0, 1, Mon Jul 30 2018
#

unique template components/sendmail/config-common;

include 'components/sendmail/schema';

# Set prefix to root of component configuration.
prefix '/software/components/sendmail';

#'version' = '18.6.0';
#'package' = 'NCM::Component';

'active' ?= true;
'dispatch' ?= true;
