@echo off

call "C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\vcvarsall.bat" x64

cl -EHsc -DSFML_STATIC /I"C:\opencv\build\include" %1 "C:\opencv\build\x64\vc14\lib\opencv_world341.lib"
