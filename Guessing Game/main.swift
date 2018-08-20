//
//  main.swift
//  Kyle's Awesome Guessing Game
//
//  Created by Kyle Houts on 8/16/18.
//  Copyright © 2018 Kyle Houts. All rights reserved.
//

import Foundation

// response to "play again?" prompt
var input2: String = "yes"

repeat {
    // number of tries
    var numberOfTries = 5
    
    var guessedNumber: Int? = nil
    
    
    // welcome message and instructions
    print("Welcome to Kyle's Awesome Guessing Game! You have 5 tries to guess the correct number between 1 and 100. Good luck!")
    
    
    // generate a random number
    var correct = Int(arc4random_uniform(99)) + 1
    
    
    // GUESS
    repeat{
        //accept user input
        var input: Int?
        repeat{
            print("Please enter a number..", terminator: ". ")
            input = Int(readLine()!) // should never be nil
            if let input = input {
                if input <= 100 && input >= 1  {
                    guessedNumber = input
                } else if input == 999 {
                    print(correct, "is the correct number, cheater! 😵")
                } else {
                    print("Please enter a number between 1 and 100.")
                    guessedNumber = nil
                }
            } else {
                print("Please enter a number")
                guessedNumber = nil
            }
        } while guessedNumber   == nil
        
        guard let guessedNumber = guessedNumber  else {fatalError()}
        
        // number of tries takes away 1 for each guess
        numberOfTries -= 1
        
        

        // if guess == correct, tell user "you win!". give option to restart or quit. if restart, start from beginning.
        if guessedNumber == correct {
            print("YOU WIN!!! Play again? Type 'yes' or 'no'", terminator: ". ")
            input2 = String(readLine()!)
        }
        
        // if out of tries
        if numberOfTries < 1 && guessedNumber != correct {
            print("You are out of tries! The correct number was" ,correct, "Play again? Type 'yes or 'no'", terminator: ". ")
            input2 = String(readLine()!)
        }
        
        
        // if guess > correct, tell user the guess was too high and to guess again with however many attempts user has left
        if guessedNumber > correct && numberOfTries > 0 {
            print("Your guess was too high! You have", numberOfTries, "tries left.")
        }
        
        // if guess < correct, tell user the guess was too low and to guess again with however many attemps user has left
        if guessedNumber < correct && numberOfTries > 0 {
            print("Your guess was too low! You have", numberOfTries, "tries left.")
        }
        
    // repeats while guess is not correct and there tries left
    } while guessedNumber != correct && numberOfTries > 0
  
// repeats game if user types "yes" to "play again" prompt, otherwise prints "thanks for playing"
} while input2.lowercased() == "yes"
print("Thanks for playing!")



















