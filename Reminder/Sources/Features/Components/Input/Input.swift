//
//  Input.swift
//  Reminder
//
//  Created by Mateus Henrique Coelho de Paulo on 10/12/24.
//

import Foundation
import UIKit

public class Input: UIView {
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = Typography.label
        label.textColor = Colors.gray100
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let textField: UITextField = {
        let textField = UITextField()
        textField.font = Typography.input
        textField.textColor = Colors.gray100
        textField.borderStyle = .roundedRect
        textField.backgroundColor = Colors.gray800
        textField.layer.borderWidth = 1
        textField.layer.borderColor = Colors.gray400.cgColor
        textField.layer.cornerRadius = 8
        textField.translatesAutoresizingMaskIntoConstraints = false

        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 0))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        textField.rightView = paddingView
        textField.rightViewMode = .always

        return textField
    }()

    init(title: String, placeholder: String) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false

        titleLabel.text = title
        textField.placeholder = placeholder
        configurePlaceholder(placeholder: placeholder)

        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configurePlaceholder(placeholder: String) {
        textField.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor: Colors.gray200])
    }

    private func setupView() {
        addSubview(titleLabel)
        addSubview(textField)

        setupConstraints()
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: 85),

            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),

            textField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Metrics.small),
            textField.leadingAnchor.constraint(equalTo: leadingAnchor),
            textField.trailingAnchor.constraint(equalTo: trailingAnchor),
            textField.heightAnchor.constraint(equalToConstant: 56)

        ])
    }

    func getText() -> String {
        return textField.text ?? ""
    }

}
