//
//  UIColors+Extension.swift
//  ahmed_chebbi_ios_challenge
//
//  Created by Chebbi on 22/03/2021.
//

import UIKit

extension UIColor {

   /// Creates a color object that generates its color data dynamically using the specified colors. For early SDKs creates light color.
   /// - Parameters:
   ///   - light: The color for light mode.
   ///   - dark: The color for dark mode.
   public convenience init(light: UIColor, dark: UIColor) {

       if #available(iOS 13.0, *) {
           self.init { traitCollection in
               if traitCollection.userInterfaceStyle == .dark {
                   return dark
               }
               return light
           }
       } else {
           self.init(cgColor: light.cgColor)
       }
   }
   
   
   // ===============
   // MARK: Constants
   // ===============
   static let corporateBlack = UIColor(light: .black, dark: .white)
   static let corporateWhite = UIColor(light: .white, dark: .black)
   static let corporateLightGray = UIColor(light: .lightGray, dark: .darkGray)
   static let corporateDarkGray = UIColor(light: .darkGray, dark: .lightGray)
   static let corporateLightWhite = UIColor(light: lightGray, dark: darkGray)
   static let corporateOrange = UIColor(rgb: 0xF16E00)

    // ==================
    // MARK: Initializers
    // ==================

    public convenience init(rgb: Int, alpha: CGFloat = 1.0) {
        precondition(0 ... 0xFFFFFF ~= rgb, "invalid RGB value")
        let component = { (shift: Int) -> CGFloat in
            let intValue = (rgb >> shift) & 0xFF
            return CGFloat(intValue) / 255.0
        }
        self.init(red: component(16), green: component(8), blue: component(0), alpha: alpha)
    }

    public convenience init(rgba: UInt32) {
        let component = { (shift: UInt32) -> CGFloat in
            let intValue = (rgba >> shift) & 0xFF
            return CGFloat(intValue) / 255.0
        }
        self.init(red: component(24), green: component(16), blue: component(8), alpha: component(0))
    }

    public convenience init?(hexString: String) {
        let withoutPrefix = hexString.removed(anyPrefixIn: ["#", "0x"])
        switch withoutPrefix.count {
        case 6:
            guard let value = Int(withoutPrefix, radix: 16) else {
                return nil
            }
            self.init(rgb: value)
        case 8:
            guard let value = UInt32(withoutPrefix, radix: 16) else {
                return nil
            }
            self.init(rgba: value)
        default:
            return nil
        }
    }
    
    // ================
    // MARK: Hex String
    // ================

    public var hexString: String {
        var red: CGFloat = 0.0
        var green: CGFloat = 0.0
        var blue: CGFloat = 0.0
        var alpha: CGFloat = 0.0
        getRed(&red, green: &green, blue: &blue, alpha: &alpha)

        let convert = { (component: CGFloat, shift: Int) in
            Int(component * 255) << shift
        }

        if alpha == 1.0 {
            let rgb = convert(red, 16) | convert(green, 8) | convert(blue, 0)
            return String(format: "#%06x", rgb)
        } else {
            let rgba = convert(red, 24) | convert(green, 16) | convert(blue, 8) | convert(alpha, 0)
            return String(format: "#%08x", rgba)
        }
    }
}
