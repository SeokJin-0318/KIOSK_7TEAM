//
//  ViewController.swift
//  KIOSK
//
//  Created by 석진 on 12/27/23.

//  Payment 기능 추가 by 지웅 on 12/28/23.

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {

        super.viewDidLoad()
    
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
