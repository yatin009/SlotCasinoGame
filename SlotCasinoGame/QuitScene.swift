//
//  QuitScene.swift
//  SlotCasinoGame
//
//  Created by Yatin on 04/04/17.
//  Copyright © 2017 MAPD-124. All rights reserved.
//

import SpriteKit
import GameplayKit

class QuitScene: SKScene {
    
    let goodByeNode: SKSpriteNode = {
        let skNode = SKSpriteNode()
        let label = SKLabelNode(text: "See you soon")
        label.fontSize = 60
        label.horizontalAlignmentMode = .center
        
        skNode.addChild(label)
        return skNode
    }()
    
    override func didMove(to view: SKView) {
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        addChild(goodByeNode)
    }

}
