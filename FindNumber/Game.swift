//
//  Game.swift
//  FindNumber
//
//  Created by macuser on 3/8/22.
//

import Foundation

enum GameStatus{
    case start
    case win
    case fail
}

class Game{
    
    struct Item{
        var title:String
        var isFound:Bool = false
        var isError = false
    }
    
    private let data = Array(1...99)
    
    var items:[Item] = []
    
    var nextItem:Item?
    
    private var countItems:Int
    
    var isNewRecord = false
    
    var gameStatus:GameStatus = .start{
        didSet{
            if (gameStatus == .win || gameStatus == .fail){ // if status != .start
                
                if(gameStatus == .win && Settings.shared.currentSettings.timerState){
                    let newRecord = timeForGame - secondsGame
                    
                    let record = UserDefaults.standard.integer(forKey: KeysUserDefaults.recordGame)
                    if(record == 0 || (newRecord < record)){
                        UserDefaults.standard.set(newRecord, forKey: KeysUserDefaults.recordGame)
                        isNewRecord = true
                    }
                }
                
                stopGame()
            }
        }
    }
    
    private var secondsGame:Int{
        didSet{
            if(secondsGame <= 0){
                gameStatus = .fail
            }
            updateTimer(gameStatus, secondsGame)
        }
    }
    private var timeForGame:Int
    
    private var timerEnabled:Bool
    
    private var timer:Timer?
    
    private var updateTimer:((GameStatus,Int)->Void)
                                                                                    //  ->()   // alternative way
    init(countItems:Int, time:Int, timerEnabled:Bool, updateTimer: @escaping (_ statusGame:GameStatus, _ seconds:Int)->Void){
        self.countItems = countItems
        self.secondsGame = time
        self.timeForGame = time
        self.timerEnabled = timerEnabled
        self.updateTimer = updateTimer
        setUpGame()
    }
    
    private func setUpGame(){
        isNewRecord = false
        var digits = data.shuffled()
        items = [Item]()
        
        while items.count < countItems{
            let item = Item(title: String(digits.removeFirst()))
            items.append(item)
        }
        
        nextItem = items.shuffled().first
        updateTimer(gameStatus, secondsGame)
        
        guard timerEnabled else {return}
        
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: {[weak self](_) in
            self?.secondsGame -= 1
        })
    }
    
    func check(index:Int){
        guard gameStatus == .start else {return}
        if(items[index].title == nextItem?.title){
            items[index].isFound = true
            nextItem = items.shuffled().first(where: { (item) -> Bool in
                item.isFound == false
            })
        }else{
            items[index].isError = true
        }
        
        if nextItem == nil{
            gameStatus = .win
        }
    }
    
    func stopGame(){
        timer?.invalidate()
    }
    
    func newGame(){
        self.secondsGame = timeForGame
        gameStatus = .start
        setUpGame()
    }
}

extension Int{
    func secondsToString() -> String{
        let minutes = self / 60
        let seconds = self % 60
        return String(format: "%d:%02d", minutes, seconds)
    }
}
