//
//  TabView.swift
//  Brazil
//
//  Created by Milind Trivedi on 27/03/24.
//

import SwiftUI

struct TabBarView: View {
    
    
    @AppStorage("selectedTab") var selectedTab : String = "Dashboard"
    @State var isQRTapped = false
    @Binding var pages: [TabBarPage]
    init(pages: Binding<[TabBarPage]>) {
        UITabBar.appearance().isHidden = true
        self._pages = pages
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            
            TabView(selection: $selectedTab) {
                
                ForEach(pages) { item in
                    AnyView(_fromValue: item.page)
                        .tabItem{
                            EmptyView()
                        }.tag(item.tag)
                }
            }
            
            HStack(spacing: 16) {
                ForEach(pages) { item in
                    Button(action: {
                        self.selectedTab = item.tag
                    }) {
                        
                            VStack(spacing: 0.0) {
                                
                               
                                    Image(item.icon)
                                        .frame(width: 20.0, height: 20.0)
                                        .foregroundColor(item.color)
                                        .imageScale(.large)
                                        .padding(7)
                                    
                                
                                
                               
                                    Text(item.tag)
                                        .font(.system(size:10
                                                      ,weight: .regular))
                                        .foregroundColor(item.color)
                                
                            }
        
                        
                    }
                    
                    .frame(maxWidth: UIScreen.screenWidth, minHeight: 60.0)
                    
                }
            }
            
            .background(Material.thin)
            .cornerRadius(16)
            
            
            Button {
                isQRTapped = true
            } label: {
                ZStack {
                    Rectangle()
                        .frame(width: 80.0,height: 80.0)
                        .foregroundColor(Color("txtclr"))
                        .cornerRadius(25)
                        
                    Image("qr")
                        .foregroundColor(.white)
                        .scaledToFill()
                        .imageScale(.large)
                }
                .padding(-10)
            }
            
            .navigationDestination(isPresented: $isQRTapped) {
                QRView()
                    .navigationBarHidden(true)
                    .navigationBarBackButtonHidden(true)
            }
            
        }
        .padding()
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView(pages: .constant([TabBarPage(page: Dashboard(), icon: "house", tag: "Main", color: .black),
                                     TabBarPage(page: QRView(), icon: "qrcode", tag: "Qr", color: .blue),
                                     TabBarPage(page: FavouriteView(), icon: "heart", tag: "Saved", color: .gray)]))
    }
}


struct TabBarPage: Identifiable {
    var id = UUID()
    var page: Any
    var icon: String
    var tag: String
    var color: Color
}
