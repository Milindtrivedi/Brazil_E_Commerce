//
//  SplashVC.swift
//  Brazil
//
//  Created by Milind Trivedi on 27/03/24.
//

import SwiftUI

struct SplashVC: View {
    
    @State private var MoveToDashboard: Bool = false
    @AppStorage("isOnboarding") var isOnboarding : Bool = false
    @AppStorage("selectedTab") var selectedTab : String = "Dashboard"
    
    
    @State var tabBarPages: [TabBarPage] = [TabBarPage(page: Dashboard(), icon: "home", tag: "Main", color: Color("txtclr")),
                                            TabBarPage(page: QRView(), icon: "qr", tag: "Qr", color: .clear),
                                 TabBarPage(page: FavouriteView(), icon: "fav", tag: "Saved", color: Color("txtclr"))]
    
    var body: some View {
        NavigationStack {
            ZStack {
            }.hidden()
                .onAppear {
                    self.MoveToDashboard = true
                    selectedTab = "Dashboard"
                }
                .navigationDestination(isPresented: $MoveToDashboard) {
                    if isOnboarding {
                        //LoginView()
//                            .navigationBarBackButtonHidden()
//                            .navigationBarHidden(true)
                    } else {
                        TabBarView(pages: $tabBarPages)
                            .navigationBarBackButtonHidden()
                            .navigationBarHidden(true)
                    }
                }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct SplashVC_Previews: PreviewProvider {
    static var previews: some View {
        SplashVC()
    }
}
