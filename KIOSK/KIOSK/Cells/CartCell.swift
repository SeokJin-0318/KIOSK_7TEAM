//
//  CartCell.swift
//  KIOSK
//
//  Created by 석진 on 12/29/23.
//

import UIKit

class CartCell: UITableViewCell {
    
    weak var delegate: CartCellDelegate?
    
    @IBOutlet weak var cartMenuNameLabel: UILabel!
    @IBOutlet weak var cartMenuAmountLabel: UILabel!
    @IBOutlet weak var cartMenuPriceLabel: UILabel!
    
    var cart: Cart?
    var cartList: [Cart]?
    
    // Cart 속성 설정
    func setCart(_ cart: Cart) {
            self.cart = cart
            self.cartMenuAmount = cart.menuAmount
            self.cartMenuPrice = cart.menuPrice
            self.payPrice = cart.menuPrice * cart.menuAmount
            self.refreshLabel()
        }
    
    var cartMenuAmount: Int = 0, cartMenuPrice: Int = 0, payPrice: Int = 0      // 각 셀의 수량, 가격
    var cellIndex: Int = 0
    
    
    @IBAction func amountIncrease(_ sender: Any) {      // 메뉴 수량 증가
        self.cartMenuAmount += 1
        self.cartMenuPrice = 1000 * self.cartMenuAmount
        self.refreshLabel()
        delegate?.updateTotalPrice(for: self)
    }
    
    @IBAction func amountDecrease(_ sender: Any) {      // 메뉴 수량 감소
        if self.cartMenuAmount > 0 {    // 0개 미만으로 변경되지 않음
            self.cartMenuAmount -= 1
            self.cartMenuPrice = 1000 * self.cartMenuAmount
            self.refreshLabel()
            delegate?.updateTotalPrice(for: self)
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
