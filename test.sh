#!/bin/bash

while read line; do
	$line
done < export.sh
