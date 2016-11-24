//
//  LevelMenu.swift
//  SpriteKitSecondApp
//
//  Created by Fillipe Ramos on 11/10/16.
//  Copyright © 2016 Fillipe Ramos. All rights reserved.
//

import Foundation
import SpriteKit

class LevelMenuScene: SKScene {
    
    var levelOne = SKShapeNode()
    var levelTwo = SKShapeNode()
    var levelThree = SKShapeNode()
    var levelFour = SKShapeNode()
    var levelFive = SKShapeNode()
    var levelSix = SKShapeNode()
    var levelSeven = SKShapeNode()
    var levelEight = SKShapeNode()
    var levelNine = SKShapeNode()
    var levelTen = SKShapeNode()
    var backButton = SKSpriteNode()
    
    
    override func didMoveToView(view: SKView) {
        addLevelMenu()
        
    }
    
    func addLevelMenu(){
        backgroundColor = SKColor.lightGrayColor()
        
        
        let labelFontSize = CGFloat(24)
        
        // Level One
        levelOne = SKShapeNode(ellipseOfSize: CGSize(width: 70,height: 50))
        levelOne.name = "levelOne"
        levelOne.position = CGPoint(x: size.width*0.15, y: size.height*0.1)
        levelOne.strokeColor = SKColor.blackColor()
        levelOne.zPosition = 1
        let levelOneLabel = SKLabelNode(fontNamed:"Chalkduster")
        levelOneLabel.text = "1"
        levelOneLabel.fontSize = labelFontSize
        levelOneLabel.zPosition = 2
        addLevelLabelColor(levelOne, levelLabel: levelOneLabel)
        
        // Level Two
        levelTwo = SKShapeNode(ellipseOfSize: CGSize(width: 70,height: 50))
        levelTwo.name = "levelTwo"
        levelTwo.position = CGPoint(x: size.width*0.5, y: size.height*0.15)
        levelTwo.strokeColor = SKColor.blackColor()
        levelTwo.zPosition = 1
        let levelTwoLabel = SKLabelNode(fontNamed:"Chalkduster")
        levelTwoLabel.text = "2"
        levelTwoLabel.fontSize = labelFontSize
        levelTwoLabel.zPosition = 2
        addLevelLabelColor(levelTwo, levelLabel: levelTwoLabel)
        
        // Level Three
        levelThree = SKShapeNode(ellipseOfSize: CGSize(width: 70,height: 50))
        levelThree.name = "levelThree"
        levelThree.position = CGPoint(x: size.width*0.8, y: size.height*0.2)
        levelThree.strokeColor = SKColor.blackColor()
        levelThree.zPosition = 1
        let levelThreeLabel = SKLabelNode(fontNamed:"Chalkduster")
        levelThreeLabel.text = "3"
        levelThreeLabel.fontSize = labelFontSize
        levelThreeLabel.zPosition = 2
        addLevelLabelColor(levelThree, levelLabel: levelThreeLabel)
        
        // Level Four
        levelFour = SKShapeNode(ellipseOfSize: CGSize(width: 70,height: 50))
        levelFour.name = "levelFour"
        levelFour.position = CGPoint(x: size.width*0.7, y: size.height*0.33)
        levelFour.strokeColor = SKColor.blackColor()
        levelFour.zPosition = 1
        let levelFourLabel = SKLabelNode(fontNamed:"Chalkduster")
        levelFourLabel.text = "4"
        levelFourLabel.fontSize = labelFontSize
        levelFourLabel.zPosition = 2
        addLevelLabelColor(levelFour, levelLabel: levelFourLabel)
        
        // Level Five
        levelFive = SKShapeNode(ellipseOfSize: CGSize(width: 70,height: 50))
        levelFive.name = "levelFive"
        levelFive.position = CGPoint(x: size.width*0.46, y: size.height*0.45)
        levelFive.strokeColor = SKColor.blackColor()
        levelFive.zPosition = 1
        let levelFiveLabel = SKLabelNode(fontNamed:"Chalkduster")
        levelFiveLabel.text = "5"
        levelFiveLabel.fontSize = labelFontSize
        levelFiveLabel.zPosition = 2
        addLevelLabelColor(levelFive, levelLabel: levelFiveLabel)
        
        // Level Six
        levelSix = SKShapeNode(ellipseOfSize: CGSize(width: 70,height: 50))
        levelSix.name = "levelSix"
        levelSix.position = CGPoint(x: size.width*0.2, y: size.height*0.6)
        levelSix.strokeColor = SKColor.blackColor()
        levelSix.zPosition = 1
        let levelSixLabel = SKLabelNode(fontNamed:"Chalkduster")
        levelSixLabel.text = "6"
        levelSixLabel.fontSize = labelFontSize
        levelSixLabel.zPosition = 2
        addLevelLabelColor(levelSix, levelLabel: levelSixLabel)
        
        // Level Seven
        levelSeven = SKShapeNode(ellipseOfSize: CGSize(width: 70,height: 50))
        levelSeven.name = "levelSeven"
        levelSeven.position = CGPoint(x: size.width*0.2, y: size.height*0.8)
        levelSeven.strokeColor = SKColor.blackColor()
        levelSeven.zPosition = 1
        let levelSevenLabel = SKLabelNode(fontNamed:"Chalkduster")
        levelSevenLabel.text = "7"
        levelSevenLabel.fontSize = labelFontSize
        levelSevenLabel.zPosition = 2
        addLevelLabelColor(levelSeven, levelLabel: levelSevenLabel)
        
        // Level Eight
        levelEight = SKShapeNode(ellipseOfSize: CGSize(width: 70,height: 50))
        levelEight.name = "levelEight"
        levelEight.position = CGPoint(x: size.width*0.5, y: size.height*0.9)
        levelEight.strokeColor = SKColor.blackColor()
        levelEight.zPosition = 1
        let levelEightLabel = SKLabelNode(fontNamed:"Chalkduster")
        levelEightLabel.text = "8"
        levelEightLabel.fontSize = labelFontSize
        levelEightLabel.zPosition = 2
        addLevelLabelColor(levelEight, levelLabel: levelEightLabel)
        
        
        // Level Nine
        levelNine = SKShapeNode(ellipseOfSize: CGSize(width: 70,height: 50))
        levelNine.name = "levelNine"
        levelNine.position = CGPoint(x: size.width*0.8, y: size.height*0.8)
        levelNine.strokeColor = SKColor.blackColor()
        levelNine.zPosition = 1
        let levelNineLabel = SKLabelNode(fontNamed:"Chalkduster")
        levelNineLabel.text = "9"
        levelNineLabel.fontSize = labelFontSize
        levelNineLabel.zPosition = 2
        addLevelLabelColor(levelNine, levelLabel: levelNineLabel)
        
        // Level Ten
        levelTen = SKShapeNode(ellipseOfSize: CGSize(width: 70,height: 50))
        levelTen.name = "levelTen"
        levelTen.position = CGPoint(x: size.width*0.9, y: size.height*0.6)
        levelTen.strokeColor = SKColor.blackColor()
        levelTen.zPosition = 1
        let levelTenLabel = SKLabelNode(fontNamed:"Chalkduster")
        levelTenLabel.text = "10"
        levelTenLabel.fontSize = labelFontSize
        levelTenLabel.zPosition = 2
        addLevelLabelColor(levelTen, levelLabel: levelTenLabel)
        
        // Back Button
        backButton = SKSpriteNode(imageNamed: "backButton.png")
        backButton.position = CGPoint(x: 20, y: size.height - 30)
//        backButton.setScale(0.5)
        addChild(backButton)
        
        
        levelOne.addChild(levelOneLabel)
        addChild(levelOne)
        levelTwo.addChild(levelTwoLabel)
        addChild(levelTwo)
        levelThree.addChild(levelThreeLabel)
        addChild(levelThree)

        levelFour.addChild(levelFourLabel)
        addChild(levelFour)

        levelFive.addChild(levelFiveLabel)
        addChild(levelFive)

        levelSix.addChild(levelSixLabel)
        addChild(levelSix)

        levelSeven.addChild(levelSevenLabel)
        addChild(levelSeven)

        levelEight.addChild(levelEightLabel)
        addChild(levelEight)

        levelNine.addChild(levelNineLabel)
        addChild(levelNine)

        levelTen.addChild(levelTenLabel)
        addChild(levelTen)
        
        drawDots()
        
    }
    
    func addLevelLabelColor(level: SKShapeNode, levelLabel: SKLabelNode){
        let userDefaults = NSUserDefaults.standardUserDefaults()
        let labelFontColorIncompleted = UIColor.blackColor()
        let labelFontColorCompleted = UIColor.whiteColor()
        let levelCompleted = SKColor.blackColor()
        let levelIncompleted = SKColor.whiteColor()
        if userDefaults.valueForKey(level.name!) != nil{
            level.fillColor = levelCompleted
            levelLabel.fontColor = labelFontColorCompleted
        } else{
            level.fillColor = levelIncompleted
            levelLabel.fontColor = labelFontColorIncompleted
        }
    }
    
    func backToMenu(){
        let reveal = SKTransition.pushWithDirection(SKTransitionDirection.Right, duration: 0.5)
        let menuScene = MainMenuScene(size: size)
        view?.presentScene(menuScene, transition: reveal)
    }
    
    func drawDots(){
        let bezierPath = UIBezierPath()
        let levelOnePath = CGPointMake(levelOne.position.x, levelOne.position.y)
        let levelTwoPath = CGPointMake(levelTwo.position.x,levelTwo.position.y)
        let levelThreePath = CGPointMake(levelThree.position.x,levelThree.position.y)
        let levelFourPath = CGPointMake(levelFour.position.x,levelFour.position.y)
        let levelFivePath = CGPointMake(levelFive.position.x,levelFive.position.y)
        let levelSixPath = CGPointMake(levelSix.position.x,levelSix.position.y)
        let levelSevenPath = CGPointMake(levelSeven.position.x,levelSeven.position.y)
        let levelEightPath = CGPointMake(levelEight.position.x,levelEight.position.y)
        let levelNinePath = CGPointMake(levelNine.position.x,levelNine.position.y)
        let levelTenPath = CGPointMake(levelTen.position.x,levelTen.position.y)
        bezierPath.moveToPoint(levelOnePath)
        bezierPath.addLineToPoint(levelTwoPath)
        bezierPath.addLineToPoint(levelThreePath)
        bezierPath.addLineToPoint(levelFourPath)
        bezierPath.addLineToPoint(levelFivePath)
        bezierPath.addLineToPoint(levelSixPath)
        bezierPath.addLineToPoint(levelSevenPath)
        bezierPath.addLineToPoint(levelEightPath)
        bezierPath.addLineToPoint(levelNinePath)
        bezierPath.addLineToPoint(levelTenPath)
        
        let pattern : [CGFloat] = [10.0, 10.0]
        let dashed = CGPathCreateCopyByDashingPath(bezierPath.CGPath, nil, 0, pattern, 1)
        
        let shapeNode = SKShapeNode(path: dashed!)
        shapeNode.position = CGPointMake(0,0)
        shapeNode.strokeColor = SKColor.blackColor()
        addChild(shapeNode)
    }
    
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch: AnyObject in touches {
            let location = touch.locationInNode(self)
            
            if backButton.containsPoint(location){
                backToMenu()
            }
            
            if levelOne.containsPoint(location){
                beginGame(2, levelReward_param: 10, time_param: 1200,roadSpeed_param: 6, vehicleSpeed_param: 3, background_param: "background_2", currentLevel_param: "levelOne", finishTime_param: 800)
            } else if levelTwo.containsPoint(location){
                beginGame(3, levelReward_param: 15, time_param: 1300,roadSpeed_param: 6, vehicleSpeed_param: 2.8, background_param: "background_3", currentLevel_param: "levelTwo", finishTime_param: 1000)
            } else if levelThree.containsPoint(location){
                beginGame(4, levelReward_param: 30, time_param: 1600,roadSpeed_param: 7, vehicleSpeed_param: 2.6, background_param: "background_4", currentLevel_param: "levelThree", finishTime_param: 1200)
            } else if levelFour.containsPoint(location){
                beginGame(2, levelReward_param: 50, time_param: 1800,roadSpeed_param: 8, vehicleSpeed_param: 2.4, background_param: "background_2", currentLevel_param: "levelFour", finishTime_param: 1500)
            } else if levelFive.containsPoint(location){
                beginGame(4, levelReward_param: 75, time_param: 2000,roadSpeed_param: 9, vehicleSpeed_param: 2.2, background_param: "background_4", currentLevel_param: "levelFive", finishTime_param: 1700)
            } else if levelSix.containsPoint(location){
                beginGame(3, levelReward_param: 120, time_param: 2300,roadSpeed_param: 10, vehicleSpeed_param: 2, background_param: "background_3", currentLevel_param: "levelSix", finishTime_param: 2000)
            } else if levelSeven.containsPoint(location){
                beginGame(4, levelReward_param: 155, time_param: 2600,roadSpeed_param: 11, vehicleSpeed_param: 1.8, background_param: "background_4", currentLevel_param: "levelSeven", finishTime_param: 2300)
            } else if levelEight.containsPoint(location){
                beginGame(2, levelReward_param: 200, time_param: 2900,roadSpeed_param: 12, vehicleSpeed_param: 1.6, background_param: "background_2", currentLevel_param: "levelEight", finishTime_param: 2600)
            } else if levelNine.containsPoint(location){
                beginGame(3, levelReward_param: 250, time_param: 3300,roadSpeed_param: 15, vehicleSpeed_param: 1.4, background_param: "background_3", currentLevel_param: "levelNine", finishTime_param: 3000)
            } else if levelTen.containsPoint(location){
                beginGame(4, levelReward_param: 300, time_param: 3600,roadSpeed_param: 20, vehicleSpeed_param: 1.2, background_param: "background_4", currentLevel_param: "levelTen", finishTime_param: 3300)
            }
        }
    }
    
    //MARK: Game Function
    func beginGame(roadLanes_param: Int, levelReward_param: Int, time_param: NSTimeInterval,roadSpeed_param: CGFloat, vehicleSpeed_param: Double, background_param: String, currentLevel_param: String, finishTime_param: NSTimeInterval){
        let beginGameScene = GameScene(size: size, roadLanes_param: roadLanes_param, levelReward_param: levelReward_param, time_param: time_param,roadSpeed_param: roadSpeed_param, vehicleSpeed_param: vehicleSpeed_param, background_param: background_param, currentLevel_param: currentLevel_param, finishTime_param: finishTime_param)
            view?.presentScene(beginGameScene)
    }
    
}
