//
//  GameOver2Controller.swift
//  Physicalist
//
//  Created by Pedro Franco on 16/04/23.
//

import SpriteKit

class GameOver2Controller: SKScene {
    var restart = SKSpriteNode()
    var mainMenu = SKSpriteNode()
    
    override func didMove(to view: SKView) {
        restart = SKSpriteNode(imageNamed: "myButton")
        restart.size = CGSize(width: 308, height: 108)
        restart.position = CGPoint(x: 0, y: 20)
        addChild(restart)
        
        mainMenu = SKSpriteNode(imageNamed: "myButton")
        mainMenu.size = CGSize(width: 308, height: 108)
        mainMenu.position = CGPoint(x: 0, y: -180)
        addChild(mainMenu)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            
            if restart.frame.contains(location){
                let transition: SKTransition = SKTransition.fade(withDuration: 1)
                let storieScene = SKScene(fileNamed: "LevelTwo")
                self.view?.presentScene(storieScene!, transition: transition)
            }
            
            if mainMenu.frame.contains(location){
                let transition: SKTransition = SKTransition.fade(withDuration: 1)
                let storieScene = SKScene(fileNamed: "FirstScreen")
                self.view?.presentScene(storieScene!, transition: transition)
            }
        }
    }
}
