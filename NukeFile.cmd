@echo off
SET mypath=%~dp0

if not "%1%"=="" (
    if "%1%"=="?" (
        goto azedb
    ) else (
        if "%1%"=="-?" (
            goto azedb
        ) else (
            if "%1%"=="--?" (
                goto azedb
            ) else (
                if "%1%"=="--help" (
                    goto azedb
                ) else (
                    if "%1%"=="/?" (
                        goto azedb
                    ) else (
                        goto azedc
                    )
                )
            )
        )
    )
)


:azedc
    if not "%2%"=="" (
        if not "%3%"=="" (
            set PathToNuke=%1
            set FileSize=%2
            set AmmountOfCopy=%3
            goto azeda
        )
    )

if exist .\config.cfg (
    for /f "tokens=* delims=" %%# in (
        config.cfg
    ) do (
        call set "%%#"
    )
) else (
    exit
)

:azeda
    if defined PathToNuke if defined FileSize if defined AmmountOfCopy (
        cd %PathToNuke%
        for /L %%g in (1, 1, %AmmountOfCopy%) do (
            fsutil file createnew %random%%random%%random%%random%%random%.%FileSize%.%%g %FileSize%
        )
    ) else (
        echo exiting without doing shit...
        goto eof
    )
    cd %mypath%
goto eof
:azedb

    echo ### NukeFile utility script ###
    echo This script will create a selected ammount of files of a selected size on a selected directory
    echo USAGE : 
    echo:
    echo -- %0 { PathToNuke } { FileSize } { AmmountOfCopy }
    echo:
    echo -- %0 { ? ; -? ; --? ; /? ; --help }
    echo:
    echo PathToNuke : PathToNuke is the path where the files will land, script won't work if a wrong or inexisting path is specified
    echo FileSize : FileSize is the size of the different files in KB
    echo AmmountOfCopy : AmmountOfCopy is the ammount of files of the same size the script will create, be carefull because the more quantity, the more time it take
    echo [if AmmountOfCopy is set to 0 it will loop indefinitely]not yet implemented , just do Ctrl+C to exit
    echo:
    echo if no arguments are specified, a config file will be used
    echo the config file is named config.cfg and need to be located in the same directory as the script 
    echo the config file must look like This :
    echo:
    echo ##############################
    echo PathToNuke={ path }
    echo FileSize={ size }
    echo AmmountOfCopy={ ammount }
    echo ##############################
    echo:
    echo The size is in bytes and it is realy important not to put any spaces except if it's in the path, in this case, put it in ""
    echo this script don't need to be ran as administrator except if the acess to the specified path is restricted.
    echo:
    pause
:eof