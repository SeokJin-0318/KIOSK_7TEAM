//
//  MyCollectionViewCell.swift
//  KIOSK
//
//  Created by t2023-m0026 on 12/29/23.
//

import UIKit
// CollectionView를 위한 custom cell.
class MyCollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = String(describing: MyCollectionViewCell.self)
    
    // custom cell은 메뉴이름, 가격, 이미지를 보여준다.
    @IBOutlet weak var menuName: UILabel!
    @IBOutlet weak var menuPrice: UILabel!
    @IBOutlet weak var menuImage: UIImageView!
    
    // custom cell이 포함하는 요소들의 형식지정. 여기서는 가격에 콤마(,) 삽입.
    func setMenu(menuTitle: String, price: Int, image: UIImage) {
        let numberFormatter : NumberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        menuName.text = menuTitle
        menuPrice.text = numberFormatter.string(for: price)
        menuImage.image = image
    }
}
