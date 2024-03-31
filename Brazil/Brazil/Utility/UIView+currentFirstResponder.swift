//
//  UIView+currentFirstResponder.swift
//  Brazil
//
//  Created by Milind Trivedi on 27/03/24.
//

import Foundation

import UIKit

extension UIView {
    func currentFirstResponder() -> UIResponder? {
        if self.isFirstResponder {
            return self
        }
        
        for view in self.subviews {
            if let responder = view.currentFirstResponder() {
                return responder
            }
        }
        
        return nil
     }
}
