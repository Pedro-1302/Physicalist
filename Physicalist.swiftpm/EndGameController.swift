//
//  EndGameController.swift
//  Physicalist
//
//  Created by Pedro Franco on 16/04/23.
//

import SpriteKit

class EndGameController: SKScene {
    var playAgain = SKSpriteNode()
    var mainMenu = SKSpriteNode()
    
    override func didMove(to view: SKView) {
        playAgain = SKSpriteNode(imageNamed: "myButton")
        playAgain.size = CGSize(width: 308, height: 108)
        playAgain.position = CGPoint(x: 0, y: 20)
        playAgain.zPosition = 0
        addChild(playAgain)
        
        mainMenu = SKSpriteNode(imageNamed: "myButton")
        mainMenu.size = CGSize(width: 308, height: 108)
        mainMenu.position = CGPoint(x: 0, y: -180)
        mainMenu.zPosition = 0
        addChild(mainMenu)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            
            if playAgain.frame.contains(location){
                let transition: SKTransition = SKTransition.fade(withDuration: 1)
                let storieScene = SKScene(fileNamed: "SecondScreen")
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
