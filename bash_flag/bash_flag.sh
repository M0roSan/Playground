#!/bin/bash
#set -x

# ENV arguments:
# bar=<argument to print>

function usage() {
    echo "$0 [options]"
    echo ""
    echo " Options:"
    echo "  -f|--foo:       Print foo"
    echo "  -b|--bar:       Print arg passed to bar"
    echo "  -h|--help:      Help"
}

set -o pipefail -o noclobber -o nounset

! getopt --test > /dev/null
if [[ ${PIPESTATUS[0]} -ne 4 ]]; then
    echo "\`getopt --test\` failed in this environment"
    exit 1
fi

OPTIONS=hfb:
LONGOPTS=help,foo,bar:
! PARSED=$(getopt --options=$OPTIONS --longoptions=$LONGOPTS --name "$0" -- "$@")
if [[ ${PIPESTATUS[0]} -ne 0 ]]; then
    exit 2
fi
eval set -- "$PARSED"

is_foo=n is_bar=n help=n
while true; do
	case "$1" in 
		-f|--foo)
			is_foo=y
			shift
			;;
		-b|--bar)
			is_bar=y
			bar=$2
			shift 2
			;;
		-h|--help)
			help=y
			shift
			;;
		--)
			shift
			break
			;;
		*)
			echo "Undefined"
			exit 3
			;;
		esac
done

if [ "$help" == "y" ]; then
	usage
	exit 0
fi

if [ "$is_foo" == "y" ]; then
	echo "foo is called"
fi

if [ "$is_bar" == "y" ]; then
	echo "bar is called with argument ${bar}"
fi

exit 0