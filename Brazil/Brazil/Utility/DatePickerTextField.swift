//
//  DatePickerTextField.swift
//  Brazil
//
//  Created by Milind Trivedi on 27/03/24.
//

import Foundation
import SwiftUI

struct DatePickerTextField: UIViewRepresentable {
    private let textField = UITextField()
    private let datePicker = UIDatePicker()
    private let helper = Helper()
    
    public var placeholder: String
    @Binding public var date: Date?
    
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    func makeUIView(context: Context) -> UITextField {
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.addTarget(self.helper, action: #selector(self.helper.dateValueChanged), for: .valueChanged)
        
        
        let string = placeholder
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 14, weight: .ultraLight),
            .foregroundColor: UIColor.gray
        ]
        
        let attributedString = NSMutableAttributedString(string: string, attributes: attributes)
    
//        let newDescriptor = UIFont.systemFont(ofSize: 14, weight: .ultraLight).fontDescriptor.addingAttributes([.traits: [
//            UIFontDescriptor.TraitKey.weight: UIFont.Weight.ultraLight]
//            ])
        
        let italicFont = UIFont.italicSystemFont(ofSize: 14)

        let italicAttributes: [NSAttributedString.Key: Any] = [.font: italicFont]
        
        if let range = string.range(of: placeholder) {
            let nsRange = NSRange(range, in: string)
            attributedString.addAttributes(italicAttributes, range: nsRange)
            textField.attributedPlaceholder = attributedString
        }
        
        
//        NSAttributedString(
//            string: placeholder,
//            attributes: [NSAttributedString.Key.foregroundColor: (hexStringToUIColor(hex: "000000"), )]
//        )

        textField.inputView = datePicker
       
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: helper, action: #selector(helper.doneButtonTapped))
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: helper, action: #selector(helper.onsomecancelButtonTapped))
        toolbar.setItems([cancelButton,flexibleSpace, doneButton], animated: true)
        textField.inputAccessoryView = toolbar
        
        helper.onDateValueChanged = {
            date = datePicker.date
        }
        
        helper.onDoneButtonTapped = {
            if date == nil {
                date = datePicker.date
            }
            
            textField.resignFirstResponder()
        }
        
        helper.onCancelButtonTapped = {
            textField.text = ""
            textField.endEditing(true)
        }
        
        return textField
    }
    
    func updateUIView(_ uiView: UITextField, context: Context) {
        if let selectedDate = date {
            uiView.text = Globals.dateFormatter.string(from: selectedDate)
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator()
    }
    
    class Helper {
        public var onDateValueChanged: (() -> Void)?
        public var onDoneButtonTapped: (() -> Void)?
        public var onCancelButtonTapped: (() -> Void)?
        
        @objc func dateValueChanged() {
            onDateValueChanged?()
        }
        
        @objc func doneButtonTapped() {
            onDoneButtonTapped?()
        }
        
        @objc func onsomecancelButtonTapped() {
            onCancelButtonTapped?()
        }
    }
    
    class Coordinator {}
}

