//
//  GameOverScene.swift
//  SpriteKitSecondApp
//
//  Created by Fillipe Ramos on 9/13/16.
//  Copyright © 2016 Fillipe Ramos. All rights reserved.
//

import Foundation
import SpriteKit

class GameOverScene: SKScene {
    
    init(size: CGSize, won:Bool, coins: Int, levelReward: Int) {
        
        super.init(size: size)
        
        // 1
        backgroundColor = SKColor.lightGrayColor()
        
        // 2
        let message = won ? "You Won!" : "You Lose :["
        
        // 3
        let label = SKLabelNode(fontNamed: "Chalkduster")
        label.text = message
        label.fontSize = 40
        label.fontColor = SKColor.blackColor()
        label.position = CGPoint(x: CGRectGetMidX(frame), y: CGRectGetMidY(frame) + 200)
        addChild(label)
        
        let message2 = "Level Reward: \(levelReward)"
        
        // 3
        let label2 = SKLabelNode(fontNamed: "Chalkduster")
        label2.text = message2
        label2.fontSize = 24
        label2.fontColor = SKColor.blackColor()
        label2.position = CGPoint(x: CGRectGetMidX(frame), y: CGRectGetMidY(frame) + 100)
        addChild(label2)
        
        let message3 = "Catched Coins: \(coins)"
        
        // 3
        let label3 = SKLabelNode(fontNamed: "Chalkduster")
        label3.text = message3
        label3.fontSize = 24
        label3.fontColor = SKColor.blackColor()
        label3.position = CGPoint(x: CGRectGetMidX(frame), y: CGRectGetMidY(frame))
        addChild(label3)
        
        let message4 = "Total: \(coins+levelReward) Coins"
        
        // 3
        let label4 = SKLabelNode(fontNamed: "Chalkduster")
        label4.text = message4
        label4.fontSize = 24
        label4.fontColor = SKColor.blackColor()
        label4.position = CGPoint(x: CGRectGetMidX(frame), y: CGRectGetMidY(frame) - 100)
        addChild(label4)
        
        // 4
        runAction(SKAction.sequence([
            SKAction.waitForDuration(3.0),
            SKAction.runBlock() {
                // 5
                let reveal = SKTransition.flipHorizontalWithDuration(0.5)
                let scene = LevelMenuScene(size: size)
                self.view?.presentScene(scene, transition:reveal)
            }
            ]))
        
    }
    
    // 6
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
