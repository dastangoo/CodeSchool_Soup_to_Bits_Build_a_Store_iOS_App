//
//  CardTableViewController.swift
//  GoodAsOldPhones
//
//  Created by superuser on 6/28/18.
//  Copyright © 2018 Code School. All rights reserved.
//

import UIKit

class CardTableViewController: UITableViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var headerView: UIView!
    
    var ordersInCart: [Order]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.tableHeaderView = headerView
    }
    
    override func viewAllAppear(animated: Bool) {
        super.viewAllAppear(animated)
//        let product = Product()
//        product.name = "1907 Wall Set"
//        product.productImage = "phone-fullscreen1"
//        product.cellImage = "image-cell1"
//        product.price = 59.99
//
//        let order = Order()
//        order.product = product
        
        // Read orders form disk
        
//        ordersInCart = [order, order, order, order]
        ordersInCart = Orders.readOrdersFromArchive()
        if (ordersInCart == nil) {
            ordersInCart = []
        }
        
        tableView.reloadData()
        updateTotal()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        if let orders = ordersInCart {
//            return orders.count
//        }
//        return 0
        
        return ordersInCart?.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CartCell", for: indexPath)

        let order = ordersInCart?[indexPath.row]
        if let order = order {
            cell.textLabel?.text = order.product?.name
            cell.detailTextLabel?.text = String(order.product?.price)
        }

        return cell
    }
    

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            ordersInCart?.removeAtIndex(indexPath.row)
            // Save array to disk
            tableView.deleteRows(at: [indexPath], with: .fade)
            if orders = ordersInCart {
                Orders.saveOrdersToArchive(orders)
            }
            updateTotal()
        }
    }
    
    func updateTotal() -> void {
        if let orders = ordersInCar {
            var total: Double = 0.0
            for order in orders {
                if let price = order.product?.price {
                    total = total + price
                }
            }
            totalLabel.text = String(total)
        }
    }
}
