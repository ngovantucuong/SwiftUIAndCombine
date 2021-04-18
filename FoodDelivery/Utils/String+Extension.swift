//
//  String+Extension.swift
//  Login
//
//  Created by cuongnvt on 3/18/21.
//

import UIKit

extension String {
    func checkInValidateInput() -> Bool {
        return self.count > 0 && self.count < 4
    }
}
