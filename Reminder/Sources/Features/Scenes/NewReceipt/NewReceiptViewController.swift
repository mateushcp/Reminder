//
//  NewReceipt.swift
//  Reminder
//
//  Created by Mateus Henrique Coelho de Paulo on 09/12/24.
//

import Foundation
import UIKit

class NewReceiptViewController: UIViewController {
    private let newReceiptView = NewReceiptView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
//        setupActions()
    }
    
    private func setupView() {
        view.backgroundColor = Colors.gray800
        view.addSubview(newReceiptView)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        newReceiptView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            newReceiptView.topAnchor.constraint(equalTo: view.topAnchor),
            newReceiptView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            newReceiptView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            newReceiptView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
}
