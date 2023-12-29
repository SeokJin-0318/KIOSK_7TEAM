//
//  ViewController.swift
//  KIOSK
//
//  Created by 석진 on 12/27/23.
//

import UIKit

// ViewController를 구성하는 요소는 1.카테고리(UIStackView), 2.메뉴화면(UICollectionView), 3.장바구니(UITableView), 취소/결제(UIButton)
class ViewController: UIViewController {
    
    // 1. 카테고리(UIStackView) : 임시로 UIButton만으로 구성하였음.
    // 각 버튼들은 HamburgerMenus, SideMenus, DrinkMenus 중 해당하는 Structure를 불러와 menus에 할당하고, menuCollection(메뉴화면)을 reload한다.
    @IBAction func buttonHamburger(_ sender: UIButton) {
        menus = HamburgerMenus()
        menuCollection.reloadData()
    }
    @IBAction func buttonSide(_ sender: UIButton) {
        menus = SideMenus()
        menuCollection.reloadData()
    }
    @IBAction func buttonDrink(_ sender: UIButton) {
        menus = DrinkMenus()
        menuCollection.reloadData()
    }
    
    // 2.메뉴화면(이미지, 이름, 가격)을 구성하는 menuCollection(UICollectionView)과
    // 3.장바구니(이름, 수량, 가격, +,-버튼)을 구성하는 cart(UITableView).
    // 4.결제여부를 결정하는 UIButton과 UIAlertController.
    @IBOutlet weak var menuCollection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menuCollection.delegate = self
        menuCollection.dataSource = self
    }


}

