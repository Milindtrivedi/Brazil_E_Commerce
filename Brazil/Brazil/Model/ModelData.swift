//
//  ModelData.swift
//  Brazil
//
//  Created by Milind Trivedi on 27/03/24.
//

import Foundation


//final class Products {
//
//    static let one = "Multi-Peptide Eye Serum"
//    static let two = "Natural Moisturizing Factors + PhytoCeramides"
//    static let three = "Glucoside Foaming Cleanser"
//    static let four = "Aloe 2% + NAG 2% Solution"
//    static let five = "Multi-Peptide + HA Serum"
//
//}


struct Products : Identifiable {
    let id = UUID()
    let imageName : String
    let name : String
}
