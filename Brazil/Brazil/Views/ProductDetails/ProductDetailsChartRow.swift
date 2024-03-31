//
//  ProductDetailsChartRow.swift
//  Brazil
//
//  Created by Milind Trivedi on 27/03/24.
//

import SwiftUI

struct ProductDetailsChartRow: View {
    
    var clr : Color
    var lblheader : String
    var lblValue : String
    
    var body: some View {
        HStack {
            RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(clr)
                        .frame(width: 30, height: 30)
            
           Text(lblheader)
                .font(.system(size: 18, weight: .medium))
                .foregroundColor(Color(hex: "393733"))
            
//        fontSize: 18,fontWeight: .medium,selectedColor: Color(hex: "393733"),unselectedColor: Color(hex: "AEAAA7")
            
            Spacer()
            Text(lblValue)
                .font(.system(size: 16))
                .foregroundColor(Color(hex: "AEAAA7"))
        }.padding()
        
    }
}

struct ProductDetailsChartRow_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailsChartRow(clr: Color("EDA9A2"), lblheader: "Phenoxyethanol", lblValue: "2%")
    }
}
