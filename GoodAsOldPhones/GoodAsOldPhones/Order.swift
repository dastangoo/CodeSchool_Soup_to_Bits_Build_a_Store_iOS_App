//
//  Order.swift
//  GoodAsOldPhones
//
//  Created by superuser on 6/28/18.
//  Copyright © 2018 Code School. All rights reserved.
//

import UIKit

class Order: NSObject, NSCoding {
    var product: Product?
    
    override init() {
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.product = aDecoder.decodeObjectForKey("product") as? Product
        
        super.init()
    }
    
    func encodedWithCoder(aCoder: NSCoder){
        aCoder.encodeObject(orders, forKey: "product")
    }
}
