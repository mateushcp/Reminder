//
//  LoginBottomSheetViewModel.swift
//  Reminder
//
//  Created by Mateus Henrique Coelho de Paulo on 04/08/24.
//

import Foundation
import Firebase

class LoginBottomSheetViewModel {
    var succesResult: ((String) -> Void)?
    var errorResult: ((String) -> Void)?

    func doAuth(usernameLogin: String, password: String) {
        print(usernameLogin)
        Auth.auth().signIn(withEmail: usernameLogin, password: password) { [weak self] _, error in
            if let error = error {
                self?.errorResult?("Erro ao realizar login, verifique as credenciais digitadas")
            } else {
                self?.succesResult?(usernameLogin)
            }

        }

    }
}
