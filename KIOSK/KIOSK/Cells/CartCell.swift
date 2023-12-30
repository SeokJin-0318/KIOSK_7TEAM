//
//  CartCell.swift
//  KIOSK
//
//  Created by 석진 on 12/29/23.
//

import UIKit

class CartCell: UITableViewCell {
    
    @IBOutlet weak var menuName: UILabel!
    @IBOutlet weak var menuAmount: UILabel!
    @IBOutlet weak var menuPrice: UILabel!
    
    var cart: Cart?
    
    @IBAction func amountIncrease(_ sender: Any) {
    }
    
    @IBAction func amountDecrease(_ sender: Any) {
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }


}
