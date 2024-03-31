//
//  BrazilApp.swift
//  Brazil
//
//  Created by Milind Trivedi on 27/03/24.
//

import SwiftUI

@main
struct BrazilApp: App {
    var body: some Scene {
        WindowGroup {
            SplashVC()
                .preferredColorScheme(.light)
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
        }
    }
}
