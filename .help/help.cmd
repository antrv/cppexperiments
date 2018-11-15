@echo off
set PATH=%PATH%;%DEVDIR%\Tools\clang\bin

clang++.exe --help > clang_help.txt
lld-link.exe /? > lld-link_help.txt
