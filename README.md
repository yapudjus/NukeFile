# NukeFile
### NukeFile utility script ###
This script will create a selected ammount of files of a selected size on a selected directory
USAGE : 

-- %0 { PathToNuke } { FileSize } { AmmountOfCopy }

-- %0 { ? ; -? ; --? ; /? ; --help }

PathToNuke : PathToNuke is the path where the files will land, script won't work if a wrong or inexisting path is specified
FileSize : FileSize is the size of the different files in KB
AmmountOfCopy : AmmountOfCopy is the ammount of files of the same size the script will create, be carefull because the more quantity, the more time it take
[if AmmountOfCopy is set to 0 it will loop indefinitely]not yet implemented , just do Ctrl+C to exit

if no arguments are specified, a config file will be used
the config file is named config.cfg and need to be located in the same directory as the script 
the config file must look like This :

##############################
PathToNuke={ path }
FileSize={ size }
AmmountOfCopy={ ammount }
##############################

The size is in bytes and it is realy important not to put any spaces except if it's in the path, in this case, put it in ""
this script need to be ran as administrator, i'm working on one that don't need administrator rights.
