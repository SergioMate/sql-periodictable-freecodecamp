#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t -c"

if [ -z $1 ]
then
  echo "Please provide an element as an argument."
else
  ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE atomic_number=$1")
  SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE symbol=$1")
  NAME=$($PSQL "SELECT name FROM elements WHERE name=$1")
fi