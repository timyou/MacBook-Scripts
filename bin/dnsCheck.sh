#!/bin/bash
# Command Line -d debug Hardware

echo ""
echo ""
scutil --dns | grep nameserver | sort -u
echo ""
