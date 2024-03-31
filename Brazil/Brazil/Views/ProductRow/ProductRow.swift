//
//  ProductRow.swift
//  Brazil
//
//  Created by Milind Trivedi on 27/03/24.
//

import SwiftUI

struct ProductRow: View {
    var body: some View {
        HStack(spacing: 16.0) {
            
            ZStack {
                Color(hex: "DED8CE")
                Image("product")
                    .resizable()
                    .frame(width: 75.0, height: 75.0)
                    .scaledToFill()
                
            }.frame(width: 100.0, height: 100.0)
                .cornerRadius(20.0)
               
            
            
            
            VStack(alignment: .leading, spacing: 16.0) {
                Text("The Ordinary")
                    .font(.title3)
                    .foregroundColor(Color(hex:"A6A29E"))
                    .lineLimit(1)
                Text("Hyaluronic acid serum")
                    .font(.title2)
                    .bold()
                    .foregroundColor(Color(hex:"2E2C28"))
                    .lineLimit(1)
            }
            
        }
        .padding(.horizontal)
        .padding(.vertical)
        .background(Material.thin)
    }
}

struct ProductRow_Previews: PreviewProvider {
    static var previews: some View {
        ProductRow()
    }
}
