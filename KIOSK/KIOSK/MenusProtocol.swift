//
//  File.swift
//  KIOSK
//
//  Created by t2023-m0026 on 12/29/23.
//

import Foundation

// 구조체 HamburgerMenus, SideMenus, DrinkMenus가 준수하는 protocol.
// 메뉴이름은 배열로, 가격은 메뉴이름을 키(key)로 가지는 딕셔너리로 저장한다.
protocol LotteriaMenu {
    var menuNames: [String] { get }
    var menuPrices: [String : Int] { get }
}

// 각 메뉴들의 정보가 담긴 Structure들을 LotteriaMenu 프로토콜을 따르도록 해서, 변수 menus에 할당하는데 type casting(형변환)에서 자유롭게 하였음.
// 초기화면은 햄버거 리스트
var menus: LotteriaMenu = hamburgerMenus
