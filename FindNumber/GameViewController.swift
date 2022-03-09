//
//  GameViewController.swift
//  FindNumber
//
//  Created by macuser on 3/6/22.
//

import UIKit

class GameViewController: UIViewController {

    @IBOutlet var ButtonsCollection: [UIButton]!
    
    @IBOutlet weak var GameStatus: UILabel!
    @IBOutlet weak var NextDigit: UILabel!
    @IBOutlet weak var TimerLabel: UILabel!
    
    @IBOutlet weak var NewGameBtn: UIButton!
    
    @IBAction func NewGameClicked(_ sender: UIButton) {
        game.newGame()
        sender.isHidden = true
        setUpScreen()
    }
    
    lazy var game:Game = Game(countItems: ButtonsCollection.count, time: 30) { [weak self] (statusGame, seconds) in
        guard let self = self else {return}
        self.TimerLabel.text = seconds.secondsToString()
        self.updateInfoGame(with: statusGame)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpScreen()
    }
    
    @IBAction func pressButton(_ sender: UIButton) {
        guard let buttonIndex = ButtonsCollection.firstIndex(of: sender) else {return}
        
        game.check(index: buttonIndex)
        updateUI()
    }
    
    private func setUpScreen(){
        for index in game.items.indices{
            ButtonsCollection[index].setTitle(game.items[index].title, for: .normal)
            ButtonsCollection[index].alpha = 1
            ButtonsCollection[index].isEnabled = true
        }
        NewGameBtn.isHidden = true
        NextDigit.isHidden = false
        NextDigit.text = game.nextItem?.title
    }
    
    private func updateUI(){
        for index in game.items.indices{
            ButtonsCollection[index].alpha = game.items[index].isFound == true ? 0 : 1
            ButtonsCollection[index].isEnabled = game.items[index].isFound == true ? false : true
            
            if(game.items[index].isError){
                UIView.animate(withDuration: 0.3) { [weak self] in
                    self?.ButtonsCollection[index].backgroundColor = .red
                } completion: { [weak self] (_) in
                    self?.ButtonsCollection[index].backgroundColor = .white
                    self?.game.items[index].isError = false
                }

            }
        }
        NextDigit.text = game.nextItem?.title
        
        updateInfoGame(with: game.gameStatus)
    }
    private func updateInfoGame(with status:GameStatus){
        switch status {
        case .start:
            GameStatus.text = "The Game Started!"
            GameStatus.textColor = .black
            NextDigit.isHidden = false
            NewGameBtn.isHidden = true
        case .fail:
            GameStatus.text = "You Have Lost!"
            GameStatus.textColor = .red
            NextDigit.isHidden = true
            NewGameBtn.isHidden = false
        case .win:
            GameStatus.text = "You Have Won!"
            GameStatus.textColor = .green
            NextDigit.isHidden = true
            NewGameBtn.isHidden = false
        }
    }
}
