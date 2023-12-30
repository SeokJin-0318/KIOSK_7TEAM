//
//  ViewController.swift
//  KIOSK
//
//  Created by 석진 on 12/27/23.

//  Payment 기능 추가 by 지웅 on 12/28/23.
//  Category 기능 추가 by 洪立妍  on 12/28/23.

import UIKit

// ViewController를 구성하는 요소는 1.카테고리(UIStackView), 2.메뉴화면(UICollectionView), 3.장바구니(UITableView), 취소/결제(UIButton)
class ViewController: UIViewController {
    
    @IBOutlet weak var menuCollection: UICollectionView!
    @IBOutlet weak var CartTableView: UITableView!
    
    @IBOutlet weak var totalAmountLabel: UILabel!
    @IBOutlet weak var totalPriceLabel: UILabel!
    
    var totalAmount: Int = 0, totalPrice: Int = 0
    
    
    
    // 1. 카테고리(UIStackView) : 임시로 UIButton만으로 구성하였음.
    // 각 버튼들은 HamburgerMenus, SideMenus, DrinkMenus 중 해당하는 Structure를 불러와 menus에 할당하고, menuCollection(메뉴화면)을 reload한다.
    // 2.메뉴화면(이미지, 이름, 가격)을 구성하는 menuCollection(UICollectionView)과
    // 3.장바구니(이름, 수량, 가격, +,-버튼)을 구성하는 cart(UITableView).
    // 4.결제여부를 결정하는 UIButton과 UIAlertController.
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menuCollection.delegate = self
        menuCollection.dataSource = self
        CartTableView.delegate = self
        CartTableView.dataSource = self
        
        let categoryBar = createCategoryBar()
        view.addSubview(categoryBar)
        categoryBar.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            categoryBar.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
            categoryBar.leadingAnchor.constraint(equalTo: view.leadingAnchor ,constant: 40),
            categoryBar.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -40),
            categoryBar.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        self.refreshLabel()
    }
    
  private func createCategoryBar() -> UIStackView {
    let stackView = UIStackView()
    stackView.axis = .horizontal
    stackView.distribution = .fillEqually
    stackView.spacing = 10
    let categories = ["햄버거", "사이드", "음료"]
      
    for category in categories {
      let button = UIButton(type: .system)
      button.setTitle(category, for: .normal)
      button.addTarget(self, action: #selector(categoryButtonTapped(_:)), for: .touchUpInside)
      stackView.addArrangedSubview(button)
    }
      
    return stackView
  }
    
  @objc private func categoryButtonTapped(_ sender: UIButton) {
    if let category = sender.title(for: .normal) {
      print("Selected category: \(category)")
    }
  }
    
    func refreshLabel()     // 총 수량과 총 가격 반영 함수
    {
        self.totalAmountLabel.text = String(self.totalAmount) + "개"
        self.totalPriceLabel.text = String(self.totalPrice) + "원"
    }
    
    // 취소하기 버튼 함수
    @IBAction func cancelAction(_ sender: UIButton) {
        handleCancel()
    }

    // 결제하기 버튼 함수
    @IBAction func payAction(_ sender: UIButton) {
        // totalPrice 값 필요.
        handlePay(totalAmount: 0)
    }

    // 취소하기 버튼 함수
    func handleCancel() {
        let alert = UIAlertController(title: "주문을 취소하시겠습니까?", message: "장바구니의 메뉴들이 사라집니다.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "취소", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "확인", style: .destructive, handler: { _ in
            // 장바구니 비우기 코드
        }))
        self.present(alert, animated: true)
    }

    // 결제하기 버튼 함수
    func handlePay(totalAmount: Int) {
        let alert = UIAlertController(title: "주문하시겠습니까?", message: "결제금액은 총 \(totalAmount)원 입니다.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "취소", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "확인", style: .default, handler: { _ in
            // 결제 진행 코드
        }))
        self.present(alert, animated: true)
    }
    
}
