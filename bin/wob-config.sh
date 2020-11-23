#!/bin/bash

for option in $(/usr/bin/cat $1)
do
    echo -n "--$option ";
done 

