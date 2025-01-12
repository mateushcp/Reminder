//
//  NewReceiptViewModel.swift
//  Reminder
//
//  Created by Mateus Henrique Coelho de Paulo on 10/01/25.
//

import Foundation

class NewReceiptViewModel {
    func addReceipt(remedy: String, time: String, recurrence: String, takeNow: Bool) {
        DBHelper.shared.insertReceipt(remedy: remedy, time: time, recurrence: recurrence, takeNow: takeNow)
    }
}
