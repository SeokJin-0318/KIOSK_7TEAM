//
//  CartCell.swift
//  KIOSK
//
//  Created by 석진 on 12/29/23.
//

import UIKit

class CartCell: UITableViewCell {
    
    @IBOutlet weak var cartMenuNameLabel: UILabel!
    @IBOutlet weak var cartMenuAmountLabel: UILabel!
    @IBOutlet weak var cartMenuPriceLabel: UILabel!
    
    var cart: Cart?
    
    // Cart 속성 설정
    func setCart(_ cart: Cart) {
            self.cart = cart
            self.cartMenuAmount = cart.menuAmount
            self.cartMenuPrice = cart.menuPrice
            self.refreshLabel()
        }
    
    var cartMenuAmount: Int = 0, cartMenuPrice = 0      // 각 셀의 수량, 가격
    
    
    func setMenuInfo(menuAmount: Int, menuPrice: Int) {
            self.cartMenuAmount = menuAmount
            self.cartMenuPrice = menuPrice
            refreshLabel()
        }
    
    
    @IBAction func amountIncrease(_ sender: Any) {      // 메뉴 수량 증가
        self.cartMenuAmount += 1
        self.cartMenuPrice = self.cartMenuPrice * self.cartMenuAmount
        self.refreshLabel()
    }
    
    @IBAction func amountDecrease(_ sender: Any) {      // 메뉴 수량 감소
        if self.cartMenuAmount > 0 {
            self.cartMenuAmount -= 1
            self.cartMenuPrice = self.cartMenuPrice * self.cartMenuAmount
            self.refreshLabel()
        }
    }
    
    func refreshLabel()
    {
        self.cartMenuAmountLabel.text = "\(self.cartMenuAmount)개"
        self.cartMenuPriceLabel.text = "\(self.cartMenuPrice)원"
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
