//
//  File.swift
//  KIOSK
//
//  Created by t2023-m0026 on 12/29/23.
//

import UIKit

// MARK: - UICollectionView 관련 extension
extension ViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    // 메뉴화면의 Item개수(== cell의 개수)는
    // 각 Structure에 담긴 메뉴이름(Array)의 개수만큼 불러온다.
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menus.menuNames.count
    }
    
    // 각 셀에서 보여줄 데이터(메뉴이름, 가격, 이미지)는 카테고리 버튼으로 할당된 Structure에서 데이터를 불러온다.
    // ["메뉴이름"]에서 indexPath로 메뉴이름을,
    // ["메뉴이름": 가격]에서 메뉴이름을 key로 가격인 value를,
    // "메뉴이름"과 같은 파일 이름의 image를 Assets에서 불러온다. nil일 경우 기본값은 "더블클래식치즈버거"
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let menuCell =  collectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCell.reuseIdentifier, for: indexPath) as! MyCollectionViewCell
        
        let menuNames = menus.menuNames[indexPath.row]
        let menuPrices = Int(menus.menuPrices[menuNames] ?? 0)
        let menuImage = UIImage(named: menuNames) ?? UIImage(named: "더블클래식치즈버거")!
        
        menuCell.setMenu(menuTitle: menuNames, price: menuPrices, image: menuImage)
        return menuCell
    }
    
    
    func addToCart(name: String, price: Int) {
    }
    
    // menuCollection(UICollectionView)에서 사용자가 cell을 선택했을 때(사용자입력),
    // 선택한 cell의 메뉴이름과 가격을 함수 addToCart의 파라미터로 할당한다.
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedMenuName = menus.menuNames[indexPath.row]
        let selectedMenuPrice = Int(menus.menuPrices[selectedMenuName] ?? 0)
        print("You Tapped \(selectedMenuName)")
        print("\(selectedMenuName) is ₩\(selectedMenuPrice)")
        addToCart(name: selectedMenuName, price: selectedMenuPrice)
        collectionView.deselectItem(at: indexPath, animated: true)
    }
}
