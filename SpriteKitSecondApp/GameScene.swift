//
//  GameScene.swift
//  SpriteKitSecondApp
//
//  Created by Fillipe Ramos on 9/13/16.
//  Copyright (c) 2016 Fillipe Ramos. All rights reserved.
//

import SpriteKit

func + (left: CGPoint, right: CGPoint) -> CGPoint {
    return CGPoint(x: left.x + right.x, y: left.y + right.y)
}

func - (left: CGPoint, right: CGPoint) -> CGPoint {
    return CGPoint(x: left.x - right.x, y: left.y - right.y)
}

func * (point: CGPoint, scalar: CGFloat) -> CGPoint {
    return CGPoint(x: point.x * scalar, y: point.y * scalar)
}

func / (point: CGPoint, scalar: CGFloat) -> CGPoint {
    return CGPoint(x: point.x / scalar, y: point.y / scalar)
}

#if !(arch(x86_64) || arch(arm64))
    func sqrt(a: CGFloat) -> CGFloat {
        return CGFloat(sqrtf(Float(a)))
    }
#endif

extension CGPoint {
    func length() -> CGFloat {
        return sqrt(x*x + y*y)
    }
    
    func normalized() -> CGPoint {
        return self / length()
    }
}

struct PhysicsCategory {
    static let None      : UInt32 = 0
    static let All       : UInt32 = UInt32.max
    static let MainCar   : UInt32 = 0x1 << 1      // 1
    static let Vehicle   : UInt32 = 0x1 << 2      // 2
}

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    // 1
    let player = SKSpriteNode(imageNamed: "Car")
    
    // Chance of being regular cars is higher
    let arrayOfVehicles = ["ambulance", "police", "cars", "cars", "cars", "cars", "cars"]
    
    var vehicleLane = 0
    var playerCoins = 0
    var actualSpeed = CGFloat()
    var vehicle = SKSpriteNode()
    let background = SKSpriteNode(imageNamed: "background")
    let background2 = SKSpriteNode(imageNamed: "background")
    let roadSpeed = CGFloat(10)
    let vehicleSpeed = 3
    
    
    
    var mainCarDestroyed = 0
    
    override func didMoveToView(view: SKView) {
        // 1 Add background
        addBackground()
        
        
        // 2 Add player on screen
        addPlayer()
        
        
        // 3 Add world
        physicsWorld.gravity = CGVectorMake(0, 0)
        physicsWorld.contactDelegate = self
        runAction(SKAction.repeatActionForever(
            SKAction.sequence([
                SKAction.runBlock(addVehicle),
                SKAction.waitForDuration(1.0)
            ])
        ))
        
    }
    
    func random() -> CGFloat {
        return CGFloat(Float(arc4random()) / 0xFFFFFFFF)
    }
    
    func random(min min: CGFloat, max: CGFloat) -> CGFloat {
        return random() * (max - min) + min
    }
    
    func addBackground(){
        background.anchorPoint = CGPointZero
        background.position = CGPoint(x: 0,y: 0)
        background.size = CGSize(width: frame.size.width, height: frame.size.height)
        background.zPosition = 0
        addChild(background)
        
        background2.anchorPoint = CGPointZero
        background2.position = CGPoint(x: 0, y: background.size.height)
        background2.size = CGSize(width: frame.size.width, height: frame.size.height)
        background2.zPosition = 0
        addChild(background2)
    }
    
    func addPlayer(){
        player.position = CGPoint(x: size.width * 0.5, y: size.height * 0.1)
        player.setScale(0.50)
        player.zPosition = 1
        addChild(player)
        
        player.physicsBody = SKPhysicsBody(rectangleOfSize: player.size) // 1
        player.physicsBody?.dynamic = true // 2
        player.physicsBody?.categoryBitMask = PhysicsCategory.MainCar // 3
    }
    
    
    func addVehicleThreeLanes() {
        
        var imageAtlas = SKTextureAtlas()
        var imageArray = [SKTexture]()
        
        let randomVehicleIndex = Int(arc4random_uniform(UInt32(arrayOfVehicles.count)))
        imageAtlas = SKTextureAtlas(named: arrayOfVehicles[randomVehicleIndex])
        
        vehicle = SKSpriteNode( imageNamed: imageAtlas.textureNames[randomVehicleIndex])
        
        // Creates Ambulance and Police Animations
        if randomVehicleIndex == 0{
            for i in 1...imageAtlas.textureNames.count{
                let name = "Ambulance_\(i).png"
                imageArray.append(SKTexture(imageNamed: name))
            }
        }else if randomVehicleIndex == 1{
            for i in 1...imageAtlas.textureNames.count{
                let name = "Police_\(i).png"
                imageArray.append(SKTexture(imageNamed: name))
            }
        }
        
        // Determine where to spawn the vehicle along the X axis
        // This spawns vehicle in one of the 3 lanes
        let arrayForVehicle = [(size.width/4), ( size.width/2), (size.width*0.75)]
        let randomIndex = Int(arc4random_uniform(UInt32(arrayForVehicle.count)))
        
        let actualX = arrayForVehicle[randomIndex]
        
        // Position the vehicle slightly off-screen along the top edge,
        // and along a random position along the X axis as calculated above
        vehicle.position = CGPoint(x: actualX, y: size.height + vehicle.size.height/2)
        
        // Add the vehicle to the scene
        vehicle.setScale(0.50)
        vehicle.zPosition = 1
        addChild(vehicle)
        
        vehicle.physicsBody = SKPhysicsBody(rectangleOfSize: vehicle.size) // 1
        vehicle.physicsBody?.dynamic = true // 2
        vehicle.physicsBody?.categoryBitMask = PhysicsCategory.Vehicle // 3
        vehicle.physicsBody?.contactTestBitMask = PhysicsCategory.MainCar // 4
        vehicle.physicsBody?.collisionBitMask = PhysicsCategory.None // 5
        
        // Create the actions
        let actionMove = SKAction.moveTo(CGPoint(x: actualX,  y: -vehicle.size.height/2), duration: NSTimeInterval(vehicleSpeed))
        let actionMoveDone = SKAction.removeFromParent()
        
        
        if !imageArray.isEmpty {
            vehicle.runAction(SKAction.repeatActionForever(SKAction.animateWithTextures(imageArray, timePerFrame: 0.2)))
        }
        vehicle.runAction(SKAction.sequence([actionMove, actionMoveDone]))
        
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        guard let touch = touches.first else {
                        return
        }
        let touchLocation = touch.locationInNode(self)
        var actionMove = SKAction()
        
        if player.position.x == size.width*0.75{
            if touchLocation.x < size.width/2 {
                actionMove = SKAction.moveTo(CGPoint(x: (size.width/2), y: size.height * 0.1), duration: 0.2)
            }
        } else if player.position.x == size.width/2{
            if touchLocation.x > size.width/2 {
                actionMove = SKAction.moveTo(CGPoint(x: (size.width*0.75), y: size.height * 0.1), duration: 0.2)
            } else {
                actionMove = SKAction.moveTo(CGPoint(x: (size.width/4), y: size.height * 0.1), duration: 0.2)
            }
        } else {
            if touchLocation.x > size.width/2 {
                actionMove = SKAction.moveTo(CGPoint(x: (size.width/2), y: size.height * 0.1), duration: 0.2)
            }
        }
    
        player.runAction(SKAction.sequence([actionMove]))
        
    }
    
    
    func mainCarDidCollideWithVehicle(vehicle:SKSpriteNode, mainCar:SKSpriteNode) {
        vehicle.removeFromParent()
        mainCar.removeFromParent()
        mainCarDestroyed += 1
        if (mainCarDestroyed > 0) {
            addPlayer()
        }
        
    }
    
    func mainCarDidCollideWithCoin(coin:SKSpriteNode) {
        coin.removeFromParent()
        playerCoins = playerCoins + 1
    }
    
    func didBeginContact(contact: SKPhysicsContact) {
        
        // 1
        var firstBody: SKPhysicsBody
        var secondBody: SKPhysicsBody
        if contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask {
            firstBody = contact.bodyA
            secondBody = contact.bodyB
        } else {
            firstBody = contact.bodyB
            secondBody = contact.bodyA
        }
        
        // 2
        if ((firstBody.categoryBitMask & PhysicsCategory.MainCar != 0) &&
            (secondBody.categoryBitMask & PhysicsCategory.Vehicle != 0)) {
            mainCarDidCollideWithVehicle(firstBody.node as! SKSpriteNode, mainCar: secondBody.node as! SKSpriteNode)
        }
        
    }
    
    func backgroundScrollUpdate(){

        background.position = CGPointMake(background.position.x, background.position.y - roadSpeed)
        background2.position = CGPointMake(background2.position.x, background2.position.y - roadSpeed)
        
        if(background.position.y < -background.size.height){
            background.position = CGPointMake(background.position.x, background2.position.y + background2.size.height)
        }
        if(background2.position.y < -background2.size.height){
            background2.position = CGPointMake(background2.position.x, background.position.y + background.size.height)
        }
        
    }
    
    override func update(currentTime: CFTimeInterval) {
        backgroundScrollUpdate()
    }
}
