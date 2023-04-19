//
//  LevelTwoController.swift
//  Physicalist
//
//  Created by Pedro Franco on 14/04/23.
//

import SpriteKit

class LevelTwoController: SKScene, SKPhysicsContactDelegate {
    var rocket2 = SKSpriteNode()
    var finish = SKSpriteNode()
    
    var mars = SKSpriteNode()
    var venus = SKSpriteNode()
    var mercury = SKSpriteNode()
    
    var invisibleWallUp: SKSpriteNode?
    var invisibleWallDown: SKSpriteNode?
    var invisibleWallRight: SKSpriteNode?
    
    var marsContact: SKSpriteNode?
    var venusContact: SKSpriteNode?
    var mercuryContact: SKSpriteNode?
    
    var isTouchingScreen = false
    
    override func didMove(to view: SKView) {
        rocket2 = SKSpriteNode(imageNamed: "rocket")
        rocket2.name = "Rocket2"
        rocket2.size = CGSize(width: 80, height: 180)
        rocket2.position = CGPoint(x: -420, y: -200) //-2.146
        rocket2.physicsBody = SKPhysicsBody(rectangleOf: rocket2.size)
        rocket2.physicsBody?.isDynamic = false
        rocket2.physicsBody?.affectedByGravity = true
        rocket2.zRotation = -70
        rocket2.physicsBody?.mass = 0.1
        rocket2.physicsBody?.categoryBitMask = ColliderTypeLevels.Object1.rawValue
        rocket2.physicsBody?.contactTestBitMask = ColliderTypeLevels.Object2.rawValue
        rocket2.physicsBody?.collisionBitMask = ColliderTypeLevels.Object1.rawValue
        addChild(rocket2)
        
        finish = SKSpriteNode(imageNamed: "finish")
        finish.name = "Finish2"
        finish.size = CGSize(width: 110, height: 110)
        finish.position = CGPoint(x: 420, y:  -200)
        finish.physicsBody = SKPhysicsBody(rectangleOf: finish.size)
        finish.physicsBody?.isDynamic = false
        finish.physicsBody?.categoryBitMask = ColliderTypeLevels.Object2.rawValue
        finish.physicsBody?.contactTestBitMask = ColliderTypeLevels.Object1.rawValue
        finish.physicsBody?.collisionBitMask = ColliderTypeLevels.Object2.rawValue
        addChild(finish)
        
        mars = SKSpriteNode(imageNamed: "mars")
        mars.name = "Mars"
        mars.size = CGSize(width: 310, height: 300)
        mars.position = CGPoint(x: 320, y: 200)
        addChild(mars)
        
        venus = SKSpriteNode(imageNamed: "venus")
        venus.name = "Venus"
        venus.size = CGSize(width: 310, height: 280)
        venus.position = CGPoint(x: 0, y: -320)
        venus.physicsBody?.affectedByGravity = false
        addChild(venus)
        
        mercury = SKSpriteNode(imageNamed: "mercury")
        mercury.name = "Mercury"
        mercury.size = CGSize(width: 320, height: 300)
        mercury.position = CGPoint(x: -370, y: 200)
        mercury.physicsBody?.affectedByGravity = false
        addChild(mercury)
        
        venusContact = childNode(withName: "venusContact") as? SKSpriteNode
        venusContact?.name = "VenusContact"
        venusContact?.physicsBody = SKPhysicsBody(rectangleOf: venusContact!.size)
        venusContact?.physicsBody?.affectedByGravity = false
        venusContact?.physicsBody?.isDynamic = false
        venusContact?.physicsBody?.categoryBitMask = ColliderTypeLevels.Object2.rawValue
        venusContact?.physicsBody?.contactTestBitMask = ColliderTypeLevels.Object1.rawValue
        venusContact?.physicsBody?.collisionBitMask = ColliderTypeLevels.Object2.rawValue
        
        mercuryContact = childNode(withName: "mercuryContact") as? SKSpriteNode
        mercuryContact?.name = "MercuryContact"
        mercuryContact?.physicsBody = SKPhysicsBody(rectangleOf: mercuryContact!.size)
        mercuryContact?.physicsBody?.affectedByGravity = false
        mercuryContact?.physicsBody?.isDynamic = false
        mercuryContact?.physicsBody?.categoryBitMask = ColliderTypeLevels.Object2.rawValue
        mercuryContact?.physicsBody?.contactTestBitMask = ColliderTypeLevels.Object1.rawValue
        mercuryContact?.physicsBody?.collisionBitMask = ColliderTypeLevels.Object2.rawValue
        
        marsContact = childNode(withName: "marsContact") as? SKSpriteNode
        marsContact?.name = "MarsContact"
        marsContact?.physicsBody = SKPhysicsBody(rectangleOf: marsContact!.size)
        marsContact?.physicsBody?.affectedByGravity = false
        marsContact?.physicsBody?.isDynamic = false
        marsContact?.physicsBody?.categoryBitMask = ColliderTypeLevels.Object2.rawValue
        marsContact?.physicsBody?.contactTestBitMask = ColliderTypeLevels.Object1.rawValue
        marsContact?.physicsBody?.collisionBitMask = ColliderTypeLevels.Object2.rawValue
        
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
        
        if contact.bodyA.node?.name == "Rocket2" {
            firstBody = contact.bodyA
            secondBody = contact.bodyB
        } else {
            firstBody = contact.bodyB
            secondBody = contact.bodyA
        }
        
        switch (firstBody.node?.name == "Rocket2") {
            case secondBody.node?.name ==  "Finish2":
                levelThreeBlocked = false
                rocket2.physicsBody?.isDynamic = false
                rocket2.physicsBody?.affectedByGravity = false
                let transition: SKTransition = SKTransition.fade(withDuration: 1)
                let storieScene = SKScene(fileNamed: "YouWon2")
                self.view?.presentScene(storieScene!, transition: transition)
            
            case secondBody.node?.name == "MercuryContact":
                rocket2.physicsBody?.isDynamic = false
                rocket2.physicsBody?.affectedByGravity = false
                let transition: SKTransition = SKTransition.fade(withDuration: 1)
                let storieScene = SKScene(fileNamed: "GameOver2")
                self.view?.presentScene(storieScene!, transition: transition)
            
            case secondBody.node?.name == "VenusContact":
                rocket2.physicsBody?.isDynamic = false
                rocket2.physicsBody?.affectedByGravity = false
                let transition: SKTransition = SKTransition.fade(withDuration: 1)
                let storieScene = SKScene(fileNamed: "GameOver2")
                self.view?.presentScene(storieScene!, transition: transition)
            
            case secondBody.node?.name == "MarsContact":
                rocket2.physicsBody?.isDynamic = false
                rocket2.physicsBody?.affectedByGravity = false
                let transition: SKTransition = SKTransition.fade(withDuration: 1)
                let storieScene = SKScene(fileNamed: "GameOver2")
                self.view?.presentScene(storieScene!, transition: transition)
            
            case secondBody.node?.name == "Wall1":
                rocket2.physicsBody?.isDynamic = false
                let transition: SKTransition = SKTransition.fade(withDuration: 1)
                let storieScene = SKScene(fileNamed: "GameOver2")
                self.view?.presentScene(storieScene!, transition: transition)
            
            case secondBody.node?.name == "Wall2":
                rocket2.physicsBody?.isDynamic = false
                let transition: SKTransition = SKTransition.fade(withDuration: 1)
                let storieScene = SKScene(fileNamed: "GameOver2")
                self.view?.presentScene(storieScene!, transition: transition)
            
            case secondBody.node?.name == "Wall3":
                rocket2.physicsBody?.isDynamic = false
                let transition: SKTransition = SKTransition.fade(withDuration: 1)
                let storieScene = SKScene(fileNamed: "GameOver2")
                self.view?.presentScene(storieScene!, transition: transition)
            
            default:
                print("Error Level 2")
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for _ in touches {
            isTouchingScreen = true
            rocket2.physicsBody?.isDynamic = true
            rocket2.physicsBody?.applyImpulse(CGVector(dx: 0.6, dy: 2.1))
            // rocket.run(.applyForce(.init(dx: 3, dy: 50), duration: 1.1))
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        isTouchingScreen = false
    }
    
    override func update(_ currentTime: TimeInterval) {
        if isTouchingScreen {
            rocket2.physicsBody?.applyImpulse(CGVector(dx: 0.6, dy: 2.1))
        }
    }
}
