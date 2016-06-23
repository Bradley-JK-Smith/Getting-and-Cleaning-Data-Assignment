@echo off

set FILE=%~n0

TITLE %FILE%


echo Running %FILE%.R ...

"C:\Program Files\R\R-3.2.1\bin\i386\Rscript.exe" "%FILE%.R" 1> "%FILE%.log" 2>&1
