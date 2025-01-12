//
//  MyReceiptsViewController.swift
//  Reminder
//
//  Created by Mateus Henrique Coelho de Paulo on 12/01/25.
//

import Foundation
import UIKit

class MinhasReceitasViewController: UIViewController {
    let contentView: MinhasReceitasView
    
    init(contentView: MinhasReceitasView) {
        self.contentView = contentView
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        view.addSubview(contentView)
        view.backgroundColor = Colors.gray800
        contentView.delegate = self
        setupConstraints()
    }
    
    private func setupConstraints() {
        contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: view.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension MinhasReceitasViewController: MinhasReceitasViewDelegate {
    func didTapBackButton() {
        navigationController?.popViewController(animated: true)
    }
    
    func didTapAddButton() {
        // Implementar navegação ou ação para adicionar nova receita
    }
}
