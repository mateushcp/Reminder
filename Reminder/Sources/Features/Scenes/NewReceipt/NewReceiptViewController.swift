//
//  NewReceipt.swift
//  Reminder
//
//  Created by Mateus Henrique Coelho de Paulo on 09/12/24.
//

import Foundation
import UIKit
import Lottie
import CoreFramework

class NewReceiptViewController: UIViewController {
    private let newReceiptView = NewReceiptView()
    private let viewModel = NewReceiptViewModel()

    private let succesAnimationView: LottieAnimationView = {
        let animationView = LottieAnimationView(name: "success")
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .playOnce
        animationView.animationSpeed = 1.0
        animationView.translatesAutoresizingMaskIntoConstraints = false
        animationView.isHidden = true
        return animationView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupActions()
        presentOnboarding()
    }

    private func setupView() {
        view.backgroundColor = Colors.gray800
        view.addSubview(newReceiptView)
        view.addSubview(succesAnimationView)
        self.navigationItem.hidesBackButton = true

        setupConstraints()
    }

    private func setupConstraints() {
        newReceiptView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            newReceiptView.topAnchor.constraint(equalTo: view.topAnchor),
            newReceiptView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            newReceiptView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            newReceiptView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            succesAnimationView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            succesAnimationView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

    private func setupActions() {
        newReceiptView.backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        newReceiptView.addButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
    }

    @objc
    private func addButtonTapped() {
        let remedy = newReceiptView.remedyInput.getText()
        let time = newReceiptView.timeInput.getText()
        let recurrence = newReceiptView.recurrenceInput.getText()
        let takeNow = newReceiptView.takeNowCheckbox.checkbox.getIsCheckedState()

        viewModel.addReceipt(remedy: remedy,
                             time: time,
                             recurrence: recurrence,
                             takeNow: takeNow)

        playSuccessAnimation()
        print("receita \(remedy) adicionada")
    }

    @objc
    private func backButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }

    private func clearFieldsAndResetButton() {
        newReceiptView.remedyInput.textField.text = ""
        newReceiptView.timeInput.textField.text = ""
        newReceiptView.timeInput.textField.text = ""
        newReceiptView.addButton.isEnabled = false
    }

    private func playSuccessAnimation() {
        succesAnimationView.isHidden = false
        succesAnimationView.play { [weak self] finished in
            if finished {
                self?.succesAnimationView.isHidden = true
                self?.clearFieldsAndResetButton()
            }
        }
    }

    private func presentOnboarding() {
        if !UserDefaultsManager.hasSeenOnboarding() {
            let onboardingView = OnboardingView()
            let steps = [
                (UIImage(named: "image1"), "Bem vindo ao Onboarding do Reminder"),
                (UIImage(named: "image2"), "É Facil cadaastrar seus remédios, tao simples quanto um click"),
                (UIImage(named: "image3"), "Selecione o horário da primeira dose, e as subsequentes"),
                (UIImage(named: "image4"), "Iremos te lembrar na hora de tomar o medicamento")
            ]
            onboardingView.presentOnboarding(on: view, with: steps)
            UserDefaultsManager.markOnboardingSeen()
        }
    }
}
