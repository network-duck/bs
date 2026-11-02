Our main remote execution wrapper script would have taken care of running each of our standalone hardening scripts across the domain in the following order:
    Inventory.ps1 - Collects information from each host such as users, startups, software, shares, and IIS site bindings.
    Fix.ps1 - Resolve any QOL issues like crazy fonts, hidden folders, non-English keyboards, and GPO roadblocks.
    Smb.ps1 - Disables SMBv1, forces security signatures, and deletes default shares.
    Php.ps1 - Disables dangerous functions and file uploads dynamically by finding all php.ini files.
    Log.p1 - Enables all types of PowerShell logging, sets audit policies, and installs Sysmon.
    Users.ps1 - Creates a new admin account and changes all passwords to something random.
    Hard.ps1 - Implements pass-the-hash mitigations, configures Windows defender and its extended capabilities, and sets up some fun tricks for red team to scratch their heads at.

