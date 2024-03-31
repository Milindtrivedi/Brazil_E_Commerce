//
//  ProductDetailschartscreen.swift
//  Brazil
//
//  Created by Milind Trivedi on 27/03/24.
//

import SwiftUI

struct ProductDetailschartscreen: View {
    
    let colors = [Color(hex: "EDA9A2"),Color(hex: "F4E195"),Color(hex: "A0B189")]
    let progress: [CGFloat] = [1.0, 0.9, 0.8]
    
    var body: some View {
        
        ZStack {
            VStack(spacing: 16.0) {
                HStack() {
                    Text("92%")
                        .font(.title2)
                        .bold()
                       
                    +
                    Text(" on a safe list")
                        .font(.title3)
                        
                    Spacer()
                } .foregroundColor(Color(hex:"A39F9B"))
                    .padding(.horizontal)
                    
                
                RoundedProgressView(colors: colors, progress: progress)
                    .frame(height: 60.0)
                    .padding(.vertical, -20)
                
                VStack(spacing: -10){
                    ProductDetailsChartRow(clr: Color(hex: "EDA9A2"), lblheader: "Phenoxyethanol", lblValue: "2%")
                    ProductDetailsChartRow(clr: Color(hex: "F4E195"), lblheader: "Isoceteth-20", lblValue: "6%")
                    ProductDetailsChartRow(clr: Color(hex: "A3B58B"), lblheader: "Ethylhexylglycerin", lblValue: "9%")
                }
                .padding(.vertical, 0)
               
                
               
            }
        }
    }
}

struct ProductDetailschartscreen_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailschartscreen()
    }
}


struct RoundedProgressView: View {
    let colors: [Color]
    let progress: [CGFloat]

    var body: some View {
        GeometryReader { geometry in
                    ZStack(alignment: .leading) {
                        Rectangle()
                            .foregroundColor(.gray.opacity(0.2))
                            .frame(width: geometry.size.width - 40, height: 20)
                            .cornerRadius(10)

                        ForEach(progress.indices, id: \.self) { index in
                            Rectangle()
                                .foregroundColor(colors[index])
                                .frame(width: (geometry.size.width - 40) * progress[index], height: 20)
                                .cornerRadius(10)
                        }
                    }
                    .padding(20)
        }
               
    }
}

//struct RoundedProgressView: View {
//    let colors: [Color]
//    let progress: [CGFloat]
//
//    var body: some View {
//        GeometryReader { geometry in
//            ZStack(alignment: .leading) {
//                Rectangle()
//                    .foregroundColor(.gray.opacity(0.2))
//                    .frame(width: geometry.size.width - 40, height: 20)
//                    .cornerRadius(10)
//
//                ForEach(progress.indices, id: \.self) { index in
//                    Rectangle()
//                        .foregroundColor(colors[index])
//                        .frame(width: (geometry.size.width - 40) * progress[index], height: 20)
//                        .cornerRadius(10)
//                }
//            }
//        }
//        .padding(20)
//        .aspectRatio(3, contentMode: .fit)
//    }
//}
