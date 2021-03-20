//
//  LabelNode.swift
//  BottleFlip
//
//  Created by Кирилл Дутов on 20.03.2021.
//

import SpriteKit

class LabelNode: SKLabelNode {

    convenience init(text: String, fontSize: CGFloat, position: CGPoint, fontColor: UIColor) {
        self.init(fontNamed: UI_FONT)
        self.text = text
        self.fontSize = fontSize
        self.position = position
        self.fontColor = fontColor
    }
}
 
