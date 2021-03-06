//
//  ReelTwo.swift
//  SlotCasinoGame
//
//  Created by Yatin on 01/04/17.
//  Copyright © 2017 MAPD-124. All rights reserved.
//

import SpriteKit
import GameplayKit

//REEL TWO SKNODE
class ReelTwo: SKSpriteNode {
    // Constructor / initialize
    init() {
        let texture = SKTexture(image: #imageLiteral(resourceName: "banana"))
        super.init(texture: texture, color: .white, size: CGSize(width: 150, height: 120))
        self.position = CGPoint(x: -4, y: -55)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
