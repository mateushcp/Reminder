//
//  MyReceiptsFlowDelegate.swift
//  Reminder
//
//  Created by Mateus Henrique Coelho de Paulo on 12/01/25.
//

import Foundation

public protocol MyReceiptsFlowDelegate: AnyObject {
    func goToNewReceipts()
    func popScreen()
}
