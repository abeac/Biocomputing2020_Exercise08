#generate cumulative score graph as function of game time
score <- read.table("UWvMSU_1-22-13.txt", header = TRUE)
#seperate scores of UW and MSU
UWscore= cumsum(score$score[score$team == "UW"])
MSUscore= cumsum(score$score[score$team == "MSU"])
#seperate time scored for each team
UWtime= score$time[score$team == "UW"]
MSUtime= score$time[score$team == "MSU"]
#combine cumulative score and time scored into a dataframe for each team
UWdf <- data.frame(x = UWtime[], y = UWscore[])
MSUdf <- data.frame(x = MSUtime[], y = MSUscore[])
#generate simple line plot
plot(UWdf$x, UWdf$y, type = "l", col = "red", ylab = "Score", xlab = "Time")
#add line for second team
lines(MSUdf$x, MSUdf$y, col = "green")


#write a game called "guess my number"
guess= 0
answer= -1
while(guess != answer){
  answer <- sample(1:100, size = 1, replace = TRUE, prob = NULL) #computer generates number between 1 and 100
  cat("I'm thinking of a number 1-100...") 
  guess <- readline(prompt = "Guess:") #prompts user to pick a number
  for(i in 1:10){ #allows a maximum of 10 guesses
    if (guess == answer){ #if user guesses right, prints "Correct!" and game ends
        cat ("Correct!")
        break
    } else {
        if(i == 10){ #if users guesses incorrectly 10 times
         cat("You ran out of guesses")
        } else {
            if(guess < answer){ #user guesses a number smaller than the correct answer
              cat ("Higher")
            } else { #user guesses a number larger than the correct answer
              cat ("Lower")
        }
      guess <- readline(prompt = "Guess:") #prompts another guess after an incorrect guess
      }
    }
  }
}
