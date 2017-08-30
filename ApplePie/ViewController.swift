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
    
    // number of wins and losses for most down label
    var totalWins = 0
    var totalLosses = 0
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // instance of the Game struct that keeping information about current game
        var currentGame: Game!
        
        func newRound() {
            // capturing the first word from array
            print(listOfWords)
            let newWord = listOfWords.removeFirst()
            print(listOfWords)
            
            // intializing the instance
            currentGame = Game(word: newWord, incorrectMovesRemaining: incorrectMovesAlowed)
            
            
        }
        
        func updateUI() {
            scoreLabel.text = "Wins: \(totalWins), Losses: \(totalLosses)"
            treeImageView.image = UIImage(named: "Tree \(currentGame.incorrectMovesRemaining)")
        }
        
    }

    
    @IBAction func buttonTapped(_ sender: UIButton) {
        sender.isEnabled = false
    }


}

