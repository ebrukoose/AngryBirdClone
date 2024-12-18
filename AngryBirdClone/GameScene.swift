//
//  GameScene.swift
//  AngryBirdClone
//
//  Created by EBRU KÖSE on 17.12.2024.
//



import SpriteKit
import GameplayKit

class GameScene: SKScene , SKPhysicsContactDelegate{
    
var bird = SKSpriteNode()
var brick1 = SKSpriteNode()
var brick2 = SKSpriteNode()
var brick3 = SKSpriteNode()
var brick4 = SKSpriteNode()
var brick5 = SKSpriteNode()
    
    var isgamestarted = false
    var originalPosition = CGPoint()
    var score = 0
    var scoreLabel = SKLabelNode()
    
    enum ColliderType: UInt32{
        case Bird = 1
        case Brick = 2
        
        
    }
    
    override func didMove(to view: SKView) {
        
        //physics
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: self.frame )
        self.scene?.scaleMode = .aspectFit
        self.physicsWorld.contactDelegate = self
        
        //kuş tanımları
        
        bird = childNode(withName: "bird") as! SKSpriteNode
        let birdTexture = SKTexture(imageNamed: "bird")
        bird.physicsBody = SKPhysicsBody(circleOfRadius: birdTexture.size().height / 10 )
        bird.physicsBody?.affectedByGravity = false
        bird.physicsBody?.isDynamic = true
        bird.physicsBody?.mass = 0.5
        originalPosition = bird.position
        bird.physicsBody?.contactTestBitMask = ColliderType.Bird.rawValue
        bird.physicsBody?.categoryBitMask = ColliderType.Bird.rawValue
        bird.physicsBody?.collisionBitMask = ColliderType.Brick.rawValue
        
        
        //tuğlaların tanımı
        //boyut
        let brickTexture = SKTexture(imageNamed: "brick")
        let size = CGSize(width: brickTexture.size().width / 5 , height: brickTexture.size().height / 5  )
        
        
        brick1  = childNode(withName: "box1") as! SKSpriteNode
        brick1.physicsBody = SKPhysicsBody( texture: brickTexture , size: size )
        brick1.physicsBody?.allowsRotation = true
        brick1.physicsBody?.isDynamic = true
        brick1.physicsBody?.affectedByGravity = true
        brick1.physicsBody?.mass = 0.6
        
        
        brick1.physicsBody?.collisionBitMask = ColliderType.Bird.rawValue
        
        
        
        brick2  = childNode(withName: "box2") as! SKSpriteNode
        brick2.physicsBody = SKPhysicsBody( texture: brickTexture , size: size )
        brick2.physicsBody?.allowsRotation = true
        brick2.physicsBody?.isDynamic = true
        brick2.physicsBody?.affectedByGravity = true
        brick2.physicsBody?.mass = 0.6
        
        brick2.physicsBody?.collisionBitMask = ColliderType.Bird.rawValue
        
        
        
        brick3  = childNode(withName: "box3") as! SKSpriteNode
        brick3.physicsBody = SKPhysicsBody( texture: brickTexture , size: size )
        brick3.physicsBody?.allowsRotation = true
        brick3.physicsBody?.isDynamic = true
        brick3.physicsBody?.affectedByGravity = true
        brick3.physicsBody?.mass = 0.6
        
        
        brick3.physicsBody?.collisionBitMask = ColliderType.Bird.rawValue
        
        
        
        brick4  = childNode(withName: "box4") as! SKSpriteNode
        brick4.physicsBody = SKPhysicsBody( texture: brickTexture , size: size )
        brick4.physicsBody?.allowsRotation = true
        brick4.physicsBody?.isDynamic = true
        brick4.physicsBody?.affectedByGravity = true
        brick4.physicsBody?.mass = 0.6
        
        brick4.physicsBody?.collisionBitMask = ColliderType.Bird.rawValue
        
        
        
        brick5  = childNode(withName: "box5") as! SKSpriteNode
        brick5.physicsBody = SKPhysicsBody( texture: brickTexture , size: size )
        brick5.physicsBody?.allowsRotation = true
        brick5.physicsBody?.isDynamic = true
        brick5.physicsBody?.affectedByGravity = true
        brick5.physicsBody?.mass = 0.6
        
        
        brick5.physicsBody?.collisionBitMask = ColliderType.Bird.rawValue
        
        
        
        scoreLabel.fontName = "HelveticalNeue - Light"
        scoreLabel.fontSize = 60
        scoreLabel.text = "0"
        scoreLabel.position = CGPoint(x: 0, y: self.frame.height / 4)
        self.addChild(scoreLabel)
        
        
    }
    
    
    func didBegin(_ contact: SKPhysicsContact) {
        if contact.bodyA.collisionBitMask == ColliderType.Bird.rawValue || contact.bodyB.collisionBitMask == ColliderType.Bird.rawValue{
            //print("temas")
            score += 1
            scoreLabel.text = String(score)
            
        }
    }
    
    func touchDown(atPoint pos : CGPoint) {
        
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        
    }
    
    func touchUp(atPoint pos : CGPoint) {
       
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if isgamestarted == false{
            
            if let touch = touches.first{
                let touchedLocation = touch.location(in: self)
                let touchedNodes = nodes(at: touchedLocation)
                
                if touchedNodes.isEmpty == false{
                    for node in touchedNodes {
                        if let sprite = node as? SKSpriteNode{
                            if sprite == bird{
                                bird.position = touchedLocation
                            }
                        }
                    }
                }
            }
        }
        /*
        bird.physicsBody?.applyImpulse(CGVector(dx: 100, dy: 100))
        bird.physicsBody?.affectedByGravity = true 
     */
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if isgamestarted == false{
            
            if let touch = touches.first{
                let touchedLocation = touch.location(in: self)
                let touchedNodes = nodes(at: touchedLocation)
                
                if touchedNodes.isEmpty == false{
                    for node in touchedNodes {
                        if let sprite = node as? SKSpriteNode{
                            if sprite == bird{
                                bird.position = touchedLocation
                            }
                        }
                    }
                }
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if isgamestarted == false{
            
            if let touch = touches.first{
                let touchedLocation = touch.location(in: self)
                let touchedNodes = nodes(at: touchedLocation)
                
                if touchedNodes.isEmpty == false{
                    for node in touchedNodes {
                        if let sprite = node as? SKSpriteNode{
                            if sprite == bird{
                                bird.position = touchedLocation
                                let  dx = -(bird.position.x - originalPosition.x)
                                let  dy = -(bird.position.y - originalPosition.y)
                                bird.physicsBody?.applyImpulse(CGVector(dx: dx, dy: dy))
                                bird.physicsBody?.affectedByGravity = true
                                
                                isgamestarted = true
                                
                                
                                
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
        if let physicsBody = bird.physicsBody {
            if physicsBody.velocity.dx <= 1 &&
               physicsBody.velocity.dy <= 1 &&
               physicsBody.angularVelocity <= 1 &&
               isgamestarted {
               
                bird.physicsBody?.affectedByGravity = false
                bird.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
                bird.physicsBody?.angularVelocity = 0
                bird.position = originalPosition
                 score = 0
                scoreLabel.text = score.description
                isgamestarted = false
                
            }
        }
    }

}

