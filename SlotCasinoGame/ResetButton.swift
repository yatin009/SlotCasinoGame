//
//  ResetButton.swift
//  SlotCasinoGame
//
//  Created by Yatin on 01/04/17.
//  Copyright © 2017 MAPD-124. All rights reserved.
//

import SpriteKit
import GameplayKit

//RESET BUTTON SKNODE

class ResetButton: SKSpriteNode {
    // Constructor / initialize
    init() {
        let texture = SKTexture(image: #imageLiteral(resourceName: "RESET"))
        super.init(texture: texture, color: .white, size: CGSize(width: 150, height: 120))
        self.position = CGPoint(x: -240, y: -385)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
