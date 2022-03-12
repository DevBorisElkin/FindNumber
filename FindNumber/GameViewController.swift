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
    
    lazy var game:Game = Game(countItems: ButtonsCollection.count, time: Settings.shared.currentSettings.timeForGame, timerEnabled: Settings.shared.currentSettings.timerState) { [weak self] (statusGame, seconds) in
        
        //guard Settings.shared.currentSettings.timerState else {return}
        guard let self = self else {return}
        
        self.TimerLabel.text = seconds.secondsToString()
        self.updateInfoGame(with: statusGame)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpScreen()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        game.stopGame()
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
        
        self.TimerLabel.isHidden = !Settings.shared.currentSettings.timerState
        updateUI()
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
        //checkUIEnabled()
    }
    
    func checkUIEnabled(){
        print("NextDigit.isHidden:\(NextDigit.isHidden) NextDigit.isEnabled: \(NextDigit.isEnabled), NextDigit.text:\(NextDigit.text)")
    }
    
    private func updateInfoGame(with status:GameStatus){
        //print("updateInfoGame: \(status)")
        switch status {
        case .start:
            GameStatus.isHidden = false
            GameStatus.isEnabled = true
            GameStatus.text = "The Game Started!"
            GameStatus.textColor = .black
            NextDigit.isHidden = false
            NewGameBtn.isHidden = true
        case .fail:
            GameStatus.text = "You Have Lost!"
            GameStatus.textColor = .red
            NextDigit.isHidden = true
            NewGameBtn.isHidden = false
            showAlertActionSheet()
        case .win:
            GameStatus.text = "You Have Won!"
            GameStatus.textColor = .green
            NextDigit.isHidden = true
            NewGameBtn.isHidden = false
            
            if(game.isNewRecord){
                showAlert()
            }else{
                showAlertActionSheet()
            }
        }
    }
    private func showAlert(){
        let alert = UIAlertController(title: "New Record", message: "you have set new record!", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Okay", style: .default){ [weak self] (variable) in
            print("Closed alert")
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    private func showAlertActionSheet(){
        let alert = UIAlertController(title: "What you want to do next?", message: nil, preferredStyle: .actionSheet)
        let newGameAction = UIAlertAction(title: "Start new game", style: .default) { [weak self] UIAlertAction in
            self?.game.newGame()
            self?.setUpScreen()
        }
        let showRecord = UIAlertAction(title: "Check record", style: .default) { [weak self](_) in
            self?.performSegue(withIdentifier: "recordVC", sender: nil)
        }
        let menuAction = UIAlertAction(title: "Go to menu", style: .destructive) { [weak self] (_) in
            self?.navigationController?.popViewController(animated: true)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alert.addAction(newGameAction)
        alert.addAction(showRecord)
        alert.addAction(menuAction)
        alert.addAction(cancelAction)
        
        // решение для iPad т.к. экран слишком большой и модальному окошку нужно к чему-то "привязываться"
        if let popover = alert.popoverPresentationController{
            
            // привязанное к элементу UI
            popover.sourceView = GameStatus
            
            // не привязанное к элементу UI
            //popover.sourceView = self.view
            //popover.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 0, height: 0)
            //popover.permittedArrowDirections = UIPopoverArrowDirection.init(rawValue: 0) // "выключение" стрелочки
        }
        
        present(alert, animated: true, completion: nil)
    }
}
