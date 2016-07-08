#!/bin/sh
exec /cygdrive/c/prog/larceny-0.99-bin-native-ia32-win32/larceny.bat -path ../rapid-scheme -r7rs -program rapid-compiler-gambit.scm -- -I ../rapid-scheme -I ../rapid-scheme/share rapid-compiler-gambit.scm > core.scm
 
