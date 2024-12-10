//
//  LoginbottomSheetViewDelegate.swift
//  Reminder
//
//  Created by Mateus Henrique Coelho de Paulo on 22/07/24.
//

import Foundation
import UIKit

protocol LoginBottomSheetViewDelegate : AnyObject {
    func sendLoginData(user: String, password: String)
}
