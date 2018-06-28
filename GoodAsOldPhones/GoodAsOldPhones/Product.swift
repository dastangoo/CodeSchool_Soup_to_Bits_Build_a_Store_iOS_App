//
//  Product.swift
//  GoodAsOldPhones
//
//  Created by Jon Friskics on 11/16/15.
//  Copyright © 2015 Code School. All rights reserved.
//

import Foundation

class Product: NSObject, NSCoding {
    var name: String?
    var productImage: String?
    var cellImage: String?
    var price: Double?
    
    override init() {
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.name = aDecoder.decodeObjectForKey("name") as? String
        self.productImage = aDecoder.decodeObjectForKey("productImage") as? String
        self.cellImage = aDecoder.decodeObjectForKey("cellImage") as? String
        self.price = aDecoder.decodeObjectForKey("price") as? Double

        super.init()
    }
    
    func encodedWithCoder(aCoder: NSCoder){
        aCoder.encodeObject(name, forKey: "name")
        aCoder.encodeObject(name, forKey: "productImage")
        aCoder.encodeObject(cellImage, forKey: "cellImage")
        aCoder.encodeObject(name, forKey: "price")
    }
    
    class func archiveFilePath() -> String {
        let documentDirectory = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)[0]
        return documentDirectory.URLByAppendingPathComponent("cart.archive").path!
    }
    
    class func readOrderFromArchive() -> [Order]? {
        return NSKeyedUnarchiver.unarchiveObjectWithFile(archiveFilePath()) as? [Order]
    }
    
    class func saveOrdersToArchive(orders: [Order]) -> Bool {
        return NSKeyedArchiver.archiveRootObject(orders, toFile: archiveFilePath())
    }
}
