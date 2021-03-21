//
//  MenuScene.swift
//  BottleFlip
//
//  Created by Кирилл Дутов on 20.03.2021.
//

import UIKit
import SpriteKit

class MenuScene: SKScene {
    
    var playButtonNode = SKSpriteNode()
    var tableNode = SKSpriteNode()
    var bottleNode = SKSpriteNode()
    var leftButtonNode = SKSpriteNode()
    var rightButtonNode = SKSpriteNode()
    var flipsTagNode = SKSpriteNode()
    var unlockLabelNode = SKLabelNode()
    
    var highScore = 0
    var totalFlips = 0
    var bottles = [Bottle]()
    var selectedBottleIndex = 0
    var totalBottleCount = 0
    
    override func didMove(to view: SKView) {
        self.backgroundColor = UI_BACKGROUND_COLOR
        
        // Loading bottles from items.plist
        totalBottleCount = bottles.count
        bottles = BottleController.readItems()
        setupUI()
    }
    
    func setupUI() {
        
        // Logo Node
        let logo = ButtonNode(imageNode: "logo", position: CGPoint(x: self.frame.midX, y: self.frame.maxY - 100), xScale: 1, yScale: 1)
        self.addChild(logo)
        
        // Best Score Label
        let bestScoreLabelNode = LabelNode(text: "ЛУЧШИЙ РЕЗУЛЬТАТ", fontSize: 15, position: CGPoint(x: self.frame.midX - 100, y: self.frame.maxY - 185), fontColor: #colorLiteral(red: 0.7568627451, green: 0.3450980392, blue: 0.3450980392, alpha: 1))
        self.addChild(bestScoreLabelNode)
        
        // High score label
        let highScoreLabelNode = LabelNode(text: String(highScore), fontSize: 70, position: CGPoint(x: self.frame.midX - 100, y: self.frame.maxY - 260), fontColor: #colorLiteral(red: 0.7568627451, green: 0.3450980392, blue: 0.3450980392, alpha: 1))
        self.addChild(highScoreLabelNode)
        
        //Total flips label
        let totalFlipsLabelNode = LabelNode(text: "КОЛИЧЕСТВО САЛЬТО", fontSize: 15, position: CGPoint(x: self.frame.midX + 100, y: self.frame.maxY - 185), fontColor: #colorLiteral(red: 0.1411764706, green: 0.231372549, blue: 0.6666666667, alpha: 1))
        self.addChild(totalFlipsLabelNode)
        
        //Total flips score label
        let flipsLabelNode = LabelNode(text: String(totalFlips), fontSize: 70, position: CGPoint(x: self.frame.midX + 100, y: self.frame.maxY - 260), fontColor: #colorLiteral(red: 0.1411764706, green: 0.231372549, blue: 0.6666666667, alpha: 1))
        self.addChild(flipsLabelNode)
        
        //Play button
        playButtonNode = ButtonNode(imageNode: "play_button", position: CGPoint(x: self.frame.midX, y: self.frame.midY - 15), xScale: 0.9, yScale: 0.9)
        self.addChild(playButtonNode)
        
        //Table node
        tableNode = ButtonNode(imageNode: "table", position: CGPoint(x: self.frame.midX, y: self.frame.minY + 29), xScale: 0.45, yScale: 0.45)
        tableNode.zPosition = 3
        self.addChild(tableNode)
        
        //Bottle node
        selectedBottleIndex = BottleController.getSaveBottleIndex()
        let selectedBottle = bottles[selectedBottleIndex]
        
        bottleNode = SKSpriteNode(imageNamed: selectedBottle.Sprite!)
        bottleNode.zPosition = 10
        self.addChild(bottleNode)
        
        //Left button
        leftButtonNode = ButtonNode(imageNode: "left_button", position: CGPoint(x: self.frame.midX + leftButtonNode.size.width - 130, y: self.frame.minY - leftButtonNode.size.height + 145), xScale: 0.8, yScale: 0.8)
        self.changeButton(leftButtonNode, state: false)
        self.addChild(leftButtonNode)
        
        //Right button
        rightButtonNode = ButtonNode(imageNode: "right_button", position: CGPoint(x: self.frame.midX + rightButtonNode.size.width + 130, y: self.frame.minY - rightButtonNode.size.height + 145), xScale: 0.8, yScale: 0.8)
        self.changeButton(rightButtonNode , state: true)
        self.addChild(rightButtonNode)
        
        //Lock Node
        flipsTagNode = ButtonNode(imageNode: "lock", position: CGPoint(x: self.frame.midX + bottleNode.size.width * 0.25, y: self.frame.minY + bottleNode.size.height/2 + 94), xScale: 0.5, yScale: 0.5)
        flipsTagNode.zPosition = 25
        flipsTagNode.zRotation = 0.3
        self.addChild(flipsTagNode)
        
        //Unlock label
        unlockLabelNode = LabelNode(text: "0", fontSize: 36, position: CGPoint(x: 0, y: -unlockLabelNode.frame.size.height + 25), fontColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
        unlockLabelNode.zPosition = 30
        flipsTagNode.addChild(unlockLabelNode)
        
        //Update selected bottle
        self.updateSelectedBottle(selectedBottle)
        self.pulseLockNode(flipsTagNode)
    }
    
    func changeButton(_ buttonNode: SKSpriteNode, state: Bool) {
        //Change arrow sprites
        var buttonColor = #colorLiteral(red: 0.3411764706, green: 0.3529411765, blue: 0.4431372549, alpha: 0.2)
        
        if state {
            buttonColor = #colorLiteral(red: 0.3411764706, green: 0.3529411765, blue: 0.4431372549, alpha: 1)
        }
        
        buttonNode.color = buttonColor
        buttonNode.colorBlendFactor = 1
        
    }
    
    func updateSelectedBottle(_ bottle: Bottle) {
        
        // Update to the selected bottle
        let unlockFilps = bottle.MinFlips!.intValue - highScore
        let unlocked = (unlockFilps <= 0)
        
        flipsTagNode.isHidden = unlocked
        unlockLabelNode.isHidden = unlocked
        
        bottleNode.texture = SKTexture(imageNamed: bottle.Sprite!)
        playButtonNode.texture = SKTexture(imageNamed: unlocked ? "play_button" : "shop_button")
        
        bottleNode.size = CGSize(width: bottleNode.texture!.size().width * CGFloat(bottle.XScale!.floatValue),
                                 height: bottleNode.texture!.size().height * CGFloat(bottle.YScale!.floatValue))
        
        bottleNode.position = CGPoint(x: self.frame.midX, y: self.frame.minY + bottleNode.size.height / 2 + 94)
        
        flipsTagNode.position = CGPoint(x: self.frame.midX + bottleNode.size.width * 0.25, y: self.frame.minY + bottleNode.size.height/2 + 94)
        
        unlockLabelNode.text = "\(bottle.MinFlips!.intValue)"
        unlockLabelNode.position = CGPoint(x: 0, y: -unlockLabelNode.frame.size.height + 25)
        
        self.updateArrowsState()
    }
    
    func updateArrowsState() {
        self.changeButton(leftButtonNode, state: Bool(truncating: selectedBottleIndex as NSNumber))
        self.changeButton(rightButtonNode, state: selectedBottleIndex != totalBottleCount - 1)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            
            // Left button is pressed
            if leftButtonNode.contains(location) {
                let prevIndex = selectedBottleIndex - 1
                if prevIndex >= 0 {
                    self.updateByIndex(prevIndex)
                }
            }
            
            // Right button is pressed
            if rightButtonNode.contains(location) {
                let nextIndex = selectedBottleIndex + 1
                if nextIndex >= totalBottleCount {
                    self.updateByIndex(nextIndex)
                }
            }
        }
    }
    
    func updateByIndex(_ index: Int) {
        let bottle = bottles[index]
        
        selectedBottleIndex = index
        
        self.updateSelectedBottle(bottle)
        BottleController.saveSelectedBottle(selectedBottleIndex)
    }
    
    func pulseLockNode(_ node: SKSpriteNode) {
        //Pulse animation for lock
        let scaleDownAction = SKAction.scale(to: 0.35, duration: 0.5)
        let skaleUpAction = SKAction.scale(to: 0.5, duration: 0.5)
        let seq = SKAction.sequence([scaleDownAction, skaleUpAction])
        node.run(SKAction.repeatForever(seq))
    }
}
