//
//  ViewController.swift
//  ApplePie
//
//  Created by user128830 on 8/30/17.
//  Copyright © 2017 user128830. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var treeImageView: UIImageView!
    @IBOutlet weak var correctWordLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var letterButton: [UIButton]!
    
    var listOfWords = ["cat", "dog", "elephant"]
    
    // number between 1 and 7 because of number available images of the tree
    let incorrectMovesAlowed = 7
    
    // number of wins and losses for score label
    var totalWins = 0 {
        didSet {
            newRound()
        }
    }
    var totalLosses = 0 {
        didSet {
            newRound()
        }
    }
    
    // instance of the Game struct that keeping information about current game
    var currentGame: Game!
    
    
    // updates labels every newRound()
    func updateUI() {
        
        //adding spaces between letter in "word label" using computed property
        var letters = [String]()
        for letter in currentGame.formattedWord.characters {
                letters.append(String(letter))
            }
        let wordWithSpacing = letters.joined(separator: " ")

        correctWordLabel.text = wordWithSpacing
        
        // updating score label
        scoreLabel.text = "Wins: \(totalWins), Losses: \(totalLosses)"
        
        // updating image view
        treeImageView.image = UIImage(named: "Tree \(currentGame.incorrectMovesRemaining)")
        
        
    }
    
    func updateGameState() {
        if currentGame.incorrectMovesRemaining == 0 {
            totalLosses += 1
        } else if currentGame.word == currentGame.formattedWord {
            totalWins += 1
        } else {
            updateUI()
        }
        
    }
    
    func enableLetterButton(_ enable: Bool) {
        for button in letterButton {
            button.isEnabled = enable
        }
    }
    
    // everything that should be done when new game is starting
    func newRound() {
        
        if !listOfWords.isEmpty {
            // capturing the first word from array
            let newWord = listOfWords.removeFirst()
            
            // intializing the instance
            currentGame = Game(word: newWord, incorrectMovesRemaining: incorrectMovesAlowed, guessedLetters: [])
            
            // before new round all buttons should be enabled
            enableLetterButton(true)
            
            // calling updateUI() every round
            updateUI()
        } else {
            enableLetterButton(false)
        }

        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        newRound()

    }

    
    @IBAction func buttonTapped(_ sender: UIButton) {
        sender.isEnabled = false
        
        let letterString = sender.title(for: .normal)!
        let letter = Character(letterString.lowercased())
        currentGame.playerGuessed(letter: letter)
        updateUI()
        
        // is this the best place to run this method?
        updateGameState()
    
        print(letter)
        print(currentGame)
        
    }
    
    


}

