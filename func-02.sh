#!/bin/bash
function check_url(){
	curl -I -s $1|head -1 && return 0 || return 1
}
check_url http://127.0.0.1
