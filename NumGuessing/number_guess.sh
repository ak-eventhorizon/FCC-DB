#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

CURRENT_RANDOM=$((1 + $RANDOM % 1000)) # random number between 1 and 1000 (inclusive)
GUESS_ATTEMPTS=1
IS_NUMBER_GUESSED=false

echo -e "Guess the secret number between 1 and 1000:"

while ! $IS_NUMBER_GUESSED
do
  read CURRENT_GUESS

  # if argument is integer number
  if [[ $CURRENT_GUESS =~ ^[0-9]+$ ]]
  then

    # if guess is lesser then
    if [[ $CURRENT_GUESS -lt $CURRENT_RANDOM ]]
    then
      GUESS_ATTEMPTS=$(($GUESS_ATTEMPTS + 1))
      echo -e "It's lower than that, guess again:"
    # if guess is greater then
    elif [[ $CURRENT_GUESS -gt $CURRENT_RANDOM ]]
    then
      GUESS_ATTEMPTS=$(($GUESS_ATTEMPTS + 1))
      echo -e "It's higher than that, guess again:"
    # if number guessed
    elif [[ $CURRENT_GUESS -eq $CURRENT_RANDOM ]]
    then
      IS_NUMBER_GUESSED=true
      echo -e "You guessed it in $GUESS_ATTEMPTS tries. The secret number was $CURRENT_RANDOM. Nice job!"
    fi

  else
    echo -e "That is not an integer, guess again:"
  fi

done