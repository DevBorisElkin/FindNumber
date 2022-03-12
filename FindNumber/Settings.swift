//
//  Settings.swift
//  FindNumber
//
//  Created by macuser on 3/12/22.
//

import Foundation

enum KeysUserDefaults{
    static let settingsGame = "settingsGame"
    static let recordGame = "recordGame"
}

// struct SettingsGame: Deconable, Encodable // можно записать так, но протокол Codable
// содержит в себе все сразу

struct SettingsGame:Codable{
    var timerState:Bool
    var timeForGame:Int
}

class Settings{
    static var shared = Settings()
    
    let defaultSettings = SettingsGame(timerState: true, timeForGame: 30)
    
    var currentSettings:SettingsGame{
        get{
            if let data = UserDefaults.standard.object(forKey: KeysUserDefaults.settingsGame) as? Data{
                return try! PropertyListDecoder().decode(SettingsGame.self, from: data)
            }else{
                if let data = try? PropertyListEncoder().encode(defaultSettings){
                    UserDefaults.standard.setValue(data, forKey: KeysUserDefaults.settingsGame)
                }
                return defaultSettings
            }
        }
        set{
            //do{
            //    let data = try PropertyListEncoder().encode(newValue)
            //}catch{
            //    print(error)
            //}
            if let data = try? PropertyListEncoder().encode(newValue){
                UserDefaults.standard.setValue(data, forKey: KeysUserDefaults.settingsGame)
            }
        }
    }
}
