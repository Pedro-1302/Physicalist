//
//  LevelOneController.swift
//  Physicalist
//
//  Created by Pedro Franco on 12/04/23.
//

import SpriteKit

enum ColliderTypeLevels: UInt32 {
    case Object1 = 1
    case Object2 = 2
}

class LevelOneController: SKScene, SKPhysicsContactDelegate {
    var rocket = SKSpriteNode()
    var finish = SKSpriteNode()
    var earth = SKSpriteNode()
    var invisibleWallUp: SKSpriteNode?
    var invisibleWallDown: SKSpriteNode?
    var invisibleWallRight: SKSpriteNode?
   
    var isTouchingScreen = false
    
    override func didMove(to view: SKView) {
        
        rocket = SKSpriteNode(imageNamed: "rocket")
        rocket.name = "Rocket"
        rocket.size = CGSize(width: 80, height: 180)
        rocket.position = CGPoint(x: -420, y: -200) //-2.146
        rocket.physicsBody = SKPhysicsBody(rectangleOf: rocket.size)
        rocket.physicsBody?.isDynamic = false
        rocket.physicsBody?.affectedByGravity = true
        rocket.zRotation = -70
        rocket.physicsBody?.mass = 0.1
        rocket.physicsBody?.categoryBitMask = ColliderTypeLevels.Object1.rawValue
        rocket.physicsBody?.contactTestBitMask = ColliderTypeLevels.Object2.rawValue
        rocket.physicsBody?.collisionBitMask = ColliderTypeLevels.Object1.rawValue
 
        addChild(rocket)
        
        finish = SKSpriteNode(imageNamed: "finish")
        finish.name = "Finish"
        finish.size = CGSize(width: 110, height: 110)
        finish.position = CGPoint(x: 420, y:  200)
        finish.physicsBody = SKPhysicsBody(rectangleOf: finish.size)
        finish.physicsBody?.isDynamic = false
        finish.physicsBody?.categoryBitMask = ColliderTypeLevels.Object2.rawValue
        finish.physicsBody?.contactTestBitMask = ColliderTypeLevels.Object1.rawValue
        finish.physicsBody?.collisionBitMask = ColliderTypeLevels.Object2.rawValue
        
        addChild(finish)
        
        earth = SKSpriteNode(imageNamed: "earth")
        earth.name = "Earth"
        earth.size = CGSize(width: 160, height: 160)
        earth.position = CGPoint(x: 0, y:  0)
        earth.physicsBody = SKPhysicsBody(rectangleOf: earth.size)
        earth.physicsBody?.isDynamic = false
        earth.physicsBody?.categoryBitMask = ColliderTypeLevels.Object2.rawValue
        earth.physicsBody?.contactTestBitMask = ColliderTypeLevels.Object1.rawValue
        earth.physicsBody?.collisionBitMask = ColliderTypeLevels.Object2.rawValue
     
        addChild(earth)
        
        invisibleWallUp = childNode(withName: "invisibleWallUp") as? SKSpriteNode
        invisibleWallUp?.name = "Wall1"
        invisibleWallUp?.physicsBody?.categoryBitMask = ColliderTypeLevels.Object2.rawValue
        invisibleWallUp?.physicsBody?.contactTestBitMask = ColliderTypeLevels.Object1.rawValue
        invisibleWallUp?.physicsBody?.collisionBitMask = ColliderTypeLevels.Object2.rawValue
        
        invisibleWallDown = childNode(withName: "invisibleWallDown") as? SKSpriteNode
        invisibleWallDown?.name = "Wall2"
        invisibleWallDown?.physicsBody?.categoryBitMask = ColliderTypeLevels.Object2.rawValue
        invisibleWallDown?.physicsBody?.contactTestBitMask = ColliderTypeLevels.Object1.rawValue
        invisibleWallDown?.physicsBody?.collisionBitMask = ColliderTypeLevels.Object2.rawValue
        
        invisibleWallRight = childNode(withName: "invisibleWallRight") as? SKSpriteNode
        invisibleWallRight?.name = "Wall3"
        invisibleWallRight?.physicsBody?.categoryBitMask = ColliderTypeLevels.Object2.rawValue
        invisibleWallRight?.physicsBody?.contactTestBitMask = ColliderTypeLevels.Object1.rawValue
        invisibleWallRight?.physicsBody?.collisionBitMask = ColliderTypeLevels.Object2.rawValue
        
        self.physicsWorld.contactDelegate = self
    }
    
    func didBegin(_ contact: SKPhysicsContact) {

        var firstBody = SKPhysicsBody()
        var secondBody = SKPhysicsBody()
        
        if contact.bodyA.node?.name == "Rocket" {
            firstBody = contact.bodyA
            secondBody = contact.bodyB
        } else {
            firstBody = contact.bodyB
            secondBody = contact.bodyA
        }
        
        switch (firstBody.node?.name == "Rocket") {
            case secondBody.node?.name == "Finish":
                levelTwoBlocked = false
                rocket.physicsBody?.isDynamic = false
                let transition: SKTransition = SKTransition.fade(withDuration: 1)
                let storieScene = SKScene(fileNamed: "YouWon")
                self.view?.presentScene(storieScene!, transition: transition)
            
            case secondBody.node?.name == "Earth":
                rocket.physicsBody?.isDynamic = false
                let transition: SKTransition = SKTransition.fade(withDuration: 1)
                let storieScene = SKScene(fileNamed: "GameOver")
                self.view?.presentScene(storieScene!, transition: transition)
            
            case secondBody.node?.name == "Wall1":
                rocket.physicsBody?.isDynamic = false
                let transition: SKTransition = SKTransition.fade(withDuration: 1)
                let storieScene = SKScene(fileNamed: "GameOver")
                self.view?.presentScene(storieScene!, transition: transition)
            
            case secondBody.node?.name == "Wall2":
                rocket.physicsBody?.isDynamic = false
                let transition: SKTransition = SKTransition.fade(withDuration: 1)
                let storieScene = SKScene(fileNamed: "GameOver")
                self.view?.presentScene(storieScene!, transition: transition)
            
            case secondBody.node?.name == "Wall3":
                rocket.physicsBody?.isDynamic = false
                let transition: SKTransition = SKTransition.fade(withDuration: 1)
                let storieScene = SKScene(fileNamed: "GameOver")
                self.view?.presentScene(storieScene!, transition: transition)
            
            default:
                print("Error")
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for _ in touches {
            isTouchingScreen = true
            rocket.physicsBody?.isDynamic = true
            rocket.physicsBody?.applyImpulse(CGVector(dx: 0.6, dy: 2.1))
            // rocket.run(.applyForce(.init(dx: 3, dy: 50), duration: 1.1))
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        isTouchingScreen = false
    }
    
    override func update(_ currentTime: TimeInterval) {
        if isTouchingScreen {
            rocket.physicsBody?.applyImpulse(CGVector(dx: 0.6, dy: 2.1))
        }
    }
}
