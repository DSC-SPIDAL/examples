#!/bin/bash

nodes=1
name="$nodes"n
nodefile=nodes.txt

./run.generic.sh 1 24 $name samplerun 512 m $nodes $nodefile 
