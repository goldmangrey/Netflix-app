//
//  Extension.swift
//  Goldflix
//
//  Created by Yeskendir on 05.08.2022.
//

import Foundation

extension String {
    func capitalizzeFirstLetter() -> String {
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
