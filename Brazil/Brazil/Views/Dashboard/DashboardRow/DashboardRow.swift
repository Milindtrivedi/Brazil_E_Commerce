//
//  DashboardRow.swift
//  Brazil
//
//  Created by Milind Trivedi on 27/03/24.
//

import SwiftUI

struct DashboardRow: View {
    
    var product : Products 
    
    var body: some View {
        ZStack {
            VStack(spacing: 16.0) {
                
                Image(product.imageName)
                    .resizable()
                    .scaledToFit()
                
                HStack {
                    VStack(spacing: 16.0) {
                        
                        HStack {
                            Text("The Ordinary")
                                .font(.title3)
                                .foregroundColor(Color(hex:"A6A29E"))
                                .lineLimit(1)
                                .minimumScaleFactor(0.5)
                            
                                .multilineTextAlignment(.leading)
                            Spacer()
                        }
                        HStack {
                        Text(product.name)
                                .font(.system(size: 18.0))
                            .bold()
                            .foregroundColor(Color(hex:"2E2C28"))
                           
                            .multilineTextAlignment(.leading)
                            .minimumScaleFactor(0.5)
                            
                           
                            
                        Spacer()
                            
                        }
                        
                                                        
                    }.padding()

                    ZStack {
//                        Rectangle()
//                            .fill(Color(hex: "A3B58B"))
//                            .frame(width: 50, height: 50)
//                            .cornerRadius(8.0)
                        HStack(spacing: 0.0){
                            Text("4")
                                .font(.system(size: 28.0))
                                .bold()
                                .foregroundColor(.black)
                            Text("/5")
                                .font(.system(size: 18.0))
                                .foregroundColor(.black)
                        }
                    }
                    .padding()
                    Spacer()
                }
                .background(Material.thin)
                .cornerRadius(16)
                .padding()
                
                
                
            }
                
        }
        .background(Color(hex: "DED8CE")
            .cornerRadius(16))
    }
}

struct DashboardRow_Previews: PreviewProvider {
    static var previews: some View {
        DashboardRow(product: Products(imageName: "1", name: "cccc"))
    }
}
