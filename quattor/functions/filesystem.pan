declaration template quattor/functions/filesystem;

@{System Function Definitions for hard disk and partitions}

@documentation{
    desc = returns the number of hard disk in the configuration
    arg = none
}
function num_of_harddisks = {
    length(value("/hardware/harddisks"));
};

@documentation{
    desc = returns the disk where grub must be installed
    arg = none
}
function boot_disk = {
    base = "/hardware/harddisks";
    dsk = value(base);
    foreach (i; v; dsk) {
        path = format("%s/%s/boot", base, i);
        if ( exists(to_string(path)) && value(path) ) {
            return(i);
        };
    };
    undef;
};

@documentation{
        desc = Adds a list of logical volumes to a volume group. For more details, see \
 https://twiki.cern.ch/twiki/bin/view/FIOgroup/TsiCDBBlockDevices#Proposed_helper_functions
        arg = volume group, list of logical groups to add
}
function lvs_add = {
    if (length (ARGV) != 2) {
        error ("%s: should get 2 arguments", FUNCTION);
    };

    vg = ARGV[0];
    lv = ARGV[1];

    foreach (l; sz; lv) {
        SELF[l]["volume_group"] = vg;
        if (sz != -1) {
                SELF[l]["size"] = sz;
        };
    };
    # Validation stuff might be added here.
    SELF;
};

@documentation{
    desc = Adds a list of logical volumes to a volume group with mutiple lv options.
    arg = There are 2 mandatory arguments:\
        1: string - the volume group name\
        2: list of dicts representing the LVs desired. Supported keys within each dict are: size, raid_type
}
# deprecates lvs_add function.
function lvo_add = {
    if (ARGC != 2) {
        error ("%s: should get 2 arguments", FUNCTION);
    };
    vg = ARGV[0];
    lv_list = ARGV[1];
    # for each logical volume options defined, set the values.
    # Only size and raid type is supported.
    foreach (i; opt; lv_list) {
        SELF[i]["volume_group"] = vg;
        if (is_defined(opt['size']) && opt['size'] != -1) {
            SELF[i]["size"] = opt['size'];
        };
        if (is_defined(opt['raid_type'])) {
            SELF[i]["type"] = opt['raid_type'];
        };
    };
    # Validation stuff might be added here.
    SELF;
};

@documentation{
    desc = Adds a list of partitions to a disk
    arg = holding device, list of partitions to creatd, optionally id of the extended partition,
}
# First argument is the holding device. Second argument
# is a dict with one entry for each partition. The third argument, if any, is
# the name of the extended partition to be used. If there is no
# extended partition, the disk is supposed to have only primary
# partitions. This is true with GPT labels. See
# https://twiki.cern.ch/twiki/bin/view/FIOgroup/TsiCDBBlockDevices#Proposed_helper_functions
# for more details.
# The values in second argument dict  can be either a number interpreted as the partition size or a dict where only
# the keys 'size' and 'flags' are used (other keys are ignored).
function partitions_add = {
    if (ARGC < 2 || ARGC > 3) {
        error ("%s: requires 2 or 3 arguments", FUNCTION);
    };

    pt = ARGV[1];
    ep = if (ARGC == 3) ARGV[2];

    foreach (p; params; pt) {
        if (is_defined (ep)) {
            ns = matches (p, "[^0-9]([0-9]+)$");
            n = to_long (ns[1]);
            if (n > 4) {
                SELF[p]["type"] = "logical";
            } else if (p == ep) {
                SELF[p]["type"] = "extended";
            }; # Else, primary, which is the default
        };
        SELF[p]["holding_dev"] = ARGV[0];
        if ( is_dict(params) ) {
            part_params = params;
        } else {
            debug('%s: %s called with an implicit size argument for partition %s (%s)',
                    OBJECT, FUNCTION, p, params);
            part_params = dict('size', params);
        };
        if ( is_defined(part_params['size']) && (part_params['size'] != -1) ) {
            SELF[p]["size"] = part_params['size'];
        };
        # params['flags'] is a list containing the flags that must be set to true
        if ( is_defined(part_params['flags']) ) {
            foreach (i; flag; part_params['flags']) {
                SELF[p]['flags'][flag] = true;
            };
        };
    };

    SELF;
};


@documentation{
    desc = modify an existing entry in filesystem list or add it if it doesn't exist yet
    arg = list of structure_filesystem entries. If there is only one entry, a structure_filesystem \
 (dict) may be passed as argument
}
# Calling sequence: '/system/filesystems' = filesystem_mod(filesystems);
#
# For each entry in the list, an entry with the same mountpoint is replaced. If not entry with the
# same entry already exists, a new entry is added at the end of the list. Thus order of list 'filesystems'
# is preserved, except for entries already defined.

function filesystem_mod = {
    # Check the argument.  Code below uses fslist as a list of
    # dicts, each containing file system parameters.
    if ( ARGC != 1 ) {
        error('%s: usage: filesystem_mod(filesystems)', FUNCTION);
    } else if ( is_dict(ARGV[0]) ) {
        fslist = list(ARGV[0]);
    } else if ( is_list(ARGV[0]) ) {
        fslist = ARGV[0];
    } else {
        error('%s: argument must be a list of dict or a dict', FUNCTION);
    };

    # Ensure that SELF exists and is a list.
    if (!exists(SELF) || !is_defined(SELF)) {
        SELF[0] = 1;
        SELF[0] = null;
    };

    # Code below has been modified to use SELF reference directly.
    foreach (i; params; fslist) {

        # By default, add this entry to the end of SELF.
        found = length(SELF);

        # Search for the matching entry in SELF based on the
        # defined mountpoint.
        ok = first(SELF, fsnum, fsparams);
        while (ok) {

            if ( (params['mountpoint'] == fsparams['mountpoint']) ) {

                # Found a matching entry.  Save index and stop the loop.
                found = fsnum;
                ok = false;

            } else {

                # No match.  Get the next entry.
                ok = next(SELF, fsnum, fsparams);
            };
        };

        # If found, replace existing entry; if not, add to the
        # end of the list.
        SELF[found] = params;
    };

    SELF;
};


@documentation{
    desc = delete one or more filesystem from the filesystem list
    arg = one or a list of mountpoints (string) to remove from filesystem list
}
# Calling sequence: '/system/filesystems' = filesystem_del(mountpoints);
#
# For each mount point, if it is present in the filesystem list, remove it. If it is not
# present, silently ignore.

function filesystem_del = {
    if ( ARGC != 1 ) {
        error('%s: usage: filesytem_del(mountpoints)', FUNCTION);
    } else if ( is_string(ARGV[0]) ) {
        mpoints = list(ARGV[0]);
    } else if ( !is_list(ARGV[0]) ) {
        error('%s: argument must be a list of string or a string', FUNCTION);
    } else {
        mpoints = ARGV[0];
    };

    newfslist = list();

    foreach (fsnum; fsparams; SELF) {
        keep_fs = true;
        ok = first(mpoints, i, mpoint);
        while ( ok && keep_fs ) {
            if ( fsparams['mountpoint'] == mpoint ) {
                keep_fs = false;
            };
            ok = next(mpoints, i, mpoint);
        };
        if ( keep_fs ) {
            newfslist[length(newfslist)] = fsparams;
        };
    };

    newfslist;
};
