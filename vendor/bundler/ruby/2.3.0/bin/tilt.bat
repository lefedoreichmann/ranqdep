@ECHO OFF
IF NOT "%~f0" == "~f0" GOTO :WinNT
@"C:\Ruby23\bin\ruby.exe" "C:/Users/C0113339_2/Desktop/ranqdeployer-master/vendor/bundler/ruby/2.3.0/bin/tilt" %1 %2 %3 %4 %5 %6 %7 %8 %9
GOTO :EOF
:WinNT
@"C:\Ruby23\bin\ruby.exe" "%~dpn0" %*
