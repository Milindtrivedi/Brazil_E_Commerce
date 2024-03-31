//
//  DetailsInfoVIew.swift
//  Brazil
//
//  Created by Milind Trivedi on 27/03/24.
//

import SwiftUI

struct DetailsInfoVIew: View {
    var body: some View {
        HStack(alignment: .center){
            
            VStack(alignment: .center) {
                Image("leaf")
                    .resizable()
                    .frame(width: 30.0, height: 30.0)
                Text("VEGAN")
                    .font(.system(size: 12))
                    .lineLimit(1)
                    .minimumScaleFactor(0.5)
                    .frame(width: 90.0)
                
                
            }.foregroundColor(Color(hex: "A7A29D"))
                .padding(.horizontal)
            
            //Spacer()
            
            VStack(alignment: .center) {
                Image("glass")
                    .resizable()
                    .frame(width: 30.0, height: 30.0)
                Text("SILICONE FREE")
                    .font(.system(size: 12))
                //.lineLimit(1)
                    .minimumScaleFactor(0.5)
                    .frame(width: 90.0)
                
            }.foregroundColor(Color(hex: "A7A29D"))
                .padding(.horizontal)
            
            //Spacer()
            
            VStack(alignment: .center) {
                Image("recycle")
                    .resizable()
                    .frame(width: 30.0, height: 30.0)
                Text("RECYCABLE")
                    .font(.system(size: 12))
                //.lineLimit(1)
                    .frame(width: 90.0)
                    .minimumScaleFactor(0.5)
                
            }.foregroundColor(Color(hex: "A7A29D"))
                .padding(.horizontal)
            
        }
    }
}

struct DetailsInfoVIew_Previews: PreviewProvider {
    static var previews: some View {
        DetailsInfoVIew()
    }
}
