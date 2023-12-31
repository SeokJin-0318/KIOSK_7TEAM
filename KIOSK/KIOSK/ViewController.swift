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
    var cartList: [Cart] = []
    
    
    
    
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
        
        self.refreshTotalLabel()        // 최초에 총 수량과 총 가격을 0원으로 출력
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
        
            switch category {
            case "햄버거":
                menus = HamburgerMenus()
            case "사이드":
                menus = SideMenus()
            case "음료":
                menus = DrinkMenus()
            default:
                break
            }
            
            menuCollection?.reloadData()
        }
    }
    
    
    // CollectionViewCell에서 선택한 셀의 메뉴 이름과 가격을 전달
    func addToCart(menuName: String, menuPrice: Int) {
        let cartItem = Cart(index: cartList.count, menuName: menuName, menuAmount: 1, menuPrice: menuPrice)
            cartList.append(cartItem)
            totalAmount += 1
            totalPrice += menuPrice
            CartTableView.reloadData() // 테이블 뷰 갱신
            refreshTotalLabel() // 총 수량 및 가격 갱신
        }
    
    // 총 수량과 총 가격 반영 함수
    func refreshTotalLabel(){
        self.totalAmountLabel.text = "\(self.totalAmount)개"
        self.totalPriceLabel.text = "\(self.totalPrice)원"
    }
    
    // 취소하기 버튼 함수
    @IBAction func cancelAction(_ sender: UIButton) {
        handleCancel()
    }

    // 결제하기 버튼 함수
    @IBAction func payAction(_ sender: UIButton) {
        // totalPrice 값 필요.
        handlePay()
    }
    
    // 주문내역 제거 함수
    func clearCart() {
        cartList.removeAll()
        CartTableView.reloadData()
        totalAmount = 0
        totalPrice = 0
        refreshTotalLabel() // 총 수량 및 가격 갱신
    }

    // 취소하기 버튼 함수
    func handleCancel() {
        let alert = UIAlertController(title: "주문을 취소하시겠습니까?", message: "장바구니의 메뉴들이 사라집니다.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "취소", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "확인", style: .destructive, handler: { _ in
            self.clearCart()
        }))
        self.present(alert, animated: true)
    }

    // 결제하기 버튼 함수
    func handlePay() {
        let alert = UIAlertController(title: "주문하시겠습니까?", message: "결제금액은 총 \(totalPrice)원 입니다.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "취소", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "확인", style: .default, handler: { _ in
            // 결제 진행 코드
        }))
        self.present(alert, animated: true)
    }
    
}

// 테이블 뷰 셀의 수량 변경 버튼을 눌렀을때 totalPrice와 totalAmount 변경
extension ViewController: CartCellDelegate {
    
    func addTotalPrice(for cell: CartCell) {
        totalAmount += 1
        totalPrice += cell.originPrice
            
        refreshTotalLabel()
    }
    
    func subtractionTotalPrice(for cell: CartCell) {
        totalAmount -= 1
        totalPrice -= cell.originPrice
            
        refreshTotalLabel()
    }
    
}

