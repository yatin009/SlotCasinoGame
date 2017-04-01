//
//  GameScene.swift
//  SlotCasinoGame
//
//  Created by Yatin on 30/03/17.
//  Copyright © 2017 MAPD-124. All rights reserved.
//

import SpriteKit
import GameplayKit

var screenSize = UIScreen.main.bounds
var screenWidth = screenSize.width
var screenHeight = screenSize.height

class GameScene: SKScene {
    
    var slotMachineSprite : SlotMachine?
    var spinButtonSprite : SpinButton?
    var reelOneSprite :ReelOne?
    var reelTwoSprite :ReelTwo?
    var reelThreeSprite :ReelThree?
    var resetButtonSprite :ResetButton?
    var betButtonSprite :BetButton?
    
    var playerMoney = 1000;
    var winnings = 0;
    var jackpot = 5000;
    var playerBet = 0;
    
    var isSpining: Bool = false
    
    var slotBetImages: [UIImage] = [#imageLiteral(resourceName: "bell"), #imageLiteral(resourceName: "orange"), #imageLiteral(resourceName: "grapes"), #imageLiteral(resourceName: "cherry"), #imageLiteral(resourceName: "banana"), #imageLiteral(resourceName: "bar"), #imageLiteral(resourceName: "seven"), #imageLiteral(resourceName: "blank")]
    
    override func didMove(to view: SKView) {
        slotMachineSprite = SlotMachine()
        slotMachineSprite?.zPosition = 0;
        self.addChild(slotMachineSprite!)
        
        spinButtonSprite = SpinButton()
        spinButtonSprite?.zPosition=1;
        self.addChild(spinButtonSprite!)
        
        reelOneSprite = ReelOne()
        reelOneSprite?.zPosition=1;
        self.addChild(reelOneSprite!)
        
        reelTwoSprite = ReelTwo()
        reelTwoSprite?.zPosition=1;
        self.addChild(reelTwoSprite!)

        reelThreeSprite = ReelThree()
        reelThreeSprite?.zPosition=1;
        self.addChild(reelThreeSprite!)
        
        resetButtonSprite = ResetButton()
        resetButtonSprite?.zPosition=1;
        self.addChild(resetButtonSprite!)
        
        betButtonSprite = BetButton()
        betButtonSprite?.zPosition = 1
        self.addChild(betButtonSprite!)
        
    }
    
    
    func touchDown(atPoint pos : CGPoint) {
        
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        
    }
    
    func touchUp(atPoint pos : CGPoint) {
        if (self.spinButtonSprite?.contains(pos))! && playerBet > 0{
            slotMachineSprite?.jackpotLabel.text = "Play Ur Luck"
            isSpining = true
            spinReels()
            print("spinButton Tapped")
        }else if(self.betButtonSprite?.contains(pos))!{
            bet()
        }else if(self.resetButtonSprite?.contains(pos))!{
            resetAll()
        }
    }
    
    func spinReels(){
        let firstValue = Int(arc4random_uniform(UInt32(slotBetImages.count)))
        reelOneSprite?.texture = SKTexture(image: slotBetImages[firstValue])
        
        let secondValue = Int(arc4random_uniform(UInt32(slotBetImages.count)))
        reelTwoSprite?.texture = SKTexture(image: slotBetImages[secondValue])
        
        let thirdValue = Int(arc4random_uniform(UInt32(slotBetImages.count)))
        reelThreeSprite?.texture = SKTexture(image: slotBetImages[thirdValue])

        checkBet(firstValue: firstValue, secondValue: secondValue, thirdValue: thirdValue)
        
        isSpining = false
    }
    
    func checkBet(firstValue : Int, secondValue : Int, thirdValue : Int){
        print("First Value >> ", firstValue)
        print("Second Value >> ", secondValue)
        print("third Value >> ", thirdValue)
        if(firstValue == secondValue && secondValue == thirdValue){
            print("JACKPOT")
            slotMachineSprite?.jackpotLabel.text = "You Won"
            winnings = winnings + jackpot
            playerBet = 0
            playerMoney = playerMoney + jackpot
            
            slotMachineSprite?.betLabel.text = "0"
            slotMachineSprite?.winLabel.text = String(winnings)
            slotMachineSprite?.totalLabel.text = String(playerMoney)
        }else if(firstValue == 7 && secondValue == 7 && thirdValue == 7){
            print("LOST ALL, GAME OVER")
        }else if(firstValue == secondValue || secondValue == thirdValue || firstValue == thirdValue){
            winnings = winnings + 50
            playerBet = 0
            playerMoney = playerMoney + 50
            
            slotMachineSprite?.betLabel.text = "0"
            slotMachineSprite?.winLabel.text = String(winnings)
            slotMachineSprite?.totalLabel.text = String(playerMoney)
        }else{
            playerBet = 0
            slotMachineSprite?.betLabel.text = "0"
            slotMachineSprite?.totalLabel.text = String(playerMoney)
        }
    }
    
    func bet(){
        if(playerMoney < 25){
            print("No more money")
            return
        }
        playerMoney = playerMoney - 25
        playerBet = playerBet + 25
        
        slotMachineSprite?.totalLabel.text = String(playerMoney)
        slotMachineSprite?.betLabel.text = String(playerBet)
    }
    
    /* Utility function to reset the player stats */
    func resetAll() {
        slotMachineSprite?.jackpotLabel.text = "Play Ur Luck"
        playerMoney = 1000;
        winnings = 0;
        jackpot = 5000;
        playerBet = 0;
        
        slotMachineSprite?.winLabel.text = String(winnings)
        slotMachineSprite?.betLabel.text = String(playerBet)
        slotMachineSprite?.totalLabel.text = String(playerMoney)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    // Game Loop - trigger 60FPS
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
