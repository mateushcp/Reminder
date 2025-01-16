//
//  MyReceiptsViewModel.swift
//  Reminder
//
//  Created by Mateus Henrique Coelho de Paulo on 13/01/25.
//

import Foundation
import UserNotifications

class MyReceiptsViewModel {
    func fetchData() -> [Medicine] {
        return DBHelper.shared.fetchReceipts()
    }

    func deleteReceipt(byId id: Int) {
        DBHelper.shared.deleteReceipt(byId: id)
    }

    func removeNotifications(for remedy: String) {
        let center = UNUserNotificationCenter.current()
        let identifiers = (0..<6).map { "\(remedy)-\($0)" }
        center.removePendingNotificationRequests(withIdentifiers: identifiers)
        print("Notificacoes para \(identifiers) removidas")

    }
}
