//
//  UIView+superview.swift
//  Brazil
//
//  Created by Milind Trivedi on 27/03/24.
//

import UIKit

extension UIView {
    func superview<T>(of type: T.Type) -> T? {
        return superview as? T ?? superview?.superview(of: type)
    }
}
