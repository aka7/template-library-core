# #
# Software subject to following license(s):
#   Apache 2 License (http://www.opensource.org/licenses/apache2.0)
#   Copyright (c) Responsible Organization
#

# #
# Current developer(s):
#   Thorsten Kleinwort <Thorsten.Kleinwort@yahoo.de>
#

# #
# Author(s): Jane SMITH, Joe DOE
#

# #
# yaim, 15.4.0-rc14, rc14_1, 2015-06-03T12:08:17Z
#

unique template components/yaim/config-xml;

include { 'components/yaim/config-common' };

# Set prefix to root of component configuration.
prefix '/software/components/yaim';

# Embed the Quattor configuration module into XML profile.
'code' = file_contents('components/yaim/yaim.pm'); 
