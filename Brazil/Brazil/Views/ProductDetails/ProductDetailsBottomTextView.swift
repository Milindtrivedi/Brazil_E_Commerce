//
//  ProductDetailsBottomTextView.swift
//  Brazil
//
//  Created by Milind Trivedi on 27/03/24.
//

import SwiftUI

struct ProductDetailsBottomTextView: View {
    
    @Binding var product : Products?
    
    var body: some View {
        HStack {
            VStack(spacing: 16.0) {
                
                HStack {
                    Text("The Ordinary")
                        .font(.title3)
                        .foregroundColor(Color(hex:"A6A29E"))
                        .lineLimit(1)
                    
                        .multilineTextAlignment(.leading)
                    Spacer()
                }
                HStack {
                    Text(product?.name ?? "")
                    .font(.title)
                    .bold()
                    .foregroundColor(Color(hex:"2E2C28"))
                    .multilineTextAlignment(.leading)
                    //.minimumScaleFactor(0.2)
                    
                    
                   
                    
                Spacer()
                    
                }
                
                                                
                }

            ZStack {
                Rectangle()
                    .fill(Color(hex: "A3B58B"))
                    .frame(width: 50, height: 50)
                    .cornerRadius(8.0)
                HStack(spacing: 0.0){
                    Text("4")
                        .font(.system(size: 28.0))
                        .bold()
                        .foregroundColor(.white)
                    Text("/5")
                        .font(.system(size: 18.0))
                        .foregroundColor(.white)
                }
            }
            
            Spacer()
        }.padding()
    }
}

struct ProductDetailsBottomTextView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailsBottomTextView(product: .constant(Products(imageName: "1", name: "qweqweqweqwe")))
    }
}
