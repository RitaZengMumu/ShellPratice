#!/bin/bash
echo_chars(){
RED_COLOR='\E[1;31m'
GREEN_COLOR='\E[1;32m'
YELLOW_COLOR='\E[1;33m'
BLUE_COLOR='\E[1;34m'
PINK='\E[1;35m'
RES='\E[0m'
if [ $# -ne 2 ];then
   echo "Usage $0 content {red|yellow|blue|green}"
   exit
fi
case "$2" in
  red|RED)
         echo -e  "${RED_COLOR}$1${RES}"
         ;;
  yellow|YELLOW)
         echo -e  "${YELLOW_COLOR}$1${RES}"
         ;;
   green|GREEN)
         echo -e  "${GREEN_COLOR}$1${RES}"
         ;;
   blue|BLUE)
         echo -e  "${BLUE_COLOR}$1${RES}"
         ;;
   pink|PINK)
         echo -e  "${PINK_COLOR}$1${RES}"
         ;;
   *)
         echo -e  "${PINK_COLOR}$1${RES}"
esac
}
echo_chars  oldboy red
echo_chars  is yellow
echo_chars  a blue
echo_chars  handsome blue
echo_chars  boy pink
echo_chars  sanpang yellow
echo_chars  xiaowang pink


