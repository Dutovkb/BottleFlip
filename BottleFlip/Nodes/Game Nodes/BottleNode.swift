//
//  BottleNode.swift
//  BottleFlip
//
//  Created by Кирилл Дутов on 21.03.2021.
//

import SpriteKit

class BottleNode: SKSpriteNode {

    init(_ bottle: Bottle) {
        let texture = SKTexture(imageNamed: bottle.Sprite!)
        super.init(texture: texture, color: UIColor.clear, size: texture.size())
        
        self.physicsBody = SKPhysicsBody(texture: self.texture!, size: texture.size())
        self.xScale = CGFloat(bottle.XScale!.floatValue)
        self.yScale = CGFloat(bottle.YScale!.floatValue)
        self.physicsBody?.isDynamic = true
        self.physicsBody?.allowsRotation = true
        self.physicsBody?.angularDamping = 0.25
        self.physicsBody?.mass = CGFloat(bottle.Mass!.doubleValue)
        self.physicsBody?.restitution = CGFloat(bottle.Resistance!.doubleValue)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
