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
            
        }
    }
    
    func addTitle(){
        let message = "Time Attack Racing"
        let label = SKLabelNode(fontNamed: "Chalkduster")
        label.text = message
        label.fontSize = 32
        label.fontColor = SKColor.blackColor()
        label.horizontalAlignmentMode = .Center
        //        label.verticalAlignmentMode = .Top
        label.position = CGPoint(x: CGRectGetMidX(frame), y: CGRectGetMidY(frame) + 200)
        label.zPosition = 100
        addChild(label)
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
        let shopScene = ShopScene(size: size)
        view?.presentScene(shopScene)
    }
    
    
}
