//
//  UIFont+Extension.swift
//  SpaceXApp
//
//  Created by Mohamed Mahmoud on 15/02/2023.
//

import UIKit

enum FontFamily {
    case regular(size: CGFloat)
    case thin(size: CGFloat)
    case bold(size: CGFloat)
}
extension UIFont {
    class func getFont(family: FontFamily) -> UIFont {
        switch family {
        case let .bold(size):
            return UIFont(name: "Lato-Bold", size: size) ?? UIFont()
        case let .thin(size):
            return UIFont(name: "Lato-Thin", size: size) ?? UIFont()
        case let .regular(size):
            return UIFont(name: "Lato-Regular", size: size) ?? UIFont()
        }
    }
}
