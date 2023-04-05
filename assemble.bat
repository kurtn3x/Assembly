@echo off
set ProjectName=%~n1
if "%ProjectName%"=="" ( 
    echo No Input File given, exiting
    EXIT /B 1
)
echo Building...

nasm -f win64 -o %ProjectName%.obj %ProjectName%.asm
gcc -g -m64 %ProjectName%.obj -o %ProjectName%.exe

echo Script has following output:

.\%ProjectName%.exe
