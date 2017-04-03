//
//  SlotMachine.swift
//  SlotCasinoGame
//
//  Created by Yatin on 30/03/17.
//  Copyright © 2017 MAPD-124. All rights reserved.
//

import SpriteKit
import GameplayKit

class SlotMachine: SKSpriteNode {
    
//    Jackpot label SkNode
    let jackpotLabel: SKLabelNode = {
        let label = SKLabelNode()
        label.text = "Play"
        label.fontSize = 30
        label.fontName = "Helvetica Neue"
        label.fontColor = SKColor(red: 255/255, green: 229/255, blue: 171/255, alpha: 1)
        label.horizontalAlignmentMode = .center
        label.position = CGPoint(x: 3, y: 166)
        label.zPosition = 1
        return label
    }()

//    Total player money label SkNode
    let totalLabel: SKLabelNode = {
        let label = SKLabelNode()
        label.text = "1,000"
        label.fontSize = 30
        label.fontName = "Helvetica Neue"
        label.fontColor = SKColor(red: 255/255, green: 229/255, blue: 171/255, alpha: 1)
        label.horizontalAlignmentMode = .right
        label.position = CGPoint(x: -115, y: -245)
        label.zPosition = 1
        return label
    }()

//    Bet amount label SkNode
    let betLabel: SKLabelNode = {
        let label = SKLabelNode()
        label.text = "0"
        label.fontSize = 30
        label.fontName = "Helvetica Neue"
        label.fontColor = SKColor(red: 255/255, green: 229/255, blue: 171/255, alpha: 1)
        label.horizontalAlignmentMode = .right
        label.position = CGPoint(x: 50, y: -245)
        label.zPosition = 1
        return label
    }()
    
//    Amount won by player label SkNode
    let winLabel: SKLabelNode = {
        let label = SKLabelNode()
        label.text = "0"
        label.fontSize = 30
        label.fontName = "Helvetica Neue"
        label.fontColor = SKColor(red: 255/255, green: 229/255, blue: 171/255, alpha: 1)
        label.horizontalAlignmentMode = .right
        label.position = CGPoint(x: 300, y: -245)
        label.zPosition = 1
        return label
    }()
    
    // Constructor / initialize
    init() {
        let texture = SKTexture(image: #imageLiteral(resourceName: "slotmachine"))
        super.init(texture: texture, color: .white, size: #imageLiteral(resourceName: "slotmachine").size)
        
//       Adding labels to background image of Slot machine
        addChild(jackpotLabel)
        addChild(winLabel)
        addChild(betLabel)
        addChild(totalLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func Start() {
    }
}

