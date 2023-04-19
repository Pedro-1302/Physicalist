//
//  LevelThreeController.swift
//  Physicalist
//
//  Created by Pedro Franco on 16/04/23.
//

import SpriteKit


class LevelThreeController: SKScene, SKPhysicsContactDelegate {
    var rocket3 = SKSpriteNode()
    var finish = SKSpriteNode()
    
    var jupiter = SKSpriteNode()
    var uranus = SKSpriteNode()
    var saturn = SKSpriteNode()
    
    var invisibleWallUp: SKSpriteNode?
    var invisibleWallDown: SKSpriteNode?
    var invisibleWallRight: SKSpriteNode?
    var invisibleWallLeft: SKSpriteNode?
    
    var jupiterContact: SKSpriteNode?
    var uranusContact: SKSpriteNode?
    var saturnContact: SKSpriteNode?
    
    var changeSide: SKSpriteNode?
    
    var isTouchingScreen = false
    var throughTheWall = false

    override func didMove(to view: SKView) {
        rocket3 = SKSpriteNode(imageNamed: "rocket")
        rocket3.name = "Rocket3"
        rocket3.size = CGSize(width: 80, height: 180)
        rocket3.position = CGPoint(x: -420, y: -250) //-2.146
        rocket3.physicsBody = SKPhysicsBody(rectangleOf: rocket3.size)
        rocket3.zRotation = -70
        rocket3.physicsBody?.isDynamic = false
        rocket3.physicsBody?.affectedByGravity = true
        rocket3.physicsBody?.mass = 0.1
        rocket3.physicsBody?.categoryBitMask = ColliderTypeLevels.Object1.rawValue
        rocket3.physicsBody?.contactTestBitMask = ColliderTypeLevels.Object2.rawValue
        rocket3.physicsBody?.collisionBitMask = ColliderTypeLevels.Object1.rawValue
        addChild(rocket3)
        
        finish = SKSpriteNode(imageNamed: "finish")
        finish.name = "Finish3"
        finish.size = CGSize(width: 110, height: 110)
        finish.position = CGPoint(x: -420, y:  270)
        finish.physicsBody = SKPhysicsBody(rectangleOf: finish.size)
        finish.physicsBody?.isDynamic = false
        finish.physicsBody?.categoryBitMask = ColliderTypeLevels.Object2.rawValue
        finish.physicsBody?.contactTestBitMask = ColliderTypeLevels.Object1.rawValue
        finish.physicsBody?.collisionBitMask = ColliderTypeLevels.Object2.rawValue
        addChild(finish)
        
        saturn = SKSpriteNode(imageNamed: "saturn")
        saturn.name = "Saturn"
        saturn.size = CGSize(width: 260, height: 260)
        saturn.position = CGPoint(x: 440, y: -260)
        saturn.physicsBody = SKPhysicsBody(rectangleOf: saturn.size)
        saturn.physicsBody?.isDynamic = false
        saturn.physicsBody?.categoryBitMask = ColliderTypeLevels.Object2.rawValue
        addChild(saturn)
        
        uranus = SKSpriteNode(imageNamed: "uranus")
        uranus.name = "Uranus"
        uranus.size = CGSize(width: 180, height: 180)
        uranus.position = CGPoint(x: -300, y:  10)
        uranus.physicsBody = SKPhysicsBody(rectangleOf: uranus.size)
        uranus.physicsBody?.isDynamic = false
        uranus.physicsBody?.categoryBitMask = ColliderTypeLevels.Object2.rawValue
        addChild(uranus)
        
        jupiter = SKSpriteNode(imageNamed: "jupiter")
        jupiter.name = "Jupiter"
        jupiter.size = CGSize(width: 500, height: 500)
        jupiter.position = CGPoint(x: 520, y:  300)
        jupiter.physicsBody = SKPhysicsBody(rectangleOf: jupiter.size)
        jupiter.physicsBody?.isDynamic = false
        jupiter.physicsBody?.categoryBitMask = ColliderTypeLevels.Object2.rawValue
        addChild(jupiter)
        
        jupiterContact = childNode(withName: "jupiterContact") as? SKSpriteNode
        jupiterContact?.name = "JupiterContact"
        jupiterContact?.physicsBody = SKPhysicsBody(rectangleOf: jupiterContact!.size)
        jupiterContact?.physicsBody?.affectedByGravity = false
        jupiterContact?.physicsBody?.isDynamic = false
        jupiterContact?.physicsBody?.categoryBitMask = ColliderTypeLevels.Object2.rawValue
        jupiterContact?.physicsBody?.contactTestBitMask = ColliderTypeLevels.Object1.rawValue
        jupiterContact?.physicsBody?.collisionBitMask = ColliderTypeLevels.Object2.rawValue
        
        uranusContact = childNode(withName: "uranusContact") as? SKSpriteNode
        uranusContact?.name = "UranusContact"
        uranusContact?.physicsBody = SKPhysicsBody(rectangleOf: uranusContact!.size)
        uranusContact?.physicsBody?.affectedByGravity = false
        uranusContact?.physicsBody?.isDynamic = false
        uranusContact?.physicsBody?.categoryBitMask = ColliderTypeLevels.Object2.rawValue
        uranusContact?.physicsBody?.contactTestBitMask = ColliderTypeLevels.Object1.rawValue
        uranusContact?.physicsBody?.collisionBitMask = ColliderTypeLevels.Object2.rawValue
        
        saturnContact = childNode(withName: "saturnContact") as? SKSpriteNode
        saturnContact?.name = "SaturnContact"
        saturnContact?.physicsBody = SKPhysicsBody(rectangleOf: saturnContact!.size)
        saturnContact?.physicsBody?.affectedByGravity = false
        saturnContact?.physicsBody?.isDynamic = false
        saturnContact?.physicsBody?.categoryBitMask = ColliderTypeLevels.Object2.rawValue
        saturnContact?.physicsBody?.contactTestBitMask = ColliderTypeLevels.Object1.rawValue
        saturnContact?.physicsBody?.collisionBitMask = ColliderTypeLevels.Object2.rawValue
        
        changeSide = childNode(withName: "changeSide") as? SKSpriteNode
        changeSide?.name = "ChangeSide"
        changeSide?.physicsBody = SKPhysicsBody(rectangleOf: changeSide!.size)
        changeSide?.physicsBody?.affectedByGravity = false
        changeSide?.physicsBody?.isDynamic = false
        changeSide?.physicsBody?.categoryBitMask = ColliderTypeLevels.Object2.rawValue
        changeSide?.physicsBody?.contactTestBitMask = ColliderTypeLevels.Object1.rawValue
        changeSide?.physicsBody?.collisionBitMask = ColliderTypeLevels.Object2.rawValue
        
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
        
        invisibleWallLeft = childNode(withName: "invisibleWallLeft") as? SKSpriteNode
        invisibleWallLeft?.name = "Wall4"
        invisibleWallLeft?.physicsBody?.categoryBitMask = ColliderTypeLevels.Object2.rawValue
        invisibleWallLeft?.physicsBody?.contactTestBitMask = ColliderTypeLevels.Object1.rawValue
        invisibleWallLeft?.physicsBody?.collisionBitMask = ColliderTypeLevels.Object2.rawValue
        
        self.physicsWorld.contactDelegate = self
    }
    
    
    func didBegin(_ contact: SKPhysicsContact) {
        var firstBody = SKPhysicsBody()
        var secondBody = SKPhysicsBody()
        
        if contact.bodyA.node?.name == "Rocket3" {
            firstBody = contact.bodyA
            secondBody = contact.bodyB
        } else {
            firstBody = contact.bodyB
            secondBody = contact.bodyA
        }
        
        switch (firstBody.node?.name == "Rocket3") {
            
            case secondBody.node?.name == "ChangeSide":
                throughTheWall = true
                rocket3.run(.rotate(toAngle: 70, duration: 0.1))
                rocket3.physicsBody?.linearDamping = 0.25
            
            case secondBody.node?.name == "Finish3":
                levelThreeBlocked = false
                rocket3.physicsBody?.isDynamic = false
                rocket3.physicsBody?.affectedByGravity = false
                let transition: SKTransition = SKTransition.fade(withDuration: 1)
                let storieScene = SKScene(fileNamed: "EndGame")
                self.view?.presentScene(storieScene!, transition: transition)
            
            case secondBody.node?.name == "SaturnContact":
                rocket3.physicsBody?.isDynamic = false
                rocket3.physicsBody?.affectedByGravity = false
                let transition: SKTransition = SKTransition.fade(withDuration: 1)
                let storieScene = SKScene(fileNamed: "GameOver3")
                self.view?.presentScene(storieScene!, transition: transition)
            
            case secondBody.node?.name == "UranusContact":
                rocket3.physicsBody?.isDynamic = false
                rocket3.physicsBody?.affectedByGravity = false
                let transition: SKTransition = SKTransition.fade(withDuration: 1)
                let storieScene = SKScene(fileNamed: "GameOver3")
                self.view?.presentScene(storieScene!, transition: transition)
            
            case secondBody.node?.name == "JupiterContact":
                rocket3.physicsBody?.isDynamic = false
                rocket3.physicsBody?.affectedByGravity = false
                let transition: SKTransition = SKTransition.fade(withDuration: 1)
                let storieScene = SKScene(fileNamed: "GameOver3")
                self.view?.presentScene(storieScene!, transition: transition)
            
            case secondBody.node?.name == "Wall1":
                rocket3.physicsBody?.isDynamic = false
                let transition: SKTransition = SKTransition.fade(withDuration: 1)
                let storieScene = SKScene(fileNamed: "GameOver3")
                self.view?.presentScene(storieScene!, transition: transition)
            
            case secondBody.node?.name == "Wall2":
                rocket3.physicsBody?.isDynamic = false
                let transition: SKTransition = SKTransition.fade(withDuration: 1)
                let storieScene = SKScene(fileNamed: "GameOver3")
                self.view?.presentScene(storieScene!, transition: transition)
            
            case secondBody.node?.name == "Wall3":
                rocket3.physicsBody?.isDynamic = false
                let transition: SKTransition = SKTransition.fade(withDuration: 1)
                let storieScene = SKScene(fileNamed: "GameOver3")
                self.view?.presentScene(storieScene!, transition: transition)
            
            case secondBody.node?.name == "Wall4":
                rocket3.physicsBody?.isDynamic = false
                let transition: SKTransition = SKTransition.fade(withDuration: 1)
                let storieScene = SKScene(fileNamed: "GameOver3")
                self.view?.presentScene(storieScene!, transition: transition)
                
                // case secondBody.node?.name == ""
            
            default:
                print("Error Level 3")
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for _ in touches {
            if throughTheWall {
                isTouchingScreen = true
                rocket3.physicsBody?.isDynamic = true
                rocket3.physicsBody?.applyImpulse(CGVector(dx: -0.6, dy: 2.1))
            } else {
                isTouchingScreen = true
                rocket3.physicsBody?.isDynamic = true
                rocket3.physicsBody?.applyImpulse(CGVector(dx: 0.6, dy: 2.1))
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        isTouchingScreen = false
    }
    
    override func update(_ currentTime: TimeInterval) {
        if isTouchingScreen {
            if throughTheWall {
                isTouchingScreen = true
                rocket3.physicsBody?.isDynamic = true
                rocket3.physicsBody?.applyImpulse(CGVector(dx: -0.6, dy: 2.1))
            } else {
                isTouchingScreen = true
                rocket3.physicsBody?.isDynamic = true
                rocket3.physicsBody?.applyImpulse(CGVector(dx: 0.6, dy: 2.1))
            }
        }
    }
}

