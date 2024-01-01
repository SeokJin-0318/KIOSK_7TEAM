//
//  Cart.swift
//  KIOSK
//
//  Created by 석진 on 12/29/23.
//

import Foundation

struct Cart // TableViewCell에 필요한 변수
{
    var index: Int
    var menuName: String
    var menuAmount: Int
    var menuPrice: Int
}

protocol CartCellDelegate: AnyObject {
    func addTotalPrice(for cell: CartCell)       // 총 주문금액 더하기, 총 수량 업데이트
    func subtractionTotalPrice(for cell: CartCell)       // 총 주문금액 빼기, 총 수량 업데이트
}
