//
//  LazyView.swift
//  Brazil
//
//  Created by Milind Trivedi on 27/03/24.
//

import Foundation
import SwiftUI


struct LazyView <T: View> : View {
    var view: () -> T
    var body: some View {
        self.view()
    }
    
}
