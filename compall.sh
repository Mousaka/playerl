#!/bin/bash
for i in *.erl; do
    echo "Compiling $i ..."
    erl -compile $i
done