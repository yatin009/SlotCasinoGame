//
//  BetOneButton.swift
//  SlotCasinoGame
//
//  Created by Priyank Vasa on 2017-04-02.
//  Copyright © 2017 MAPD-124. All rights reserved.
//

import SpriteKit
import GameplayKit

class BetOneButton: SKSpriteNode {
    // Constructor / initialize
    init() {
        let texture = SKTexture(image: #imageLiteral(resourceName: "BET_ONE"))
        super.init(texture: texture, color: .white, size: CGSize(width: 150, height: 120))
        self.position = CGPoint(x: 50, y: -385)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
