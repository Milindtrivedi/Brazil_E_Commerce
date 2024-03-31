//
//  ProductDetailsHeaderView.swift
//  Brazil
//
//  Created by Milind Trivedi on 27/03/24.
//

import SwiftUI

struct ProductDetailsHeaderView: View {
    
    @Environment(\.presentationMode) var presentationMode : Binding<PresentationMode>
    @Binding var isPresented : Bool
    var body: some View {
        HStack {
            Button {
                presentationMode.wrappedValue.dismiss()
                //isPresented = false
            } label: {
                
                ZStack {
                    Color.white
                    Image(systemName: "multiply")
                    
                        .foregroundColor(.primary)
                    
                        .scaledToFit()
                    
                }
                .frame(width: 50.0,height: 50.0)
                .cornerRadius(25.0)
                
            }
            
            Spacer()
            
            Button {
                
                
                
            } label: {
                
                ZStack {
                    Color.white
                    Image(systemName: "heart")
                    
                        .foregroundColor(.primary)
                    
                        .scaledToFit()
                    
                }
                .frame(width: 50.0,height: 50.0)
                .cornerRadius(25.0)
                
            }
            
        }.padding(.horizontal)
    }
}

struct ProductDetailsHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailsHeaderView(isPresented: .constant(true))
    }
}
