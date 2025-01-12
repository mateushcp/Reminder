//
//  HomeFlowDelegate.swift
//  Reminder
//
//  Created by Mateus Henrique Coelho de Paulo on 01/10/24.
//

import Foundation

public protocol HomeFlowDelegate: AnyObject {
    func navigateToRecipes()
    func navigateToMyRecipes()
    func logout()
}
