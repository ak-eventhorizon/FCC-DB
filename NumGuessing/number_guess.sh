#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"


# ---------- Authorize part ----------
echo -e "Enter your username:"
read USER_NAME
CURRENT_USER_QUERY=$($PSQL "SELECT * FROM number_guess WHERE name = '$USER_NAME'")

# if no such user in database
if [[ -z $CURRENT_USER_QUERY ]]
then
  echo -e "Welcome, $USER_NAME! It looks like this is your first time here."
  
  NAME=$USER_NAME
  GAMES_PLAYED=0
  BEST_GAME=0

  CREATE_NEW_USER=$($PSQL "INSERT INTO number_guess(name, games_played, best_game) VALUES('$NAME', $GAMES_PLAYED, $BEST_GAME)")
else
  echo -e "$CURRENT_USER_QUERY" | while IFS="|" read USER_ID NAME GAMES_PLAYED BEST_GAME  # 3|Alex|13|8
  do
    echo -e "Welcome back, $NAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
  done
fi


# ---------- Game part ----------
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
      
      CURRENT_USER_QUERY=$($PSQL "SELECT name, best_game FROM number_guess WHERE name = '$USER_NAME'")
      echo -e "$CURRENT_USER_QUERY" | while IFS="|" read NAME BEST_GAME
      do
        GAMES_INCREMENT=$($PSQL "UPDATE number_guess SET games_played = games_played+1 WHERE name = '$NAME'")
        if [[ $BEST_GAME -eq 0 || $GUESS_ATTEMPTS -lt $BEST_GAME ]]
        then
          BEST_GAME_UPDATE=$($PSQL "UPDATE number_guess SET best_game = $GUESS_ATTEMPTS WHERE name = '$NAME'")
        fi
      done
    fi

  else
    echo -e "That is not an integer, guess again:"
  fi

done