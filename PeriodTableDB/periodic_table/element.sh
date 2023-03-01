#!/bin/bash

# If you run   ./element.sh 1   or   ./element.sh H   or   ./element.sh Hydrogen
# it should output:
# The element with atomic number 1 is Hydrogen (H). It's a nonmetal, with a mass of 1.008 amu. Hydrogen has a melting point of -259.1 celsius and a boiling point of -252.9 celsius.

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"


# If script called with no argument - echo console message
if [[ $1 == "" ]]
then
  echo -e "Please provide an element as an argument."
else
  # if argument is integer number
  if [[ $1 =~ ^[0-9]+$ ]]
  then
    #echo -e "$1 is a number\n"
    ELEMENT=$($PSQL "SELECT * FROM properties INNER JOIN elements USING(atomic_number) INNER JOIN types USING(type_id) WHERE atomic_number=$1")
  # if argument is one(upper)/two(lower) letter string -> H or He etc.
  elif [[ $1 =~ ^[A-Z][a-z]?$ ]]
  then
    #echo -e "$1 is one/two letters - SYMBOL of element\n"
    ELEMENT=$($PSQL "SELECT * FROM properties INNER JOIN elements USING(atomic_number) INNER JOIN types USING(type_id) WHERE symbol='$1'")
  # if argument is a string more then two letters -> Hydrogen or Lithium etc.
  elif [[ $1 =~ ^[A-Z][a-z]+$ ]]
  then
    #echo -e "$1 is NAME of element\n"
    ELEMENT=$($PSQL "SELECT * FROM properties INNER JOIN elements USING(atomic_number) INNER JOIN types USING(type_id) WHERE name='$1'")
  fi

  # if element query is empty
  if [[ -z $ELEMENT ]]
  then
    echo -e "I could not find that element in the database."
  else
    #echo -e "$ELEMENT"
    echo -e "$ELEMENT" | while IFS="|" read TYPE_ID ATOMIC_NUMBER ATOMIC_MASS MELTING_POINT BOILING_POINT ELEMENT_SYMBOL ELEMENT_NAME ELEMENT_TYPE
    do
      echo -e "The element with atomic number $ATOMIC_NUMBER is $ELEMENT_NAME ($ELEMENT_SYMBOL). It's a $ELEMENT_TYPE, with a mass of $ATOMIC_MASS amu. $ELEMENT_NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
    done
  fi
fi