//
//  BottleController.swift
//  BottleFlip
//
//  Created by Кирилл Дутов on 20.03.2021.
//

import Foundation

class BottleController {
    
    class func readItems() -> [Bottle] {
        
        var bottles = [Bottle]()
        
        //Reading items from plist
        if let path = Bundle.main.path(forResource: "Items", ofType: "plist"),
           let plistArray = NSArray(contentsOfFile: path) as? [[String: Any]] {
            for dic in plistArray {
                let bottle = Bottle(dic as NSDictionary)
                bottles.append(bottle)
            }
        }
       return bottles
    }
    
    class func saveSelectedBottle(_ index: Int) {
        //Save index
        UserDefaults.standard.setValue(index, forKey: "selectedBottle")
        UserDefaults.standard.synchronize()
    }
    
    class func getSaveBottleIndex() -> Int {
     //Get saved index
        return UserDefaults.standard.integer(forKey: "selectedBottle")
    }
}
