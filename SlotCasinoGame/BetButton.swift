//
//  BetButton.swift
//  SlotCasinoGame
//
//  Created by Yatin on 01/04/17.
//  Copyright © 2017 MAPD-124. All rights reserved.
//

import SpriteKit
import GameplayKit

//AMX BET BUTTON SKNODE

class BetButton: SKSpriteNode {
    // Constructor / initialize
    init() {
        let texture = SKTexture(image: #imageLiteral(resourceName: "BET_MAX"))
        super.init(texture: texture, color: .white, size: CGSize(width: 150, height: 120))
        self.position = CGPoint(x: -90, y: -385)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
