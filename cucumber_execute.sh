#!/bin/sh

printf "\nChanging to default mobileweb directory:"
printf "\n~/source/nexia_test/mobileweb"
printf "\n"
cd ~/source/nexia_test/mobileweb
printf "Executing Commands:\n"
printf "cucumber --tags @splash_page"
cucumber --tags @splash_page
printf "cucumber --tags @signin_page"
cucumber --tags @signin_page