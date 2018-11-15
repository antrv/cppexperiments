@echo off
set PATH=%PATH%;%DEVDIR%\Tools\clang\bin

set CONFIGURATION=%1
IF "%1"=="" (
  set CONFIGURATION=Debug
)

rem Generating static libraries from DLLs
set VSDIR=C:\Program Files (x86)\Microsoft Visual Studio\2017\Professional\VC\Tools\MSVC\14.15.26726\bin\Hostx64\x64
"%VSDIR%\dumpbin.exe" /EXPORTS "%SystemRoot%\system32\kernel32.dll" > libs\kernel32.exports
"%VSDIR%\lib.exe" /machine:x64 /def:libs\kernel32.def /out:libs\kernel32.lib

rem Building projects
if "%CONFIGURATION%"=="Debug" (
  set CXX_FLAGS=-g -gcodeview -gno-column-info
)
if "%CONFIGURATION%"=="Release" (
  set CXX_FLAGS=-O2
)

%DEVDIR%\Tools\fastbuild\FBuild.exe -noprogress -fixuperrorpaths -showcmds
