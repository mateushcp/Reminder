//
//  novareceira.swift
//  Reminder
//
//  Created by Mateus Henrique Coelho de Paulo on 09/12/24.
//

import Foundation
import UIKit

import UIKit

class NovaReceitaViewController: UIViewController {
    
    // Instância da view personalizada
    private let novaReceitaView = NovaReceitaView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupActions()
    }
    
    private func setupView() {
        // Configurações básicas da ViewController
        view.backgroundColor = Colors.gray800
        
        // Adiciona a `NovaReceitaView` à hierarquia de views
        view.addSubview(novaReceitaView)
        
        // Define as constraints da `NovaReceitaView` para ocupar a tela inteira
        novaReceitaView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            novaReceitaView.topAnchor.constraint(equalTo: view.topAnchor),
            novaReceitaView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            novaReceitaView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            novaReceitaView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    private func setupActions() {
        // Configura a ação do botão de voltar
        novaReceitaView.backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        
        // Configura a ação do botão de adicionar
        novaReceitaView.addButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
    }
    
    @objc private func backButtonTapped() {
        // Retorna para a tela anterior
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func addButtonTapped() {
        // Exemplo de ação para o botão "Adicionar"
        let remedy = novaReceitaView.remedyInput.getText()
        let time = novaReceitaView.timeInput.getText()
        let recurrence = novaReceitaView.recurrenceInput.getText()
        
        print("Remédio: \(remedy)")
        print("Horário: \(time)")
        print("Recorrência: \(recurrence)")
        
        // Aqui você pode implementar a lógica de salvar ou enviar os dados
    }
}


class NovaReceitaView: UIView {
    let backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "arrow.left"), for: .normal)
        button.tintColor = Colors.gray100
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = Typography.heading
        label.textColor = Colors.primaryRedBase
        label.text = "Nova receita"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = Typography.body
        label.textColor = Colors.gray200
        label.text = "Adicione a sua prescrição médica para receber lembretes de quando tomar seu medicamento"
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let remedyInput = CustomInputView(title: "Remédio", placeholder: "Nome do medicamento")
    let timeInput = CustomInputView(title: "Horário", placeholder: "00:00")
    let recurrenceInput = CustomInputView(title: "Recorrência", placeholder: "Selecione")
    let takeNowCheckbox = CustomCheckboxView(title: "Tomar agora")
    
    let addButton: UIButton = {
        let button = UIButton()
        button.setTitle("+ Adicionar", for: .normal)
        button.titleLabel?.font = Typography.subHeading
        button.backgroundColor = Colors.primaryRedBase
        button.layer.cornerRadius = 12
        button.setTitleColor(Colors.gray800, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = Colors.gray800
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        
        addSubview(backButton)
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        addSubview(remedyInput)
        addSubview(timeInput)
        addSubview(recurrenceInput)
        addSubview(addButton)
        addSubview(takeNowCheckbox)
        setupConstraints()
    }
    
    private func setupConstraints() {

        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: Metrics.small),
            backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.hight),
            backButton.widthAnchor.constraint(equalToConstant: 24),
            backButton.heightAnchor.constraint(equalToConstant: 24),
            
            titleLabel.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: Metrics.hight),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.hight),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Metrics.small),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.hight),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.hight),
            
            remedyInput.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: Metrics.medium),
            remedyInput.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.hight),
            remedyInput.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.hight),
            
            timeInput.topAnchor.constraint(equalTo: remedyInput.bottomAnchor, constant: Metrics.medium),
            timeInput.leadingAnchor.constraint(equalTo: remedyInput.leadingAnchor),
            timeInput.trailingAnchor.constraint(equalTo: remedyInput.trailingAnchor),
            
            recurrenceInput.topAnchor.constraint(equalTo: timeInput.bottomAnchor, constant: Metrics.medium),
            recurrenceInput.leadingAnchor.constraint(equalTo: remedyInput.leadingAnchor),
            recurrenceInput.trailingAnchor.constraint(equalTo: remedyInput.trailingAnchor),
            
            takeNowCheckbox.topAnchor.constraint(equalTo: recurrenceInput.bottomAnchor, constant: Metrics.medium),
            takeNowCheckbox.leadingAnchor.constraint(equalTo: recurrenceInput.leadingAnchor),
            takeNowCheckbox.trailingAnchor.constraint(equalTo: recurrenceInput.trailingAnchor),
            
            addButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.hight),
            addButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.hight),
            addButton.heightAnchor.constraint(equalToConstant: 56),
            addButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Metrics.hight)
        ])
    }
}
