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
    
    //Instance variables of SKNoded class(UI elements)
    var slotMachineSprite : SlotMachine?
    var spinButtonSprite : SpinButton?
    var reelOneSprite :ReelOne?
    var reelTwoSprite :ReelTwo?
    var reelThreeSprite :ReelThree?
    var resetButtonSprite :ResetButton?
    var betButtonSprite :BetButton?
    var betOneButtonSprite :BetOneButton?
    
    //Player money track variables
    var playerMoney = 1000;
    var winnings = 0;
    var jackpot = 5000;
    var playerBet = 0;
    
    var time: Double = 0
    var firstValue: Int = 0
    var secondValue: Int = 0
    var thirdValue: Int = 0
    var timer: Timer?
    var sound: SKAudioNode = SKAudioNode(fileNamed: "spin.wav")
    
    // Boolean variable to track spining of reel
    var isSpining: Bool = false
    
    // Array of Images to be used in Reels of slot machine
    var slotBetImages: [UIImage] = [#imageLiteral(resourceName: "bell"), #imageLiteral(resourceName: "orange"), #imageLiteral(resourceName: "grapes"), #imageLiteral(resourceName: "cherry"), #imageLiteral(resourceName: "banana"), #imageLiteral(resourceName: "bar"), #imageLiteral(resourceName: "seven"), #imageLiteral(resourceName: "blank")]
    
    override func didMove(to view: SKView) {
        
        //Initializing UI elements and adding to parent
        
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
        
        betOneButtonSprite = BetOneButton()
        betOneButtonSprite?.zPosition = 1
        self.addChild(betOneButtonSprite!)
        
    }
    
    func touchDown(atPoint pos : CGPoint) {}
    func touchMoved(toPoint pos : CGPoint) {}
    
    func touchUp(atPoint pos : CGPoint) {
        //Click listner for various button on UI
        if (self.spinButtonSprite?.contains(pos))! && playerBet > 0 && !isSpining{
            slotMachineSprite?.jackpotLabel.text = "Play your luck"
            spinReels()
            print("spinButton Tapped")
        } else if(self.betButtonSprite?.contains(pos))!{
            bet(amount: 25)
        } else if(self.betOneButtonSprite?.contains(pos))!{
            bet(amount: 1)
        } else if(self.resetButtonSprite?.contains(pos))!{
            resetAll()
        }
    }
    
    func spinReels() {
        isSpining = true
        //Loop for creating spining effect. Changing images for 6 seconds
        timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(GameScene.randomizeReels), userInfo: nil, repeats: true)
        sound.autoplayLooped = false
        addChild(sound)
        sound.run(SKAction.play())
    }
    
    func randomizeReels() {
        
        // Condition check if 6 seconds has passed
        if (time > 6) {
            sound.run(SKAction.stop())
            timer!.invalidate()
            time = 0
            checkBet(firstValue: firstValue, secondValue: secondValue, thirdValue: thirdValue)
            isSpining = false
            sound.removeFromParent()
            return
        } else {time += 0.2}
        
        firstValue = Int(arc4random_uniform(UInt32(slotBetImages.count)))
        reelOneSprite?.texture = SKTexture(image: slotBetImages[firstValue])
        
        secondValue = Int(arc4random_uniform(UInt32(slotBetImages.count)))
        reelTwoSprite?.texture = SKTexture(image: slotBetImages[secondValue])
        
        thirdValue = Int(arc4random_uniform(UInt32(slotBetImages.count)))
        reelThreeSprite?.texture = SKTexture(image: slotBetImages[thirdValue])

    }
    
    //Betting Logic
    
    func checkBet(firstValue : Int, secondValue : Int, thirdValue : Int) {
        print("First Value >> ", firstValue)
        print("Second Value >> ", secondValue)
        print("Third Value >> ", thirdValue)
        if(firstValue == secondValue && secondValue == thirdValue) {
            print("JACKPOT")
            slotMachineSprite?.jackpotLabel.text = "You Won"
            winnings = winnings + jackpot
            playerBet = 0
            playerMoney = playerMoney + jackpot
            
            slotMachineSprite?.betLabel.text = "0"
            slotMachineSprite?.winLabel.text = String(winnings)
            slotMachineSprite?.totalLabel.text = String(playerMoney)
            
        } else if(firstValue == 7 && secondValue == 7 && thirdValue == 7) {
            print("LOST ALL, GAME OVER")
        } else if(firstValue == secondValue || secondValue == thirdValue || firstValue == thirdValue) {
            winnings = winnings + (playerBet*2)
            playerMoney = playerMoney + (playerBet*2)
            playerBet = 0
            
            slotMachineSprite?.betLabel.text = "0"
            slotMachineSprite?.winLabel.text = String(winnings)
            slotMachineSprite?.totalLabel.text = String(playerMoney)
        } else {
            playerBet = 0
            slotMachineSprite?.betLabel.text = "0"
            slotMachineSprite?.totalLabel.text = String(playerMoney)
        }
    }
    
    //Updating Labels
    
    func bet(amount: Int) {
        var amount = amount
        if(playerMoney < amount) {
            print("No more money")
            slotMachineSprite?.jackpotLabel.text = "No more money"
            return
        } else if (playerBet + amount > 25) {
            print("Bet limit 25")
            slotMachineSprite?.jackpotLabel.text = "Bet limit 25"
            amount = 25 - playerBet
        }
        playerMoney = playerMoney - amount
        playerBet = playerBet + amount
        
        slotMachineSprite?.totalLabel.text = String(playerMoney)
        slotMachineSprite?.betLabel.text = String(playerBet)
    }
    
    /* Utility function to reset the player stats */
    func resetAll() {
        slotMachineSprite?.jackpotLabel.text = "Play your luck"
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
}
