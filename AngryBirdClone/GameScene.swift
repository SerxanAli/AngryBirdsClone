//
//  GameScene.swift
//  AngryBirdClone
//
//  Created by serhan on 6/30/21.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    //var bird2 = SKSpriteNode()
    
    var bird = SKSpriteNode()
    
    var box1 = SKSpriteNode()
    var box2 = SKSpriteNode()
    var box3 = SKSpriteNode()
    var box4 = SKSpriteNode()
    var box5 = SKSpriteNode()
    
    var ganeStarted = false
    
    var originalPosition: CGPoint?
    
    
    override func didMove(to view: SKView) {
        
        /*
         let texture = SKTexture(imageNamed: "bird")
         bird2 = SKSpriteNode(texture: texture)
         bird2.position = CGPoint(x: 0, y: 0)
         bird2.size = CGSize(width: 100, height: 100)
         bird2.zPosition = 1
         self.addChild(bird2)
         */
        
        // PhysicsBody
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        self.scene?.scaleMode = .aspectFill
        
        // Bird
        
        bird = childNode(withName: "bird") as! SKSpriteNode
        
        let birdTexture = SKTexture(imageNamed: "bird")
        
        bird.physicsBody = SKPhysicsBody(circleOfRadius: birdTexture.size().height / 13)
        bird.physicsBody?.affectedByGravity = false
        bird.physicsBody?.isDynamic = true
        bird.physicsBody?.mass = 0.15
        originalPosition = bird.position
        
        
        //Box
        
        let boxTexture = SKTexture(imageNamed: "brick")
        let size = CGSize(width: boxTexture.size().width / 5, height: boxTexture.size().height / 5)
        
        box1 = childNode(withName: "box1") as! SKSpriteNode
        box1.physicsBody = SKPhysicsBody(rectangleOf: size)
        box1.physicsBody?.isDynamic = true
        box1.physicsBody?.affectedByGravity = true
        box1.physicsBody?.allowsRotation = true
        box1.physicsBody?.mass = 0.4
        
        box2 = childNode(withName: "box2") as! SKSpriteNode
        box2.physicsBody = SKPhysicsBody(rectangleOf: size)
        box2.physicsBody?.isDynamic = true
        box2.physicsBody?.affectedByGravity = true
        box2.physicsBody?.allowsRotation = true
        box2.physicsBody?.mass = 0.4
        
        box3 = childNode(withName: "box3") as! SKSpriteNode
        box3.physicsBody = SKPhysicsBody(rectangleOf: size)
        box3.physicsBody?.isDynamic = true
        box3.physicsBody?.affectedByGravity = true
        box3.physicsBody?.allowsRotation = true
        box3.physicsBody?.mass = 0.4
        
        box4 = childNode(withName: "box4") as! SKSpriteNode
        box4.physicsBody = SKPhysicsBody(rectangleOf: size)
        box4.physicsBody?.isDynamic = true
        box4.physicsBody?.affectedByGravity = true
        box4.physicsBody?.allowsRotation = true
        box4.physicsBody?.mass = 0.4
        
        box5 = childNode(withName: "box5") as! SKSpriteNode
        box5.physicsBody = SKPhysicsBody(rectangleOf: size)
        box5.physicsBody?.isDynamic = true
        box5.physicsBody?.affectedByGravity = true
        box5.physicsBody?.allowsRotation = true
        box5.physicsBody?.mass = 0.4
    }
    
    
    func touchDown(atPoint pos : CGPoint) {
        
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        
    }
    
    func touchUp(atPoint pos : CGPoint) {
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        /*
         bird.physicsBody?.applyImpulse(CGVector(dx: 50, dy: 100))
         bird.physicsBody?.affectedByGravity = true
         */
        
        if ganeStarted == false {
            
            if let touch = touches.first {
                
                let touchLocation = touch.location(in: self)
                let touchNodes = nodes(at: touchLocation)
                
                if touchNodes.isEmpty == false {
                    for node in touchNodes {
                        if let sprite =  node as? SKSpriteNode {
                            if sprite == bird {
                                bird.position = touchLocation
                            }
                        }
                    }
                }
                
            }
            
        }
        
        
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if ganeStarted == false {
            
            if let touch = touches.first {
                
                let touchLocation = touch.location(in: self)
                let touchNodes = nodes(at: touchLocation)
                
                if touchNodes.isEmpty == false {
                    for node in touchNodes {
                        if let sprite =  node as? SKSpriteNode {
                            if sprite == bird {
                                bird.position = touchLocation
                            }
                        }
                    }
                }
                
            }
            
        }
        
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        
        if ganeStarted == false {
            
            if let touch = touches.first {
                
                let touchLocation = touch.location(in: self)
                let touchNodes = nodes(at: touchLocation)
                
                if touchNodes.isEmpty == false {
                    for node in touchNodes {
                        if let sprite =  node as? SKSpriteNode {
                            if sprite == bird {
                                
                                let dx =  -(touchLocation.x - originalPosition!.x)
                                let dy =  -(touchLocation.y - originalPosition!.y)
                                
                                let impulse = CGVector(dx: dx, dy: dy)
                                
                                bird.physicsBody?.applyImpulse(impulse)
                                bird.physicsBody?.affectedByGravity = true
                                
                                ganeStarted = true
                                
                            }
                        }
                    }
                }
            }
        }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        
        
        
        
        
    }
}


//     TO BE CONTINUED ***

