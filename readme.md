## Platforms
There is a template for Linux and Windows. The Linux shell script does not need to have an extension _(`*.sh`)_ but can. Note that it will automatically omit the inclusion of the extension if kept when it comes to setting variables for the names of directories used.

## Use
Any sourceport can be used for the `<Engine>` parameter, though these templates were designed primarily around [GZDoom](https://zdoom.org/downloads). Paths for the engine, mods, saves, screenshots, settings, and WADs are predetermined but can be changed if desired. Included are two template configuration files, but it is advised to make your own or to at least check the samples. These are configured for a 1080p monitor, no texture filtering, and many other options. Define which type from the samples are provided in the check loop for the `ZDoom (<Type>).ini` value, this is placed as such for example based on the sample configurations provided. Once an engine, WAD, and mods are defined, simply save the modified file as a new file with a new name, ideally based on whatever WAD and/or mods were used. A special variable is  used in each script that reads and sets the name of the script file as variables in the script, this is so it is easier to compartmentalize different WADs and mods from one another and to avoid configuration conflicts.

## Additional Options
By default, the ` +screenblocks 11` flag is used, this will automatically set scaling for the HUD as well as other elements of a given WAD or mod but is optional. When declaring multiple mods, the `-file` flag only needs to be used once. E.G.:  `-file ".\Mods\Mod 1" ".\Mods\Mod 2" ".\Mods\Mod 3"` etc....
