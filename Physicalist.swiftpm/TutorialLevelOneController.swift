//
//  TutorialLevelOneController.swift
//  Physicalist
//
//  Created by Pedro Franco on 17/04/23.
//

import SpriteKit


class TutorialLevelOneController: SKScene {
    var button =  SKSpriteNode()
    var text = SKSpriteNode()
    
    override func didMove(to view: SKView) {
        button = SKSpriteNode(imageNamed: "myButton")
        button.size = CGSize(width: 306, height: 108)
        button.position = CGPoint(x: 0, y: -240)
        button.zPosition = 0

        text = SKSpriteNode(imageNamed: "continue")
        text.size = CGSize(width: 240, height: 40)
        text.position = CGPoint(x: 0, y: -240)
        text.zPosition = 1
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.addChild(self.button)
            self.addChild(self.text)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
           
            if button.frame.contains(location) {
                let transition: SKTransition = SKTransition.fade(withDuration: 1)
                let storieScene = SKScene(fileNamed: "LevelOne")
                self.view?.presentScene(storieScene!, transition: transition)
            }
        }
    }
}
