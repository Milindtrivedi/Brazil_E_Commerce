//
//  AnimatedButtonLine.swift
//  Brazil
//
//  Created by Milind Trivedi on 27/03/24.
//

import SwiftUI

struct AnimatedButtonLine: View {
    
    let items: [String]
    let selectedItem: String
    let itemSelected: (String) -> Void
    let fontSize: CGFloat
    let fontWeight: Font.Weight
    let selectedColor: Color
    let unselectedColor: Color
    @Binding var tappedChanged : Bool
    
    @Namespace private var animation
    
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack() {
                    ForEach (items, id: \.self) { item in
                        Button {
                            withAnimation {
                                itemSelected(item)
                                tappedChanged = true
                            }
                        } label: {
                            VStack{
                                Text(item)
                                    .font(.system(size: selectedItem == item ? fontSize : fontSize * 0.9, weight: selectedItem == item ? fontWeight : .regular))
                                    .padding(.vertical)
                                    .foregroundColor(selectedItem == item ? selectedColor : unselectedColor)
                                    .matchedGeometryEffect(id: item, in: animation, isSource: true)
                                    
                            }
                        }
                            .overlay (
                               
                            RoundedRectangle(cornerRadius: 5)
                                .fill(Color(hex: "CDBFA5"))
                                .frame(height: 3)
                                .matchedGeometryEffect(id:selectedItem, in: animation, isSource: false)
                                .opacity(selectedItem == item ? 1 : 0)
                                
                            , alignment: .bottom
                                
                        )
                        .padding(.horizontal)
                        .matchedGeometryEffect(id: "dummy", in: animation, isSource: false)
                    }
                }
                //Spacer()
            }
        }
    }
}






struct AnimatedButtonLine_Previews: PreviewProvider {
    static var previews: some View {
        
        let categories = ["Fruits", "Fish", "Dairy"]
        @State var selectedCategory = "Fruits"
        
        AnimatedButtonLine(items: categories,
                                   selectedItem: selectedCategory,
                                   itemSelected: { category in
                                       selectedCategory = category
                                   },
                                   fontSize: 18,
                                   fontWeight: .bold,
                                   selectedColor: Color(hex: "393733"),
                           unselectedColor: Color(hex: "AEAAA7"), tappedChanged: .constant(true))
            
    }
}
