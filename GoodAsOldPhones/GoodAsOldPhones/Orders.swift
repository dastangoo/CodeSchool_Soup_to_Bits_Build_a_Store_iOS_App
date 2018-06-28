//
//  Orders.swift
//  GoodAsOldPhones
//
//  Created by superuser on 6/28/18.
//  Copyright © 2018 Code School. All rights reserved.
//

import UIKit

class Orders: NSObject, NSCoding {
    var orders: [Order]?
    
    override init() {
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.orders = aDecoder.decodeObjectForKey("orders") as? [Order]
        
        super.init()
    }
    
    func encodedWithCoder(aCoder: NSCoder){
        aCoder.encodeObject(orders, forKey: "orders")
    }
}
