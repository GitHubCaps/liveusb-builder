#!/bin/bash
# Copyright (C)  2016-2018 Iru Cai <mytbk920423@gmail.com>
# SPDX-License-Identifier: GPL-3.0-or-later

ISOINFOS=($(find distro -name isoinfo))
for _isoinfo in "${ISOINFOS[@]}"
do
	_distrobase="$(cut -d'/' -f1-2 <<< "$_isoinfo")"
	_distroisodir="$(dirname $_isoinfo | cut -d'/' -f2-)"
	if [ -f "$_distrobase/distroinfo" ]; then
		source "$_distrobase/distroinfo"
	else
		continue
	fi
	source "$_isoinfo"
	if [ -n "$ISONAME" ]; then
		echo "$_distroisodir: $ISONAME"
	fi
done

