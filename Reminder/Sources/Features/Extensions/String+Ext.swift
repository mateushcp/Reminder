//
//  String+Ext.swift
//  Reminder
//
//  Created by Mateus Henrique Coelho de Paulo on 13/07/24.
//

import Foundation

extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
