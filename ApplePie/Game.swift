//
//  Game.swift
//  ApplePie
//
//  Created by user128830 on 8/30/17.
//  Copyright © 2017 user128830. All rights reserved.
//

import Foundation

struct Game {
    
    var word: String
    
    var incorrectMovesRemaining: Int
    
    // array of selected letters for current game
    var guessedLetters: [Character]
    
    mutating func playerGuessed(letter: Character) {
        // appending the array of chosen letters
        guessedLetters.append(letter)
        
        // decreasing the number of attampts for user in case of wrong letter
        if !word.characters.contains(letter) {
            incorrectMovesRemaining -= 1
        }
    }
    
    // computed property of 
    var formattedWord: String {
        
        var guessedWord = ""
        
        for letter in word.characters {
            if guessedLetters.contains(letter) {
                guessedWord += "\(letter)"
            } else {
                guessedWord += "*"
            }
        }
        print(guessedWord)
        return guessedWord
    }
    
    
}
