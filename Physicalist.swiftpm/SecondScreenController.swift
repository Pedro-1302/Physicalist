//
//  SecondScreenController.swift
//  Physicalist
//
//  Created by Pedro Franco on 10/04/23.
//

import Foundation
import SpriteKit

public var levelTwoBlocked = true
public var levelThreeBlocked = true

class SecondScreenController: SKScene {
    var button1 = SKSpriteNode()
    var button2 = SKSpriteNode()
    var button3 = SKSpriteNode()
    var levelAnimation1: SKSpriteNode?
    var levelAnimation2: SKSpriteNode?
    var levelAnimation3: SKSpriteNode?
    
    override func didMove(to view: SKView) {
        button1 = SKSpriteNode(imageNamed: "myButton")
        button1.size = CGSize(width: 308, height: 108)
        button1.position = CGPoint(x: 0, y: 160)
        addChild(button1)
        
        button2 = SKSpriteNode(imageNamed: "myButton")
        button2.size = CGSize(width: 308, height: 108)
        button2.position = CGPoint(x: 0, y: 0)
        button2.alpha = 0.5
        addChild(button2)
        
        button3 = SKSpriteNode(imageNamed: "myButton")
        button3.size = CGSize(width: 308, height: 108)
        button3.position = CGPoint(x: 0, y: -160)
        button3.alpha = 0.5
        addChild(button3)
        
        levelAnimation1 = childNode(withName: "levelAnimation1") as? SKSpriteNode
        levelAnimation1?.zPosition = 10
        levelAnimation2 = childNode(withName: "levelAnimation2") as? SKSpriteNode
        levelAnimation2?.zPosition = 10
        levelAnimation3 = childNode(withName: "levelAnimation3") as? SKSpriteNode
        levelAnimation3?.zPosition = 10
        
        if levelTwoBlocked != true {
            button2.alpha = 1
        }
        if levelThreeBlocked != true {
            button3.alpha = 1
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            
            if button1.frame.contains(location){
                let transition: SKTransition = SKTransition.fade(withDuration: 1)
                let storieScene = SKScene(fileNamed: "TutorialLevelOne")
                self.view?.presentScene(storieScene!, transition: transition)
            }
            
            if button2.frame.contains(location) && levelTwoBlocked != true {
                
                let transition: SKTransition = SKTransition.fade(withDuration: 1)
                let storieScene = SKScene(fileNamed: "LevelTwo")
                self.view?.presentScene(storieScene!, transition: transition)
            }
            
            if button3.frame.contains(location) && levelThreeBlocked != true {
                button3.alpha = 1
                let transition: SKTransition = SKTransition.fade(withDuration: 1)
                let storieScene = SKScene(fileNamed: "TutorialLevelThree")
                self.view?.presentScene(storieScene!, transition: transition)
            }
        }
    }
}
