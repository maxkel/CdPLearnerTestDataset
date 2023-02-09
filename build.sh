#!/bin/bash

Help()
{
   # Display Help
   echo "This script automatically generates a dataset out of the required directories"
   echo "Warning: It does not check integrity. It just automatically zips it"
   echo
   echo "Syntax: scriptTemplate -v"
   echo "options:"
   echo "v      provide the application version"
   echo
}


while getopts v:h: flag
do
    case "${flag}" in
        v) version=${OPTARG};;
        h) help=${OPTARG};;
    esac
done

if [ -z "$help"]
then
    echo ""
else
    Help
    exit 0
fi

if [ -z "$version" ]
then
    echo "Error creating file: No version specified"
    Help
    exit 1
fi

rm -r .build/*
rmdir .build
mkdir .build

zip -r .build/CdPLearnerTestDatasetV$version.zip ./config.json ./data.json ./images/ ./videos/
