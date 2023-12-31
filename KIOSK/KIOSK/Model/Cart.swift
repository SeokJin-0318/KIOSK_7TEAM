//
//  Cart.swift
//  KIOSK
//
//  Created by 석진 on 12/29/23.
//

import Foundation

struct Cart
{
    var index: Int
    var menuName: String
    var menuAmount: Int
    var menuPrice: Int
}

protocol CartCellDelegate: AnyObject {
    func updateTotalPrice(for cell: CartCell)
}
