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
//    var playButton = SKSpriteNode()
//    var shopButton = SKSpriteNode()
    
    override func didMoveToView(view: SKView) {

    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch: AnyObject in touches {
            let location = touch.locationInNode(self)
            
//            if playButton.containsPoint(location){
//                beginGame()
//            }
            
        }
    }
}
