//
//  MainMenu.swift
//  SpriteKitSecondApp
//
//  Created by Fillipe Ramos on 11/2/16.
//  Copyright © 2016 Fillipe Ramos. All rights reserved.
//

import Foundation
import SpriteKit

class MainMenuScene: SKScene {
    
    var playButton = SKSpriteNode()
    var shopButton = SKSpriteNode()
    var title = SKLabelNode(fontNamed: "Chalkduster")
    
    override func didMoveToView(view: SKView) {
        
        backgroundColor = SKColor.lightGrayColor()
        addTitle()
        
        playButton = SKSpriteNode(imageNamed: "play.png")
        playButton.position = CGPoint(x: CGRectGetMidX(frame), y: CGRectGetMidY(frame) + 50)
        playButton.setScale(0.5)
        
        shopButton = SKSpriteNode(imageNamed: "shop.png")
        shopButton.position = CGPoint(x: CGRectGetMidX(frame), y: CGRectGetMidY(frame) - 150)
        shopButton.setScale(0.5)
        
        
        
        
        addChild(playButton)
        addChild(shopButton)

        
        
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch: AnyObject in touches {
            let location = touch.locationInNode(self)
            
            if playButton.containsPoint(location){
                levelMenu()
            }
            
            if shopButton.containsPoint(location){
                openShop()
            }
            
            if title.containsPoint(location){
                if let appDomain = NSBundle.mainBundle().bundleIdentifier {
                    NSUserDefaults.standardUserDefaults().removePersistentDomainForName(appDomain)
                    middleScreenMessage("Variables reset")
                }
            }
            
        }
    }
    
    func addTitle(){
        let message = "Time Attack Racing"
//        let label = SKLabelNode(fontNamed: "Chalkduster")
        title.text = message
        title.fontSize = 32
        title.fontColor = SKColor.blackColor()
        title.horizontalAlignmentMode = .Center
        title.position = CGPoint(x: CGRectGetMidX(frame), y: CGRectGetMidY(frame) + 200)
        title.zPosition = 100
        addChild(title)
    }
    
    func loadCoins(){
        let userDefaults = NSUserDefaults.standardUserDefaults()
        let label = SKLabelNode(fontNamed: "Chalkduster")
        label.fontSize = 12
        label.fontColor = SKColor.blackColor()
        label.horizontalAlignmentMode = .Left
        label.position = CGPoint(x: 0, y: size.height - 20)
        label.zPosition = 100

        if let coins = userDefaults.valueForKey("coins") {
            label.text = "Coins: \(coins)"
        }
        else {
            label.text = "Coins: 0"
        }
        addChild(label)
    }
    
    func levelMenu(){
        let reveal = SKTransition.pushWithDirection(SKTransitionDirection.Left, duration: 0.5)
        let levelMenuScene = LevelMenuScene(size: size)
        view?.presentScene(levelMenuScene, transition: reveal)
    }
    
    func openShop(){
        let reveal = SKTransition.pushWithDirection(SKTransitionDirection.Left, duration: 0.5)
        let shopScene = ShopScene(size: size)
        view?.presentScene(shopScene, transition: reveal)
    }
    
    func middleScreenMessage(message: String){
        let label = SKLabelNode(fontNamed: "Chalkduster")
        label.text = message
        label.fontSize = 24
        label.fontColor = SKColor.blackColor()
        label.horizontalAlignmentMode = .Center
        label.position = CGPoint(x: frame.midX, y: frame.midY)
        label.zPosition = 100
        
        addChild(label)
        
        label.runAction(SKAction.sequence([
            SKAction.runBlock({
                let scale : CGFloat = 1.3
                let duration : NSTimeInterval = 1.0
                let scaleAction = SKAction.scaleTo(scale, duration: duration)
                let actionMove = SKAction.moveTo(CGPoint(x: self.frame.midX,  y: self.frame.midY+50), duration: NSTimeInterval(1))
                let fadeAction = SKAction.fadeAlphaTo(0, duration: 1.0)
                
                let moveDisappear = SKAction.group([scaleAction, actionMove, fadeAction])
                
                // move to that position, after we get there, remove label from scene
                label.runAction(moveDisappear, completion: {
                    label.removeFromParent()
                })
                
            })
            ]))
        
    }
    
    
}
