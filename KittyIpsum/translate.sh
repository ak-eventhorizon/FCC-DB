#!/bin/bash

# Translates Kitty Ipsum to Doggy Ipsum

# usage example: 
# ./translate.sh kitty_ipsum_1.txt
# or
# cat kitty_ipsum_1.txt | ./translate.sh
# or
# ./translate.sh < kitty_ipsum_1.txt

cat $1 | sed 's/catnip/dogchow/g; s/cat/dog/g; s/meow|meowzer/woof/g' -r