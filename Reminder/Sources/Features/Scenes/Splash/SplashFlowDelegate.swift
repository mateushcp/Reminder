//
//  SplashFlowDelegate.swift
//  Reminder
//
//  Created by Mateus Henrique Coelho de Paulo on 12/08/24.
//

import Foundation

public protocol SplashFlowDelegate: AnyObject {
    func openLoginBottomSheet()
    func navigateToHome()
}
