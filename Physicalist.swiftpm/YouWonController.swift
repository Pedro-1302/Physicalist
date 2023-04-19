//
//  YouWonController.swift
//  Physicalist
//
//  Created by Pedro Franco on 14/04/23.
//

import SpriteKit

class YouWonController: SKScene {
    var nextLevel = SKSpriteNode()
    var mainMenu = SKSpriteNode()
    
    override func didMove(to view: SKView) {
        nextLevel = SKSpriteNode(imageNamed: "myButton")
        nextLevel.size = CGSize(width: 308, height: 108)
        nextLevel.position = CGPoint(x: 0, y: 20)
        nextLevel.zPosition = 0
        addChild(nextLevel)
        
        mainMenu = SKSpriteNode(imageNamed: "myButton")
        mainMenu.size = CGSize(width: 308, height: 108)
        mainMenu.position = CGPoint(x: 0, y: -180)
        mainMenu.zPosition = 0
        addChild(mainMenu)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            
            if nextLevel.frame.contains(location) {
                let transition: SKTransition = SKTransition.fade(withDuration: 1)
                let storieScene = SKScene(fileNamed: "LevelTwo")
                self.view?.presentScene(storieScene!, transition: transition)
            }
            
            if mainMenu.frame.contains(location) {
                let transition: SKTransition = SKTransition.fade(withDuration: 1)
                let storieScene = SKScene(fileNamed: "FirstScreen")
                self.view?.presentScene(storieScene!, transition: transition)
            }
        }
    }
}
