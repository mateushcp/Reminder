//
//  User.swift
//  Reminder
//
//  Created by Mateus Henrique Coelho de Paulo on 12/08/24.
//

import Foundation

struct User: Codable {
    let email: String
    let isUserSaved: Bool
    let hasFaceIdEnabled: Bool
}
