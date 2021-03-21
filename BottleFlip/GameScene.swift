//
//  GameScene.swift
//  BottleFlip
//
//  Created by Кирилл Дутов on 20.03.2021.
//

import SpriteKit

class GameScene: SimpleScene {
    
    var scoreLabelNode = SKLabelNode()
    var highscoreLabelNode = SKLabelNode()
    var backButtonNode = SKSpriteNode()
    var resetButtonNode = SKSpriteNode()
    var tutorialNode = SKSpriteNode()
    var bottleNode = SKSpriteNode()
    
    override func didMove(to view: SKView) {
        //Setting the scene
        self.physicsBody?.restitution = 0
        self.backgroundColor = UI_BACKGROUND_COLOR
        
        self.setupUINodes()
        self.setupGameNodes()
    }
    
    func setupUINodes() {
        //Score label node
        scoreLabelNode = LabelNode(text: "0", fontSize: 140, position: CGPoint(x: self.frame.midX, y: self.frame.midY), fontColor: #colorLiteral(red: 0.5647058824, green: 0.5843137255, blue: 0.8588235294, alpha: 0.6))
        scoreLabelNode.zPosition = -1
        self.addChild(scoreLabelNode)
        
        //Highscore label node
        highscoreLabelNode = LabelNode(text: "НОВЫЙ РЕЗУЛЬТАТ", fontSize: 32, position: CGPoint(x: self.frame.midX, y: self.frame.midY - 50), fontColor: #colorLiteral(red: 0.5647058824, green: 0.5843137255, blue: 0.8588235294, alpha: 0.6))
        highscoreLabelNode.isHidden = true
        highscoreLabelNode.zPosition = -1
        self.addChild(highscoreLabelNode)
        
        //Back button node
        backButtonNode = ButtonNode(imageNode: "back_button", position: CGPoint(x: self.frame.minX + backButtonNode.size.width + 30, y: self.frame.maxY - backButtonNode.size.height - 40), xScale: 0.65, yScale: 0.65)
        self.addChild(backButtonNode)
        
        //Reset button
        resetButtonNode = ButtonNode(imageNode: "reset_button", position: CGPoint(x: self.frame.maxX - resetButtonNode.size.width - 40, y: self.frame.maxY - resetButtonNode.size.height - 40), xScale: 0.65, yScale: 0.65)
        self.addChild(resetButtonNode)
        
        //Tutorial button
        let tutorialFinished = UserDefaults.standard.bool(forKey: "tutorialFinished")
        tutorialNode = ButtonNode(imageNode: "tutorial", position: CGPoint(x: self.frame.midX, y: self.frame.midY), xScale: 0.55, yScale: 0.55)
        tutorialNode.zPosition = 5
        tutorialNode.isHidden = tutorialFinished
        self.addChild(tutorialNode)
    }
    
    func setupGameNodes() {
        //Table node
        let tableNode = SKSpriteNode(imageNamed: "table")
        
        tableNode.physicsBody = SKPhysicsBody(rectangleOf: (tableNode.texture?.size())!)
        tableNode.physicsBody?.affectedByGravity = false
        tableNode.physicsBody?.isDynamic = false
        tableNode.physicsBody?.restitution = 0
        tableNode.xScale = 0.45
        tableNode.yScale = 0.45
        tableNode.position = CGPoint(x: self.frame.midX, y: 20)
        self.addChild(tableNode)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
              
            if tutorialNode.contains(location) {
                tutorialNode.isHidden = true
                UserDefaults.standard.set(true, forKey: "tutorialFinished")
                UserDefaults.standard.synchronize()
            }
        }
        
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
