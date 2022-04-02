#!/bin/sh
grep -A 1 'CFBundleIdentifier' "$1/Contents/Info.plist"
