//
//  NimacaoReturns.swift
//  Nimacao
//
//  Created by Pedro Franco on 05/04/23.

import SpriteKit

enum ColliderType: UInt32 {
    case Apple = 1
    case Object = 2
    case Head = 3
    case Floor = 4
}

class FirstScreenController : SKScene, SKPhysicsContactDelegate {

    var apple: SKSpriteNode?
    var head: SKSpriteNode?
    var floor: SKSpriteNode?
    var baloon: SKSpriteNode?
    var myButton = SKSpriteNode()
    var textAnimated: SKSpriteNode?
    
    var buttonInUse = false
    
    func randomSpawn() -> Int {
        let value = 288
        let signal = [-1]
        let randomSignal = signal.randomElement()!
        var finalValue = 0
        
        if randomSignal == -1 {
            finalValue = randomSignal * value
        } else if randomSignal == 1 {
            finalValue = randomSignal * (value + 10)
        }
        
        return finalValue
    }
    
    override func didMove(to view: SKView) {
        apple = childNode(withName: "apple") as? SKSpriteNode
        apple?.physicsBody?.isDynamic = true
        apple?.physicsBody?.categoryBitMask = ColliderType.Apple.rawValue
        apple?.physicsBody?.contactTestBitMask = ColliderType.Object.rawValue
        apple?.physicsBody?.collisionBitMask = ColliderType.Object.rawValue
        
        head = childNode(withName: "head") as? SKSpriteNode
        head?.physicsBody?.isDynamic = false
        head?.physicsBody?.categoryBitMask = ColliderType.Head.rawValue
        head?.physicsBody?.contactTestBitMask = ColliderType.Apple.rawValue
        head?.physicsBody?.collisionBitMask = ColliderType.Object.rawValue
        
        floor = childNode(withName: "floor") as? SKSpriteNode
        floor?.physicsBody?.isDynamic = false
        floor?.physicsBody?.contactTestBitMask = ColliderType.Apple.rawValue
        floor?.physicsBody?.collisionBitMask = ColliderType.Object.rawValue
        
        textAnimated = childNode(withName: "textAnimated") as? SKSpriteNode
        textAnimated?.isHidden = true
        
        baloon = childNode(withName: "baloon") as? SKSpriteNode
        baloon?.isHidden = true
        
        myButton = SKSpriteNode(imageNamed: "myButton")
        myButton.size = CGSize(width: 306, height: 108)
        myButton.position = CGPoint(x: 340, y: 0)
        myButton.zPosition = 0

        self.physicsWorld.contactDelegate = self
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        let finalValue = randomSpawn()
        let contactAName = contact.bodyA.node?.name
        let contactBName = contact.bodyB.node?.name
        
        if contactAName == "apple" || contactBName == "apple" {
            if contactAName == "head" || contactBName == "head" {
                self.apple?.run(.applyForce(.init(dx: CGFloat(finalValue), dy: 740), duration: 0.8))
                self.head?.texture = SKTexture(imageNamed: "stunned")
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    self.head?.texture = SKTexture(imageNamed: "angry")
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 3.8) {
                    self.head?.texture = SKTexture(imageNamed: "surprised")
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                        self.baloon?.isHidden = false
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                        self.head?.texture = SKTexture(imageNamed: "happy")
                        self.baloon?.isHidden = true
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                            self.addChild(self.myButton)
                            self.buttonInUse = true
                            self.textAnimated?.isHidden = false
                            self.textAnimated?.zPosition = 1
                        }
                    }
                }
            }
        }
        
        if contactAName == "apple" || contactBName == "apple" {
            if contactAName == "floor" || contactBName == "floor" {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.594) {
                    self.apple?.physicsBody?.isDynamic = false
                }
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            
            if myButton.frame.contains(location) {
                if buttonInUse {
                    let transition: SKTransition = SKTransition.fade(withDuration: 1)
                    let storieScene = SKScene(fileNamed: "SecondScreen")
                    self.view?.presentScene(storieScene!, transition: transition)
                }
            }
        }
    }
}
