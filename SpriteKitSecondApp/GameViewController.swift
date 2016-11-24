//
//  GameViewController.swift
//  SpriteKitSecondApp
//
//  Created by Fillipe Ramos on 9/13/16.
//  Copyright (c) 2016 Fillipe Ramos. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {
    
    var scene: MainMenuScene!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Configure the view
        
        let skView = view as! SKView
        skView.multipleTouchEnabled = false

        // Create and configure the scene
        scene = MainMenuScene(size: skView.bounds.size)
        scene.scaleMode = .AspectFill
        
        skView.showsFPS = false
        skView.showsNodeCount = false
        skView.ignoresSiblingOrder = true
        skView.showsPhysics = true
        
        skView.presentScene(scene)
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}
