//
//  MenuScene.swift
//  BottleFlip
//
//  Created by Кирилл Дутов on 20.03.2021.
//

import UIKit
import SpriteKit

class MenuScene: SKScene {
    
    var highScore = 0
    var totalFlips = 0
    
    override func didMove(to view: SKView) {
        self.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
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
    }
}
