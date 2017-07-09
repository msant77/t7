@echo off
rem
rem  Configures the classpath for Java and starts the TFS Cross Platform Command Line Client.
rem

setlocal ENABLEDELAYEDEXPANSION

set BASE_DIRECTORY=%~dp0
set SETTINGS_DIRECTORY=%USERPROFILE%\Local Settings\Application Data\Microsoft\Team Foundation\4.0\

if not exist "%BASE_DIRECTORY%lib\com.microsoft.tfs.core.jar" goto missingCoreJar

set CLC_CLASSPATH=

for %%i in ("%SETTINGS_DIRECTORY%policies\*.jar") do set CLC_CLASSPATH=!CLC_CLASSPATH!;"%%i"

for %%i in ("%BASE_DIRECTORY%lib\*.jar") do set CLC_CLASSPATH=!CLC_CLASSPATH!;"%%i"

setlocal DISABLEDELAYEDEXPANSION

java -Xmx512M -cp %CLC_CLASSPATH% "-Dcom.microsoft.tfs.jni.native.base-directory=%BASE_DIRECTORY%native" com.microsoft.tfs.client.clc.vc.Main %*

set RETURN_VALUE=%errorlevel%
goto end

:missingCoreJar
echo Unable to find a required JAR: %BASE_DIRECTORY%\lib\com.microsoft.tfs.core.jar does not exist
set RETURN_VALUE=1

:end
if "%TP_NON_INTERACTIVE%" NEQ "" exit %RETURN_VALUE%
exit /B %RETURN_VALUE%
