## Copyright (C) 2018-2019 Free Software Foundation, Inc.
##
## This program is free software: you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
##
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <http://www.gnu.org/licenses/>.

lexcalcdir = $(docdir)/%D%

## --------- ##
## LexCalc.  ##
## --------- ##

check_PROGRAMS += %D%/lexcalc
TESTS += %D%/lexcalc.test
EXTRA_DIST += %D%/lexcalc.test
nodist_%C%_lexcalc_SOURCES = %D%/parse.y %D%/scan.l
%D%/parse.c: $(dependencies)
# Make sure parse.h is created before compiling the scanner.  Don't
# use BUILT_SOURCES, since we want to use this bison.  Refer to
# parse.c, not parse.h, since Automake's dependencies don't see that
# parse.h comes from parse.y.
%C%_lexcalc_DEPENDENCIES = %D%/parse.c

# Don't use gnulib's system headers.
%C%_lexcalc_CPPFLAGS = -I$(top_srcdir)/%D% -I$(top_builddir)/%D%

dist_lexcalc_DATA = %D%/parse.y %D%/scan.l %D%/Makefile %D%/README.md
CLEANFILES += %D%/parse.[ch] %D%/scan.c %D%/parse.output
CLEANDIRS += %D%/*.dSYM
