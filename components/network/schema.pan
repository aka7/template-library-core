# #
# Software subject to following license(s):
#   Apache 2 License (http://www.opensource.org/licenses/apache2.0)
#   Copyright (c) Responsible Organization
#

# #
# Current developer(s):
#   Guillaume Philippon <philippo@lal.in2p3.fr>
#

# #
# Author(s): Daniel Jouvenot
#

# #
      # network, 13.1.2, 1, 20131015-1106
      #

declaration template components/network/schema;

include { 'quattor/schema' };


type component_network_type = {
	include structure_component
};


bind "/software/components/network" = component_network_type;
