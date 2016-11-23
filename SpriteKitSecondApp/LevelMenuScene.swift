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
        let labelFontColorIncompleted = UIColor.blackColor()
        let labelFontColorCompleted = UIColor.whiteColor()
        let levelCompleted = SKColor.blackColor()
        let levelIncompleted = SKColor.whiteColor()
        
        // Level One
        levelOne = SKShapeNode(ellipseOfSize: CGSize(width: 70,height: 50))
        levelOne.position = CGPoint(x: size.width*0.15, y: size.height*0.1)
        levelOne.strokeColor = SKColor.blackColor()
        levelOne.fillColor = levelCompleted
        levelOne.zPosition = 1
        let levelOneLabel = SKLabelNode(fontNamed:"Chalkduster")
        levelOneLabel.text = "1"
        levelOneLabel.fontSize = labelFontSize
        levelOneLabel.fontColor = labelFontColorCompleted
        levelOneLabel.zPosition = 2
        
        // Level Two
        levelTwo = SKShapeNode(ellipseOfSize: CGSize(width: 70,height: 50))
        levelTwo.position = CGPoint(x: size.width*0.5, y: size.height*0.15)
        levelTwo.strokeColor = SKColor.blackColor()
        levelTwo.fillColor = levelIncompleted
        levelTwo.zPosition = 1
        let levelTwoLabel = SKLabelNode(fontNamed:"Chalkduster")
        levelTwoLabel.text = "2"
        levelTwoLabel.fontSize = labelFontSize
        levelTwoLabel.fontColor = labelFontColorIncompleted
        levelTwoLabel.zPosition = 2
        
        // Level Three
        levelThree = SKShapeNode(ellipseOfSize: CGSize(width: 70,height: 50))
        levelThree.position = CGPoint(x: size.width*0.8, y: size.height*0.2)
        levelThree.strokeColor = SKColor.blackColor()
        levelThree.fillColor = levelIncompleted
        levelThree.zPosition = 1
        let levelThreeLabel = SKLabelNode(fontNamed:"Chalkduster")
        levelThreeLabel.text = "3"
        levelThreeLabel.fontSize = labelFontSize
        levelThreeLabel.fontColor = labelFontColorIncompleted
        levelThreeLabel.zPosition = 2
        
        // Level Four
        levelFour = SKShapeNode(ellipseOfSize: CGSize(width: 70,height: 50))
        levelFour.position = CGPoint(x: size.width*0.7, y: size.height*0.33)
        levelFour.strokeColor = SKColor.blackColor()
        levelFour.fillColor = levelIncompleted
        levelFour.zPosition = 1
        let levelFourLabel = SKLabelNode(fontNamed:"Chalkduster")
        levelFourLabel.text = "4"
        levelFourLabel.fontSize = labelFontSize
        levelFourLabel.fontColor = labelFontColorIncompleted
        levelFourLabel.zPosition = 2
        
        // Level Five
        levelFive = SKShapeNode(ellipseOfSize: CGSize(width: 70,height: 50))
        levelFive.position = CGPoint(x: size.width*0.46, y: size.height*0.45)
        levelFive.strokeColor = SKColor.blackColor()
        levelFive.fillColor = levelIncompleted
        levelFive.zPosition = 1
        let levelFiveLabel = SKLabelNode(fontNamed:"Chalkduster")
        levelFiveLabel.text = "5"
        levelFiveLabel.fontSize = labelFontSize
        levelFiveLabel.fontColor = labelFontColorIncompleted
        levelFiveLabel.zPosition = 2
        
        // Level Six
        levelSix = SKShapeNode(ellipseOfSize: CGSize(width: 70,height: 50))
        levelSix.position = CGPoint(x: size.width*0.2, y: size.height*0.6)
        levelSix.strokeColor = SKColor.blackColor()
        levelSix.fillColor = levelIncompleted
        levelSix.zPosition = 1
        let levelSixLabel = SKLabelNode(fontNamed:"Chalkduster")
        levelSixLabel.text = "6"
        levelSixLabel.fontSize = labelFontSize
        levelSixLabel.fontColor = labelFontColorIncompleted
        levelSixLabel.zPosition = 2
        
        // Level Seven
        levelSeven = SKShapeNode(ellipseOfSize: CGSize(width: 70,height: 50))
        levelSeven.position = CGPoint(x: size.width*0.2, y: size.height*0.8)
        levelSeven.strokeColor = SKColor.blackColor()
        levelSeven.fillColor = levelIncompleted
        levelSeven.zPosition = 1
        let levelSevenLabel = SKLabelNode(fontNamed:"Chalkduster")
        levelSevenLabel.text = "7"
        levelSevenLabel.fontSize = labelFontSize
        levelSevenLabel.fontColor = labelFontColorIncompleted
        levelSevenLabel.zPosition = 2
        
        // Level Eight
        levelEight = SKShapeNode(ellipseOfSize: CGSize(width: 70,height: 50))
        levelEight.position = CGPoint(x: size.width*0.5, y: size.height*0.9)
        levelEight.strokeColor = SKColor.blackColor()
        levelEight.fillColor = levelIncompleted
        levelEight.zPosition = 1
        let levelEightLabel = SKLabelNode(fontNamed:"Chalkduster")
        levelEightLabel.text = "8"
        levelEightLabel.fontSize = labelFontSize
        levelEightLabel.fontColor = labelFontColorIncompleted
        levelEightLabel.zPosition = 2
        
        
        // Level Nice
        levelNine = SKShapeNode(ellipseOfSize: CGSize(width: 70,height: 50))
        levelNine.position = CGPoint(x: size.width*0.8, y: size.height*0.8)
        levelNine.strokeColor = SKColor.blackColor()
        levelNine.fillColor = levelIncompleted
        levelNine.zPosition = 1
        let levelNineLabel = SKLabelNode(fontNamed:"Chalkduster")
        levelNineLabel.text = "9"
        levelNineLabel.fontSize = labelFontSize
        levelNineLabel.fontColor = labelFontColorIncompleted
        levelNineLabel.zPosition = 2
        
        // Level Ten
        levelTen = SKShapeNode(ellipseOfSize: CGSize(width: 70,height: 50))
        levelTen.position = CGPoint(x: size.width*0.9, y: size.height*0.6)
        levelTen.strokeColor = SKColor.blackColor()
        levelTen.fillColor = levelIncompleted
        levelTen.zPosition = 1
        let levelTenLabel = SKLabelNode(fontNamed:"Chalkduster")
        levelTenLabel.text = "10"
        levelTenLabel.fontSize = labelFontSize
        levelTenLabel.fontColor = labelFontColorIncompleted
        levelTenLabel.zPosition = 2
        
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
                beginGame(2, levelReward_param: 10, time_param: 600,roadSpeed_param: 6, vehicleSpeed_param: 3, background_param: "background_2")
            } else if levelTwo.containsPoint(location){
                beginGame(3, levelReward_param: 15, time_param: 600,roadSpeed_param: 6, vehicleSpeed_param: 2.8, background_param: "background_3")
            } else if levelThree.containsPoint(location){
                beginGame(4, levelReward_param: 30, time_param: 600,roadSpeed_param: 7, vehicleSpeed_param: 2.6, background_param: "background_4")
            } else if levelFour.containsPoint(location){
                beginGame(2, levelReward_param: 50, time_param: 600,roadSpeed_param: 8, vehicleSpeed_param: 2.4, background_param: "background_2")
            } else if levelFive.containsPoint(location){
                beginGame(4, levelReward_param: 75, time_param: 600,roadSpeed_param: 9, vehicleSpeed_param: 2.2, background_param: "background_4")
            } else if levelSix.containsPoint(location){
                beginGame(3, levelReward_param: 120, time_param: 600,roadSpeed_param: 10, vehicleSpeed_param: 2, background_param: "background_3")
            } else if levelSeven.containsPoint(location){
                beginGame(4, levelReward_param: 155, time_param: 600,roadSpeed_param: 11, vehicleSpeed_param: 1.8, background_param: "background_4")
            } else if levelEight.containsPoint(location){
                beginGame(2, levelReward_param: 200, time_param: 600,roadSpeed_param: 12, vehicleSpeed_param: 1.6, background_param: "background_2")
            } else if levelNine.containsPoint(location){
                beginGame(3, levelReward_param: 250, time_param: 600,roadSpeed_param: 15, vehicleSpeed_param: 1.4, background_param: "background_3")
            } else if levelTen.containsPoint(location){
                beginGame(4, levelReward_param: 300, time_param: 600,roadSpeed_param: 20, vehicleSpeed_param: 1.2, background_param: "background_4")
            }
        }
    }
    
    //MARK: Game Function
    func beginGame(roadLanes_param: Int, levelReward_param: Int, time_param: NSTimeInterval,roadSpeed_param: CGFloat, vehicleSpeed_param: Double, background_param: String){
        let beginGameScene = GameScene(size: size, roadLanes_param: roadLanes_param, levelReward_param: levelReward_param, time_param: time_param,roadSpeed_param: roadSpeed_param, vehicleSpeed_param: vehicleSpeed_param, background_param: background_param)
        view?.presentScene(beginGameScene)
    }
    
}
