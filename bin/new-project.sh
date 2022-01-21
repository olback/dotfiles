#!/bin/bash

set -e

#echo $@

SELF=$0
LANG=$1

function usage {
    echo "$SELF [lang] [name] <options>"
}

function generate_rust_project {
    echo "Generating new Rust Project \"$1\""
    cargo new $@
}

function generate_c_project {
    echo "Generating new C Project \"$1\""
    mkdir $1
    cd $1

    # Create main file
    printf "#include <stdio.h>\n\n int main(int argc, char **argv, char **env) {\n    printf(\"Hello, World!\\\n\");\n    return 0;\n}\n" > main.c

    # Create Makefile
    printf 'PKGS=\nCLFAGS=-Wall -Wextra `pkg-config --cflags $(PKGS)`\nLIBS=`pkg-config --libs $(PKGS)`\nSRC=main.c\n\n'$1': $(SRC)\n\t$(CC) $(CLFAGS) -o '$1' $(SRC) $(LIBS)\n\n' > Makefile

    # Ignore exe
    printf "$1\n" > .gitignore

    # Init git
    git init
}

if [ $# -lt 2 ]; then
    usage;
    exit 1
fi

if [ -d $2 ]; then
    echo "Directory \"$2\" already exists"
    exit 1
fi

# Pop lang
shift

case $LANG in
    rust)
        generate_rust_project $@
        ;;
    c)
        generate_c_project $@
        ;;
    *)
        echo "Unknown language \"$LANG\""
        usage;
        exit 1
        ;;
esac

