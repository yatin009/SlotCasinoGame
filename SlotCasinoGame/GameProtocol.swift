//
//  GameProtocol.swift
//  SlotCasinoGame
//
//  Created by Yatin on 30/03/17.
//  Copyright © 2017 MAPD-124. All rights reserved.
//

protocol GameProtocol {
    func Reset()
    
    func CheckBounds()
    
    func Start()
    
    func Update()
}
