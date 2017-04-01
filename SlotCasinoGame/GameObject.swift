//
//  GameObject.swift
//  SlotCasinoGame
//
//  Created by Yatin on 30/03/17.
//  Copyright © 2017 MAPD-124. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameObject: SKSpriteNode, GameProtocol {
    // Instance Variables
    var dy:CGFloat?
    var dx:CGFloat?
    var height:CGFloat?
    var width:CGFloat?
    var halfwidth:CGFloat?
    var halfheight:CGFloat?
    var randomSource:GKRandomSource?
    
    // Constructor / initialize
    init(imageString:String) {
        let texture = SKTexture(imageNamed: imageString)
        let color = UIColor.clear
        super.init(texture: texture, color: color, size: texture.size())
        
        self.name = imageString
        self.width  = texture.size().width
        self.height = texture.size().height
        self.halfwidth = width! * 0.5
        self.halfheight = height! * 0.5
        self.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        self.randomSource = GKARC4RandomSource()
        self.Start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func Reset() {
    }
    
    func CheckBounds() {
    }
    
    func Start() {
    }
    
    func Update() {
    }
    
}
