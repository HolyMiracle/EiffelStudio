#!/local/bin/bash

# system:     "Gobo Eiffel Yacc: syntactical analyzer generator"
# compiler:   "SmallEiffel -0.78"
# author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
# copyright:  "Copyright (c) 1999, Eric Bezault"
# date:       "$Date$"
# revision:   "$Revision$"


echo ${GOBO}/src/geyacc/>							loadpath.se

#		-- Gobo Eiffel Lexical Library
echo ${GOBO}/library/lexical/skeleton/>>			loadpath.se

#		-- Gobo Eiffel Parse Library
echo ${GOBO}/library/parse/error/>>					loadpath.se
echo ${GOBO}/library/parse/fsm/>>					loadpath.se
echo ${GOBO}/library/parse/generation/>>			loadpath.se
echo ${GOBO}/library/parse/grammar/>>				loadpath.se
echo ${GOBO}/library/parse/parser/>>				loadpath.se
echo ${GOBO}/library/parse/skeleton/>>				loadpath.se
echo ${GOBO}/library/parse/support/>>				loadpath.se
echo ${GOBO}/library/parse/yacc/>>					loadpath.se

#		-- Gobo Eiffel Utility Library
echo ${GOBO}/library/utility/command/>>				loadpath.se
echo ${GOBO}/library/utility/error/>>				loadpath.se
echo ${GOBO}/library/utility/formatter/>>			loadpath.se
echo ${GOBO}/library/utility/support/>>				loadpath.se

#		-- Gobo Eiffel Kernel Library
echo ${GOBO}/library/kernel/>>						loadpath.se
echo ${GOBO}/library/kernel/spec/se/>>				loadpath.se

#		-- Gobo Eiffel Structure Library
echo ${GOBO}/library/structure/container/>>			loadpath.se
echo ${GOBO}/library/structure/cursor/>>			loadpath.se
echo ${GOBO}/library/structure/list/>>				loadpath.se
echo ${GOBO}/library/structure/search/>>			loadpath.se
echo ${GOBO}/library/structure/sort/>>				loadpath.se
echo ${GOBO}/library/structure/support/>>			loadpath.se
echo ${GOBO}/library/structure/stack/>>				loadpath.se
echo ${GOBO}/library/structure/table/>>				loadpath.se

#		-- SmallEiffel Kernel
# echo ${SmallEiffelDir}/lib_std/>>					loadpath.se


export geoptions="-boost -no_split -no_style_warning -no_gc"
compile $geoptions GEYACC execute
