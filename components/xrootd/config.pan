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
# xrootd, 18.12.0-rc3, rc3_1, Wed Apr 10 2019
#

unique template components/xrootd/config;

include 'components/xrootd/schema';

# Set prefix to root of component configuration.
prefix '/software/components/xrootd';

'version' = '18.12.0';
#'package' = 'NCM::Component';
'active' ?= true;
'dispatch' ?= true;

# Install Quattor configuration module via RPM package.
'/software/packages' = pkg_repl('ncm-xrootd', '18.12.0-rc3_1', 'noarch');
'dependencies/pre' ?= list('spma');

