//
//  FontUtils.swift
//  desafios-view-code
//
//  Created by Wallace Baldenebre on 04/12/21.
//

import Foundation
import UIKit

extension UIFont {

    public enum LatoType: String {
        case regular = "-regular"
        case bold = "-bold"
    }

    static func Lato(_ type: LatoType = .regular, size: CGFloat = UIFont.systemFontSize) -> UIFont {
        return UIFont(name: "lato\(type.rawValue)", size: size)!
    }

    var isBold: Bool {
        return fontDescriptor.symbolicTraits.contains(.traitBold)
    }
}
