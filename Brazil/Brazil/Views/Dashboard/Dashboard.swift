//
//  ContentView.swift
//  Brazil
//
//  Created by Milind Trivedi on 27/03/24.
//

import SwiftUI

struct Dashboard: View {
    
    @State var pushview = false
    let categories = ["All", "Face", "Hair", "Nails", "Body"]
    @State private var selectedCategory = "All"
    @State var reload = false
    
    @State var ProductsArr : [Products] = [Products(imageName: "1", name: "Multi-Peptide Eye Serum"), Products(imageName: "2", name: "Natural Moisturizing Factors + PhytoCeramides"), Products(imageName: "3", name: "Glucoside Foaming Cleanser"), Products(imageName: "4", name: "Aloe 2% + NAG 2% Solution"), Products(imageName: "5", name: "Multi-Peptide + HA Serum")]
    @State private var TappedProduct : Products?
    @State private var searchText = ""
    
    
    var filteredProductsList: [Products] {
        
        var products = ProductsArr
        if searchText.isEmpty {
            products = ProductsArr
        } else {
            products = ProductsArr.filter {
                $0.name.localizedCaseInsensitiveContains(searchText.trimmingCharacters(in: .whitespaces))
            }
        }
        return products
    }
    
    
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                HStack {
                    VStack(spacing: 8.0) {
                        
                        HStack {
                            Text("Welcome back,")
                                .font(.title3)
                                .foregroundColor(Color(hex:"A6A29E"))
                                .lineLimit(1)
                            
                                .multilineTextAlignment(.leading)
                            Spacer()
                        }
                        HStack {
                            Text("Milind!")
                                .font(.title)
                                .bold()
                                .foregroundColor(Color(hex:"2E2C28"))
                                .lineLimit(1)
                                .multilineTextAlignment(.leading)
                            
                            
                            
                            
                            Spacer()
                            
                        }
                        
                        
                    }
                    
                    ZStack {
                        Image(systemName: "person.circle.fill")
                            .resizable()
                            .frame(width: 50.0, height: 50.0)
                            .overlay(
                                ZStack {
                                    Circle()
                                        .fill(Color(hex: "CDBFA5"))
                                        .frame(width: 20, height: 20)
                                        .overlay(
                                            Circle()
                                                .stroke(Color.white, lineWidth: 3)
                                        )
                                }
                                    .offset(x: 15, y: -15)
                            )
                    }
                    
                    
                    
                    Spacer()
                }.padding(.vertical)
                
                SearchView(searchText: $searchText)
                    .padding(.vertical)
                
                AnimatedButtonLine(items: categories,selectedItem: selectedCategory,itemSelected: { category in
                    selectedCategory = category },fontSize: 18,fontWeight: .medium,selectedColor: Color(hex: "393733"),unselectedColor: Color(hex: "AEAAA7"), tappedChanged: $reload)
                
                
                HStack {
                    Text("Top 10 safest sunscreens")
                        .font(.title2)
                        .bold()
                        .foregroundColor(Color(hex:"2E2C28"))
                        .lineLimit(1)
                        .multilineTextAlignment(.leading)
                    
                    
                    
                    
                    Spacer()
                    
                    Text("See all")
                        .font(.title3)
                        .foregroundColor(Color(hex:"A6A29E"))
                        .lineLimit(1)
                    
                        .multilineTextAlignment(.leading)
                    
                    
                }
                .padding(.vertical)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 16.0) {
                        ForEach(filteredProductsList) { pros in
                            DashboardRow(product: pros)
                                .frame(width: UIScreen.screenWidth * 0.7)
                                .onTapGesture(count: 1) {
                                    pushview = true
                                    TappedProduct = pros
                                }
                        }
                    }
                    
                }.frame(height: UIScreen.screenHeight * 0.45)
                    .id(reload ? UUID().uuidString : "")
                
                HStack {
                    Text("Articles")
                        .font(.title2)
                        .bold()
                        .foregroundColor(Color(hex:"2E2C28"))
                        .lineLimit(1)
                        .multilineTextAlignment(.leading)
                    
                    
                    
                    
                    Spacer()
                    
                    Text("See all")
                        .font(.title3)
                        .foregroundColor(Color(hex:"A6A29E"))
                        .lineLimit(1)
                    
                        .multilineTextAlignment(.leading)
                    
                    
                    
                }
                .padding(.vertical)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 16.0) {
                        ForEach(ProductsArr) { pros in
                            
                            DashboardRow(product: pros)
                                .frame(width: UIScreen.screenWidth * 0.7)
                        }
                    }
                    
                }.frame(height: UIScreen.screenHeight * 0.45)
                
                
                
                HStack {
                    
                    
                    
                    
                }.frame(height: 50.0)
                    .padding(.vertical)
            }
            //.padding()
            
        }//.ignoresSafeArea()
        .onChange(of: reload) { newValue in
            ProductsArr.shuffle()
            reload = false
        }
        
        .navigationDestination(isPresented: $pushview) {
            ProductDetails(product: $TappedProduct, isPresented: $pushview)
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Dashboard()
    }
}


struct SearchView: View {
    @Binding var searchText: String
    
    var body: some View {
        ZStack {
            HStack {
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                        .padding(.horizontal, 8)
                    TextField("Search Product", text: $searchText)
                        .foregroundColor(.black)
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.white)
                        .shadow(color: Color.gray.opacity(0.2), radius: 6, x: 0, y: 0)
                )
                
                Button(action: {
                    // Filter button action
                }, label: {
                    Image(systemName: "line.3.horizontal")
                        .foregroundColor(.black)
                        .font(.system(size: 24))
                })
                .padding(.leading, 8)
            }
            
        }
    }
}

