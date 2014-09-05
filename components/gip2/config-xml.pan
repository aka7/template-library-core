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
      # gip2, 14.8.0-rc5, rc5_1, 20140905-1421
      #

unique template components/gip2/config-xml;

include { 'components/gip2/config-common' };

# Set prefix to root of component configuration.
prefix '/software/components/gip2';

# Embed the Quattor configuration module into XML profile.
'code' = file_contents('components/gip2/gip2.pm'); 
