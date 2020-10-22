//
//  UIColor+HHExtension.swift
//  HHCategory-swift
//
//  Created by Henry on 2020/10/22.
//

import Foundation
import UIKit

extension UIColor {
    
    // 16进制转rgb（透明度数值为固定值1.0）
    class func rgbColor(rgb: Int) -> UIColor {
        return rgbColor(rgb: rgb, alpha: 1.0)
    }
    
    // 16进制转rgba(透明度自己定)
    class func rgbColor(rgb: Int, alpha: CGFloat) -> UIColor {
        return UIColor(red: ((CGFloat)((rgb & 0xFF0000) >> 16)) / 255.0, green: ((CGFloat)((rgb & 0xFF00) >> 8)) / 255.0, blue: ((CGFloat)(rgb & 0xFF))/255.0, alpha: alpha)
    }
    
    // 随机颜色（给控件一个背景色，方便调试）
    class func randomColor() -> UIColor {
        let red = CGFloat(arc4random_uniform(255)) / CGFloat(255.0)
        let green = CGFloat( arc4random_uniform(255)) / CGFloat(255.0)
        let blue = CGFloat(arc4random_uniform(255)) / CGFloat(255.0)
        return UIColor.init(red: red, green: green, blue: blue, alpha: 1.0)
    }
    
    // RGB整数设置颜色
    convenience init(red: Int, green: Int, blue: Int , alp: CGFloat = 1.0 ) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: alp)
    }
    
    // 16进制设置颜色
    convenience init(hexInt: Int) {
       self.init(red:(hexInt >> 16) & 0xff, green:(hexInt >> 8) & 0xff, blue:hexInt & 0xff)
    }
       
    // 字符串设置颜色
    convenience init(hexString: String) {
        var hexStr = hexString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines as CharacterSet).uppercased()
        if (hexStr.hasPrefix("#")) {
            let startIndex = hexStr.index(hexStr.startIndex, offsetBy: 1)
            hexStr = String(hexStr[startIndex...])
        }
        var hexInt: UInt32 = 0
        Scanner(string: hexStr).scanHexInt32(&hexInt)
        self.init(red: Int((hexInt >> 16) & 0xff), green: Int((hexInt >> 8) & 0xff), blue: Int(hexInt & 0xff))
    }

}
