//
//  TableViewExtension.swift
//  KIOSK
//
//  Created by 석진 on 12/30/23.
//

import UIKit


extension ViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cartList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = CartTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CartCell
        cell.delegate = self
        let cartItem = cartList[indexPath.row]
        cell.cartMenuNameLabel.text = cartItem.menuName
        cell.cartMenuAmountLabel.text = "\(cartItem.menuAmount)개"
        cell.cartMenuPriceLabel.text = "\(cartItem.menuPrice)원"
        return cell
    }

}
