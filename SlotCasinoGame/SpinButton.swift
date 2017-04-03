//
//  SpinButton.swift
//  SlotCasinoGame
//
//  Created by Yatin on 01/04/17.
//  Copyright © 2017 MAPD-124. All rights reserved.
//

import SpriteKit
import GameplayKit

//SPIN BUTTON SKNODE
class SpinButton: SKSpriteNode {
    // Constructor / initialize
    init() {
        let texture = SKTexture(image: #imageLiteral(resourceName: "SPIN"))
        super.init(texture: texture, color: .white, size: #imageLiteral(resourceName: "SPIN").size)
        self.position = CGPoint(x: 260, y: -385)

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
