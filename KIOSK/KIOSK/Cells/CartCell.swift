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
    
    
    var cartMenuAmount: Int = 1, cartMenuPrice: Int = 0, originPrice: Int = 0      // 각 셀의 수량, 가격, 실제 계산할 가격 값
    
    @IBAction func amountIncrease(_ sender: Any) {      // 메뉴 수량 증가
        self.cartMenuAmount += 1
        self.cartMenuPrice = originPrice * self.cartMenuAmount
        self.refreshLabel()
        delegate?.addTotalPrice(for: self)
    }
    
    @IBAction func amountDecrease(_ sender: Any) {      // 메뉴 수량 감소
        if self.cartMenuAmount > 0 {    // 0개 미만으로 변경되지 않음
            self.cartMenuAmount -= 1
            self.cartMenuPrice = originPrice * self.cartMenuAmount
            self.refreshLabel()
            delegate?.subtractionTotalPrice(for: self)
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
