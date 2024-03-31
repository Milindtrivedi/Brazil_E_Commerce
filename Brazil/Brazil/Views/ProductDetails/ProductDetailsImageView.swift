//
//  ProductDetailsImageView.swift
//  Brazil
//
//  Created by Milind Trivedi on 27/03/24.
//

import SwiftUI

struct ProductDetailsImageView: View {
    
    @Binding var product : Products?
    
    
    var body: some View {
        ZStack {
            Circle()
                .fill(Color(hex: "CBBDA3"))
                .frame(width: 200, height: 200)
                
            
            if product?.imageName == "1" ||  product?.imageName == "5" || product?.imageName == "4" {
                Image(product?.imageName ?? "1")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 400, height: 150)
                    .padding(.top, -100)
            } else {
                Image(product?.imageName ?? "1")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 400, height: 150)
                    .padding(.top, 0)
            }
            
                
            
        }
        .zIndex(-1)
         
        
    }
}

struct ProductDetailsImageView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailsImageView(product: .constant(Products(imageName: "4", name: "ccc")))
    }
}
