//
//  ProductDetails.swift
//  Brazil
//
//  Created by Milind Trivedi on 27/03/24.
//

import SwiftUI

struct ProductDetails: View {
    
    @Environment(\.presentationMode) var presentationMode : Binding<PresentationMode>
    let categories = ["Ingredients", "Reviews", "Alternatives"]
    @State private var selectedCategory = "Ingredients"
    @Binding var product : Products?
    @Binding var isPresented : Bool
    @State var reload = false
    
    var body: some View {
        ScrollView(showsIndicators: false){
            ZStack(alignment: .top) {
                VStack(spacing: 30.0) {
                    ProductDetailsHeaderView(isPresented: $isPresented)
                        .padding(.top, 50)
                        .padding(.horizontal)
                        .zIndex(1)
                    
                    ProductDetailsImageView(product: $product)
                    
                    
                    if product?.imageName == "3" || product?.imageName == "2" {
                        DetailsInfoVIew()
                            .padding(.top, 80)
                    } else {
                        DetailsInfoVIew()
                            .padding(.top, 20)
                    }

                    
                    ZStack {
                        VStack {
                            
                            ProductDetailsBottomTextView(product: $product)
                            
                            AnimatedButtonLine(items: categories,selectedItem: selectedCategory,itemSelected: { category in
                                selectedCategory = category },fontSize: 18,fontWeight: .medium,selectedColor: Color(hex: "393733"),unselectedColor: Color(hex: "AEAAA7"), tappedChanged: $reload)
                            
                            ProductDetailschartscreen()
                            
                            Text("")
                                .frame(height: 40)
                            
                        }
                    }   .frame(width: UIScreen.screenWidth)
                        .background(.white)
                        .clipShape(RoundedCorner(corners: [.topLeft, .topRight], radius: 16.0))

                }
            }
        }.ignoresSafeArea()
            .background(Color(hex: "DED8CE"))
    }
}

struct ProductDetails_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetails(product: .constant(Products(imageName: "5", name: "Milind Trivedi")), isPresented: .constant(true), reload: true)
    }
}


struct RoundedCorner: Shape {
    var corners: UIRectCorner
    var radius: CGFloat
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        
        return Path(path.cgPath)
    }
}
