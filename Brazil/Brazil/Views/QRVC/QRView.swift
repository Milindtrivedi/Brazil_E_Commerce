//
//  QRView.swift
//  Brazil
//
//  Created by Milind Trivedi on 27/03/24.
//

import SwiftUI

struct QRView: View {
    
    @Environment(\.presentationMode) var presentationMode : Binding<PresentationMode>
    @State var isCodeFound = false
    @State var QRString = ""
    @State var isTorchOn = false
    @State var isShowProductDetails = false
    var ProductsArr : [Products] = [Products(imageName: "1", name: "Multi-Peptide Eye Serum"), Products(imageName: "2", name: "Natural Moisturizing Factors + PhytoCeramides"), Products(imageName: "3", name: "Glucoside Foaming Cleanser"), Products(imageName: "4", name: "Aloe 2% + NAG 2% Solution"), Products(imageName: "5", name: "Multi-Peptide + HA Serum")]
    
    
    var body: some View {
        ZStack {
            
            CodeScannerView(codeTypes: [.qr,.ean8, .ean13, .pdf417,.code128,.microPDF417], scanMode: .continuous, showViewfinder: true, isTorchOn: isTorchOn) { response in
                
                
                switch response {
                case .success(let result):
                    
                    print("Found code: \(result.string)")
                    isCodeFound = true
                    QRString = result.string
                    
                    
                case .failure(let error):
                    print(error.localizedDescription)
                }
                
                
                
                
            }.frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight)
                .background(.gray.opacity(0.6))
            
            
            VStack {
                HStack {
                    Button {
                            presentationMode.wrappedValue.dismiss()
                    } label: {
                        
                        ZStack {
                            Color.white
                            Image(systemName: "arrow.left")
                                
                                .foregroundColor(.primary)
                               
                                .scaledToFit()
                                
                        }
                        .frame(width: 50.0,height: 50.0)
                        .cornerRadius(25.0)
                        
                    }
                    
                    Spacer()
                    
                    Button {
                       
                        isTorchOn.toggle()
                        
                    } label: {
                        
                        ZStack {
                            Color.white
                            Image(systemName: "bolt")
                                
                                .foregroundColor(.primary)
                               
                                .scaledToFit()
                                
                        }
                        .frame(width: 50.0,height: 50.0)
                        .cornerRadius(25.0)
                        
                    }
                    
                }.padding()
                    .padding(.top, 44)
                Spacer()
               
                
                
                
               
                
               
                if isCodeFound {
               
                    ProductRow()
                        .cornerRadius(25.0)
                        .padding(16)
                        .onTapGesture {
                            isShowProductDetails = true
                            
                        }
                    
                        .navigationDestination(isPresented: $isShowProductDetails) {
                            ProductDetails(product: .constant(ProductsArr.shuffled().first!), isPresented: $isShowProductDetails)
                                .navigationBarHidden(true)
                                .navigationBarBackButtonHidden(true)
                        }
                }
                
            }
           
            VStack {
                if !isCodeFound {
                    Text("Scanning...")
                        .font(.title3)
                        .foregroundColor(Color(hex:"A6A29E"))
                }
                Image(systemName: "qrcode.viewfinder")
                    .resizable()
                    .frame(width: UIScreen.screenWidth * 0.7, height: UIScreen.screenWidth * 0.7)
                    .scaledToFill()
                    .foregroundColor(.white)
                    .modifier(QRScanLineModifier())
            }
            
        }.ignoresSafeArea()//frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight)
            
        
    }
}

struct QRView_Previews: PreviewProvider {
    static var previews: some View {
        QRView()
    }
}


struct QRScanLineModifier: ViewModifier {
    @State private var offsetY: CGFloat = 50.0
    @State private var moveUp = false
    
    func body(content: Content) -> some View {
        content
            .overlay(
                GeometryReader { geometry in
                    Rectangle()
                        .fill(Color.white)
                        .frame(width: geometry.size.width, height: 2)
                        .offset(x: 0, y: offsetY)
                        .onAppear {
                            withAnimation(Animation.linear(duration: 2.0).repeatForever(autoreverses: true)) {
                                moveUp.toggle()
                                if moveUp {
                                    offsetY = geometry.size.height - 50.0
                                } else {
                                    offsetY = 0
                                }
                            }
                        }
                }
            )
    }
}



struct QRMaskView: View {
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    var body: some View {
        ZStack {
            Color.clear
            Rectangle()
                .fill(Color.white.opacity(0.5))
                .frame(width: screenWidth * 0.6, height: screenWidth * 0.6)
        }
        .frame(width: screenWidth, height: screenHeight)
        .compositingGroup()
        .luminanceToAlpha()
    }
}
