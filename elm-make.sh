#!/bin/zsh

for file in ls _elm/**/*.elm; do
    echo ${${file#*/}%.elm*}

    elm make ${file} --output=${${file#*/}%.elm*}.js
done
