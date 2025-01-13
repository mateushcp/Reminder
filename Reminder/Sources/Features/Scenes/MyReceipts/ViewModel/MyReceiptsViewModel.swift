//
//  MyReceiptsViewModel.swift
//  Reminder
//
//  Created by Mateus Henrique Coelho de Paulo on 13/01/25.
//

import Foundation

class MyReceiptsViewModel {
    func fetchData() -> [Medicine] {
        return DBHelper.shared.fetchReceipts()
    }
}
