#!/bin/sh

ls -l $1 | awk '{print $5}'|tr -d '\n'
