//
//  ShopScene.swift
//  SpriteKitSecondApp
//
//  Created by Fillipe Ramos on 11/2/16.
//  Copyright © 2016 Fillipe Ramos. All rights reserved.
//

import Foundation
import SpriteKit

class ShopScene: SKScene {
//    
    var engine = SKShapeNode()
    var tire = SKShapeNode()
    var turbo = SKShapeNode()
    var engineEquip = SKShapeNode()
    var tireEquip = SKShapeNode()
    var turboEquip = SKShapeNode()
    let engineEquipLabel = SKLabelNode(fontNamed:"Chalkduster")
    let tireEquipLabel = SKLabelNode(fontNamed:"Chalkduster")
    let turboEquipLabel = SKLabelNode(fontNamed:"Chalkduster")
    var engineLabel = SKLabelNode(fontNamed:"Chalkduster")
    var tireLabel = SKLabelNode(fontNamed:"Chalkduster")
    var turboLabel = SKLabelNode(fontNamed:"Chalkduster")
    var engineNextLevelLabel = SKLabelNode(fontNamed:"Chalkduster")
    var tireNextLevelLabel = SKLabelNode(fontNamed:"Chalkduster")
    var turboNextLevelLabel = SKLabelNode(fontNamed:"Chalkduster")
    var coinsLabel = SKLabelNode(fontNamed: "Chalkduster")
    var engineLevel = 1
    var tireLevel = 1
    var turboLevel = 1
    let engineLevelPrice = [20, 60, 150]
    let tireLevelPrice = [40, 90, 200]
    let turboLevelPrice = [60, 120, 300]
    
    var backButton = SKSpriteNode()
    
    override func didMoveToView(view: SKView) {
        backgroundColor = SKColor.lightGrayColor()
        
        backButton = SKSpriteNode(imageNamed: "backButton.png")
        backButton.position = CGPoint(x: 20, y: size.height - 30)
        addChild(backButton)
        
//        if let appDomain = NSBundle.mainBundle().bundleIdentifier {
//            NSUserDefaults.standardUserDefaults().removePersistentDomainForName(appDomain)
//        }
        
        loadCarParts()
        
        addEngine()
        addEngineEquip()
        addTire()
        addTireEquip()
        addTurbo()
        addTurboEquip()
        loadCoins()
    }
    
    func loadCarParts(){
        let userDefaults = NSUserDefaults.standardUserDefaults()
        if let engineLevelLoaded = userDefaults.valueForKey("engine") {
            engineLevel = engineLevelLoaded as! Int
        }else {
            engineLevel = 1
        }
        if let tireLevelLoaded = userDefaults.valueForKey("tire") {
            tireLevel = tireLevelLoaded as! Int
        }else{
            tireLevel = 1
        }
        if let turboLevelLoaded = userDefaults.valueForKey("turbo") {
            turboLevel = turboLevelLoaded as! Int
        }else{
            turboLevel = 1
        }
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch: AnyObject in touches {
            let location = touch.locationInNode(self)
            
            if backButton.containsPoint(location){
                backToMenu()
            }
            
            if engineEquip.containsPoint(location){
                changeEquipLabel(engineEquipLabel)
            } else if tireEquip.containsPoint(location){
                changeEquipLabel(tireEquipLabel)
            } else if turboEquip.containsPoint(location){
                changeEquipLabel(turboEquipLabel)
            }
            
            if engine.containsPoint(location){
                if engineLevel == 4 {
                    middleScreenMessage("Max Level Reached")
                }
                if engineLevel < 4 {
                    if hasEnoughMoney("engine", level: engineLevel) {
                        buyPart(engineLabel, level: engineLevel)
                    }
                }
                
            } else if tire.containsPoint(location){
                if tireLevel == 4 {
                    middleScreenMessage("Max Level Reached")
                }
                if tireLevel < 4 {
                    if hasEnoughMoney("tire", level: tireLevel){
                        buyPart(tireLabel, level: tireLevel)
                    }
                }
                
            } else if turbo.containsPoint(location){
                if turboLevel == 4 {
                    middleScreenMessage("Max Level Reached")
                }
                if turboLevel < 4{
                    if hasEnoughMoney("turbo", level: turboLevel){
                        buyPart(turboLabel, level: turboLevel)
                    }
                }
            }
            
        }
    }
    
    func changeEquipLabel(label: SKLabelNode){
        if label.text == "Equip"{
            label.text = "Unequip"
        } else {
            label.text = "Equip"
        }
    }
    
    func buyPart(label: SKLabelNode, level: Int){
        let userDefaults = NSUserDefaults.standardUserDefaults()
        let previousCoins = userDefaults.valueForKey("coins")
        var carPartPrice = 0
        
        if label.name == "engine"{
            engineLevel += 1
            label.text = "Engine \(engineLevel)"
            userDefaults.setValue(engineLevel, forKey: "engine")
            if level < 3 {
                engineNextLevelLabel.text = "Next: \(engineLevelPrice[level])"
            } else{
                engineNextLevelLabel.text = "MAX"
                middleScreenMessage("Max Level Reached.")
            }
            carPartPrice = engineLevelPrice[level-1]
        } else if label.name == "tire"{
            tireLevel += 1
            label.text = "Tires \(tireLevel)"
            userDefaults.setValue(tireLevel, forKey: "tire")
            if level < 3 {
                tireNextLevelLabel.text = "Next: \(tireLevelPrice[level])"
            } else {
                tireNextLevelLabel.text = "MAX"
                middleScreenMessage("Max Level Reached.")
            }
            carPartPrice = tireLevelPrice[level-1]
        } else{
            turboLevel += 1
            label.text = "Turbo \(turboLevel)"
            userDefaults.setValue(turboLevel, forKey: "turbo")
            if level < 3{
                turboNextLevelLabel.text = "Next: \(turboLevelPrice[level])"
            } else {
                turboNextLevelLabel.text = "MAX"
                middleScreenMessage("Max Level Reached.")
            }
            
            carPartPrice = turboLevelPrice[level-1]
        }
        
        let coinsNow = previousCoins as! Int - carPartPrice
        coinsLabel.text = "Coins: \(coinsNow)"
        userDefaults.setValue(coinsNow, forKey: "coins")
        userDefaults.synchronize() // don't forget this!!!!
    }
    
    func backToMenu(){
        let reveal = SKTransition.pushWithDirection(SKTransitionDirection.Right, duration: 0.5)
        let menuScene = MainMenuScene(size: size)
        view?.presentScene(menuScene, transition: reveal)
    }
    
    func hasEnoughMoney(part: String, level: Int) -> Bool{
        let userDefaults = NSUserDefaults.standardUserDefaults()
        if let coins = userDefaults.valueForKey("coins") {
            if part == "engine"{
                if coins as! Int >= engineLevelPrice[level-1]{
                    return true
                }
            } else if part == "tire"{
                if coins as! Int >= tireLevelPrice[level-1]{
                    return true
                }
            } else{
                if coins as! Int >= turboLevelPrice[level-1]{
                    return true
                }
            }
        }
        middleScreenMessage("Not enough money.")
        return false
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
    
    //MARK: Coins
    func loadCoins(){
        let userDefaults = NSUserDefaults.standardUserDefaults()
        coinsLabel.fontSize = 24
        coinsLabel.fontColor = SKColor.blackColor()
        coinsLabel.horizontalAlignmentMode = .Center
        coinsLabel.position = CGPoint(x: frame.midX, y: size.height * 0.8)
        coinsLabel.zPosition = 100
        
        if let coins = userDefaults.valueForKey("coins") {
            coinsLabel.text = "Coins: \(coins)"
        }
        else {
            coinsLabel.text = "Coins: 0"
        }
        addChild(coinsLabel)
    }
    
    //MARK: Engine
    func addEngine(){
        engine = SKShapeNode(rectOfSize: CGSize(width: 100,height: 100), cornerRadius: 10.0)
        engine.position = CGPoint(x: size.width * 0.3, y: size.height * 0.6)
        engine.strokeColor = SKColor.blackColor()
        engine.fillColor = SKColor.whiteColor()
        engine.zPosition = 1
        engineLabel.text = "Engine \(engineLevel)"
        engineLabel.name = "engine"
        engineLabel.fontSize = 16
        engineLabel.fontColor = SKColor.blackColor()
        engineLabel.zPosition = 2
        engineNextLevelLabel.text = "Next: \(engineLevelPrice[engineLevel-1])"
        engineNextLevelLabel.name = "engineNextLevel"
        engineNextLevelLabel.position = CGPointMake(0, -20)
        engineNextLevelLabel.fontSize = 12
        engineNextLevelLabel.fontColor = SKColor.blackColor()
        engineNextLevelLabel.zPosition = 2
        
        engine.addChild(engineNextLevelLabel)
        engine.addChild(engineLabel)
        addChild(engine)
        
    }
    
    func addEngineEquip(){
        engineEquip = SKShapeNode(rectOfSize: CGSize(width: 150,height: 100), cornerRadius: 10.0)
        engineEquip.position = CGPoint(x: size.width * 0.7, y: size.height * 0.6)
        engineEquip.strokeColor = SKColor.blackColor()
        engineEquip.fillColor = SKColor.whiteColor()
        engineEquip.zPosition = 1
        engineEquipLabel.text = "Equip"
        engineEquipLabel.fontSize = 18
        engineEquipLabel.fontColor = SKColor.blackColor()
        engineEquipLabel.zPosition = 2
        
        engineEquip.addChild(engineEquipLabel)
        addChild(engineEquip)
    }
    
    
    //MARK: Tires
    func addTire(){
        tire = SKShapeNode(rectOfSize: CGSize(width: 100,height: 100), cornerRadius: 10.0)
        tire.position = CGPoint(x: size.width * 0.3, y: size.height * 0.4)
        tire.strokeColor = SKColor.blackColor()
        tire.fillColor = SKColor.whiteColor()
        tire.zPosition = 1
        tireLabel.text = "Tires \(tireLevel)"
        tireLabel.name = "tire"
        tireLabel.fontSize = 16
        tireLabel.fontColor = SKColor.blackColor()
        tireLabel.zPosition = 2
        tireNextLevelLabel.text = "Next: \(tireLevelPrice[tireLevel-1])"
        tireNextLevelLabel.name = "tireNextLevel"
        tireNextLevelLabel.position = CGPointMake(0, -20)
        tireNextLevelLabel.fontSize = 12
        tireNextLevelLabel.fontColor = SKColor.blackColor()
        tireNextLevelLabel.zPosition = 2
        
        tire.addChild(tireNextLevelLabel)
        tire.addChild(tireLabel)
        addChild(tire)
    }
    
    func addTireEquip(){
        tireEquip = SKShapeNode(rectOfSize: CGSize(width: 150,height: 100), cornerRadius: 10.0)
        tireEquip.position = CGPoint(x: size.width * 0.7, y: size.height * 0.4)
        tireEquip.strokeColor = SKColor.blackColor()
        tireEquip.fillColor = SKColor.whiteColor()
        tireEquip.zPosition = 1
        tireEquipLabel.text = "Equip"
        tireEquipLabel.fontSize = 18
        tireEquipLabel.fontColor = SKColor.blackColor()
        tireEquipLabel.zPosition = 2
        
        tireEquip.addChild(tireEquipLabel)
        addChild(tireEquip)
    }
    
    //MARK: Turbo
    func addTurbo(){
        turbo = SKShapeNode(rectOfSize: CGSize(width: 100,height: 100), cornerRadius: 10.0)
        turbo.position = CGPoint(x: size.width * 0.3, y: size.height * 0.2)
        turbo.strokeColor = SKColor.blackColor()
        turbo.fillColor = SKColor.whiteColor()
        turbo.zPosition = 1
        turboLabel.text = "Turbo \(turboLevel)"
        turboLabel.name = "turbo"
        turboLabel.fontSize = 16
        turboLabel.fontColor = SKColor.blackColor()
        turboLabel.zPosition = 2
        turboNextLevelLabel.text = "Next: \(turboLevelPrice[turboLevel-1])"
        turboNextLevelLabel.name = "tireNextLevel"
        turboNextLevelLabel.position = CGPointMake(0, -20)
        turboNextLevelLabel.fontSize = 12
        turboNextLevelLabel.fontColor = SKColor.blackColor()
        turboNextLevelLabel.zPosition = 2
        
        turbo.addChild(turboNextLevelLabel)
        turbo.addChild(turboLabel)
        addChild(turbo)
    }
    
    func addTurboEquip(){
        turboEquip = SKShapeNode(rectOfSize: CGSize(width: 150,height: 100), cornerRadius: 10.0)
        turboEquip.position = CGPoint(x: size.width * 0.7, y: size.height * 0.2)
        turboEquip.strokeColor = SKColor.blackColor()
        turboEquip.fillColor = SKColor.whiteColor()
        turboEquip.zPosition = 1
        turboEquipLabel.text = "Equip"
        turboEquipLabel.fontSize = 18
        turboEquipLabel.fontColor = SKColor.blackColor()
        turboEquipLabel.zPosition = 2
        
        turboEquip.addChild(turboEquipLabel)
        addChild(turboEquip)
    }
}
