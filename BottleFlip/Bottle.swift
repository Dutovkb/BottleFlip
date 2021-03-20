//
//  Bottle.swift
//  BottleFlip
//
//  Created by Кирилл Дутов on 20.03.2021.
//

import Foundation

class Bottle {
    var Sprite: String?
    var Mass: NSNumber?
    var Resistance: NSNumber?
    var XScale: NSNumber?
    var YScale: NSNumber?
    var MinFlips: NSNumber?
    
    init(_ bottleDictionary: NSDictionary) {
        self.Sprite = bottleDictionary["Sprite"] as? String
        self.Mass = bottleDictionary["Mass"] as? NSNumber
        self.Resistance = bottleDictionary["Resistance"] as? NSNumber
        self.XScale = bottleDictionary["XScale"] as? NSNumber
        self.YScale = bottleDictionary["YScale"] as? NSNumber
        self.MinFlips = bottleDictionary["MinFlips"] as? NSNumber
    }
    
}
