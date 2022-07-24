#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t -c"

if [ -z $1 ]
then
  echo "Please provide an element as an argument."
else
  if [[ "$1" =~ ^[0-9]+$ ]]
  then
    CONDITION="atomic_number=$1"
  else
    CONDITION="symbol='$1' OR name='$1'"
  fi

  SELECTED=$($PSQL "SELECT atomic_number, name, symbol, type, atomic_mass, name, melting_point_celsius, boiling_point_celsius FROM elements JOIN properties USING(atomic_number) JOIN types USING(type_id) WHERE $CONDITION")
  echo $SELECTED
fi