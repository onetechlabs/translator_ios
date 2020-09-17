//
//  UIStackViewExt.swift
//  Translator
//
//  Created by Onetechlabs on 17/09/20.
//  Copyright © 2020 Onetechlabs. All rights reserved.
//

import Foundation
import UIKit

extension UIStackView {
    func addBackground(color: UIColor) {
        let subView = UIView(frame: bounds)
        subView.backgroundColor = color
        subView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        insertSubview(subView, at: 0)
    }
}
