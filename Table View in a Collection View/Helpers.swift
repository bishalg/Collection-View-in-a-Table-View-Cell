import UIKit

func generateRandomData() -> [[UIColor]] {
    let numberOfRows = ColorPalette.PrimaryColors.count
    let numberOfItemsPerRow = 25

    return (0..<numberOfRows).map { _ in
        return (0..<numberOfItemsPerRow).map { _ in UIColor.randomColor() }
    }
}

extension UIColor {
    class func randomColor() -> UIColor {

        let hue = CGFloat(arc4random() % 100) / 100
        let saturation = CGFloat(arc4random() % 100) / 100
        let brightness = CGFloat(arc4random() % 100) / 100

        return UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: 1.0)
    }
    
    class func saturationOfColorForColor(color: UIColor) -> UIColor {
        var hue: CGFloat = 0
        var saturation: CGFloat = 0
        var brightness: CGFloat = 0
        var alpha: CGFloat = 0
        color.getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha)
        
        saturation = saturation - 0.05
        hue = fmod(hue, 1.0)
        saturation = fmod(saturation, 1.0)
        brightness = fmod(brightness, 1.0)
        
        return UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: 1.0)
    }
    
    
}

enum ColorPalette {
    static let Red = UIColor(red: 1.0, green: 0.1491, blue: 0.0, alpha: 1.0)
    static let Green = UIColor(red: 0.0, green: 0.5628, blue: 0.3188, alpha: 1.0)
    static let Blue = UIColor(red: 0.0, green: 0.3285, blue: 0.5749, alpha: 1.0)
    
    static let PrimaryColors = [Red, Green, Blue]
    static let ColorNames = ["Red", "Green", "Blue"]
    
    // Gray is now an enum with no cases!
    enum Gray {
        static let Light = UIColor(white: 0.8374, alpha: 1.0)
        static let Medium = UIColor(white: 0.4756, alpha: 1.0)
        static let Dark = UIColor(white: 0.2605, alpha: 1.0)
    }
    
}