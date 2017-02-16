#!/bin/bash


refscript=$(find . -iname "*ref*.sh")
info=$(find . -iname "info.txt")

ref="$(cat $info | grep ref | cut -d':' -f2).html"



$refscript > $ref

 
