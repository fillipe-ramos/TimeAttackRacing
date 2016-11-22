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
    //asa
    
    
    override func didMoveToView(view: SKView) {
        addLevelMenu()
        
    }
    
    func addLevelMenu(){
        backgroundColor = SKColor.lightGrayColor()
        
        // Level One
        levelOne = SKShapeNode(ellipseOfSize: CGSize(width: 70,height: 50))
        levelOne.position = CGPoint(x: size.width*0.15, y: size.height*0.1)
        levelOne.strokeColor = SKColor.blackColor()
        levelOne.fillColor = SKColor.blackColor()
        
        // Level Two
        levelTwo = SKShapeNode(ellipseOfSize: CGSize(width: 70,height: 50))
        levelTwo.position = CGPoint(x: size.width*0.5, y: size.height*0.15)
        levelTwo.strokeColor = SKColor.blackColor()
        levelTwo.fillColor = SKColor.blackColor()
        
        // Level Three
        levelThree = SKShapeNode(ellipseOfSize: CGSize(width: 70,height: 50))
        levelThree.position = CGPoint(x: size.width*0.8, y: size.height*0.2)
        levelThree.strokeColor = SKColor.blackColor()
        levelThree.fillColor = SKColor.blackColor()
        
        // Level Four
        levelFour = SKShapeNode(ellipseOfSize: CGSize(width: 70,height: 50))
        levelFour.position = CGPoint(x: size.width*0.7, y: size.height*0.33)
        levelFour.strokeColor = SKColor.blackColor()
        levelFour.fillColor = SKColor.blackColor()
        
        // Level Five
        levelFive = SKShapeNode(ellipseOfSize: CGSize(width: 70,height: 50))
        levelFive.position = CGPoint(x: size.width*0.46, y: size.height*0.45)
        levelFive.strokeColor = SKColor.blackColor()
        levelFive.fillColor = SKColor.blackColor()
        
        // Level Six
        levelSix = SKShapeNode(ellipseOfSize: CGSize(width: 70,height: 50))
        levelSix.position = CGPoint(x: size.width*0.2, y: size.height*0.6)
        levelSix.strokeColor = SKColor.blackColor()
        levelSix.fillColor = SKColor.blackColor()
        
        // Level Seven
        levelSeven = SKShapeNode(ellipseOfSize: CGSize(width: 70,height: 50))
        levelSeven.position = CGPoint(x: size.width*0.2, y: size.height*0.8)
        levelSeven.strokeColor = SKColor.blackColor()
        levelSeven.fillColor = SKColor.blackColor()
        
        // Level Eight
        levelEight = SKShapeNode(ellipseOfSize: CGSize(width: 70,height: 50))
        levelEight.position = CGPoint(x: size.width*0.5, y: size.height*0.9)
        levelEight.strokeColor = SKColor.blackColor()
        levelEight.fillColor = SKColor.blackColor()
        
        
        // Level Nice
        levelNine = SKShapeNode(ellipseOfSize: CGSize(width: 70,height: 50))
        levelNine.position = CGPoint(x: size.width*0.8, y: size.height*0.8)
        levelNine.strokeColor = SKColor.blackColor()
        levelNine.fillColor = SKColor.blackColor()
        
        // Level Ten
        levelTen = SKShapeNode(ellipseOfSize: CGSize(width: 70,height: 50))
        levelTen.position = CGPoint(x: size.width*0.9, y: size.height*0.6)
        levelTen.strokeColor = SKColor.blackColor()
        levelTen.fillColor = SKColor.blackColor()
        
        addChild(levelOne)
        addChild(levelTwo)
        addChild(levelThree)
        addChild(levelFour)
        addChild(levelFive)
        addChild(levelSix)
        addChild(levelSeven)
        addChild(levelEight)
        addChild(levelNine)
        addChild(levelTen)
        
        drawDots()
        
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
            
            if levelOne.containsPoint(location){
                let ac = UIAlertController(title: "Hello!", message: "This is a test.", preferredStyle: .ActionSheet)
                
                let popover = ac.popoverPresentationController
                popover?.sourceView = view
                popover?.sourceRect = CGRect(x: 32, y: 32, width: 64, height: 64)
                
                 (ac, animated: true)
                
//                beginGame(2, levelReward_param: 10, time_param: 600,roadSpeed_param: 6, vehicleSpeed_param: 3, background_param: "background_2")
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
