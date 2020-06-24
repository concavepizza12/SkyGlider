@echo off

::
::  ____  _____  _____     _     ____   _____  _     ____  _____  __   
:: / ___||_   _|| ____|   / \   |  _ \ |  ___|/ \   / ___||_   _|/ /_  
:: \___ \  | |  |  _|    / _ \  | | | || |_  / _ \  \___ \  | | | '_ \ 
::  ___) | | |  | |___  / ___ \ | |_| ||  _|/ ___ \  ___) | | | | (_) |
:: |____/  |_|  |_____|/_/   \_\|____/ |_| /_/   \_\|____/  |_|  \___/ 
::                                                    
:: This program is free software: you can redistribute it and/or modify
:: it under the terms of the GNU Lesser General Public License as published by
:: the Free Software Foundation, either version 3 of the License, or
:: (at your option) any later version.
::
:: @author Steadfast5 Team
:: @link https://steadfast5.tk
::

TITLE Steadfast6 server software for Minecraft: Bedrock Edition
cd /d %~dp0

if exist bin\php\php.exe (
	set PHPRC=""
	set PHP_BINARY=bin\php\php.exe
) else (
	set PHP_BINARY=php
)

if exist Steadfast6.phar (
	set POCKETMINE_FILE=Steadfast6.phar
) else (
	if exist src\pocketmine\PocketMine.php (
		set POCKETMINE_FILE=src\pocketmine\PocketMine.php
	) else (
		echo "Couldn't find a valid Steadfast6 installation"
		pause
		exit 1
	)
)

REM if exist bin\php\php_wxwidgets.dll (
REM 	%PHP_BINARY% %POCKETMINE_FILE% --enable-gui %*
REM ) else (
	if exist bin\mintty.exe (
		start "" bin\mintty.exe -o Columns=88 -o Rows=32 -o AllowBlinking=0 -o FontQuality=3 -o Font="DejaVu Sans Mono" -o FontHeight=10 -o CursorType=0 -o CursorBlinks=1 -h error -t "PocketMine-MP" -i bin/pocketmine.ico -w max %PHP_BINARY% %POCKETMINE_FILE% --enable-ansi %*
	) else (
		%PHP_BINARY% -c bin\php %POCKETMINE_FILE% %*
	)
REM )
