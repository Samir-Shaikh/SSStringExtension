//
//  String+Extension.swift
//  Pods-SSStringExtension_Tests
//
//  Created by Sam on 15/02/19.
//

import Foundation

extension String {
    
    func firstCharacterCapitalized() -> String {
        return prefix(1).uppercased() + dropFirst()
    }
   
    func clean(with: String, allOf: String...) -> String {
        var string = self
        for target in allOf {
            string = string.replacingOccurrences(of: target, with: with)
        }
        return string
    }
    
    func isAlpha() -> Bool {
        for chr in self {
            if (!(chr >= "a" && chr <= "z") && !(chr >= "A" && chr <= "Z") ) {
                return false
            }
        }
        return true
    }
   
    /// Check for email validation
    func isValidEmail() -> Bool {
        
        let regExpression = "^[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regExpression)
        return predicate.evaluate(with:self)
    }
    
    /// Check for mobile validation
    func isValidMobileNumber() -> Bool{
        
        let phoneRegex: String = "^[0-9]{6,15}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
        if phoneTest.evaluate(with: self) {
            if CInt(self) != 0 {
                return true
            }
        }
        return false
    }
    
    /// Check for pan validation
    func isValidPANNumber() -> Bool{
        
        let regExpression = "^[A-Z]{5}+[0-9]{4}+[A-Z]{1}$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regExpression)
        return predicate.evaluate(with:self)
    }
    
    /// Check for aadhar card validation
    func isValidAadharNumber() -> Bool{
        
        let phoneRegex: String = "^[0-9]{12}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
        if phoneTest.evaluate(with: self) {
            if CInt(self) != 0 {
                return true
            }
        }
        return false
    }
    
    // website validation
    func isValidUrl() -> Bool {
        // create NSURL instance
        if let url = URL(string: self) {
            // check if your application can open the NSURL instance
            return UIApplication.shared.canOpenURL(url)
        }
        return false
    }
    
    /// Remove white spaces (front and rear) from string
    func removeWhiteSpaces () -> String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    /// Remove UnderScore
    func removeUnderScore () -> String {
        var str = self
        if str.lowercased().range(of:"_") != nil {
            str = str.replacingOccurrences(of: "_", with: " ")
        }
        return str.localizedCapitalized
    }
    
    func isAlphaNumeric() -> Bool {
        let alphaNumeric = NSCharacterSet.alphanumerics
        return self.components(separatedBy: alphaNumeric).joined(separator: "").count == 0
    }
    
    func isEmpty() -> Bool {
    
        return self.trimmingCharacters(in: .whitespacesAndNewlines).count == 0
    }
    
    func isNumeric() -> Bool {
        if let _ = defaultNumberFormatter().number(from: self) {
            return true
        }
        return false
    }
    
    func trimmed() -> String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    func toFloat() -> Float? {
        if let number = defaultNumberFormatter().number(from: self) {
            return number.floatValue
        }
        return nil
    }
    
    func toInt() -> Int? {
        if let number = defaultNumberFormatter().number(from: self) {
            return number.intValue
        }
        return nil
    }
    
    func toDouble(locale: Locale = Locale.current) -> Double? {
        let nf = defaultNumberFormatter()
        
        if let number = nf.number(from: self) {
            return number.doubleValue
        }
        return nil
    }
    
    func toBool() -> Bool? {
        let trimmed = self.trimmed().lowercased()
        if trimmed == "true" || trimmed == "false" {
            return (trimmed as NSString).boolValue
        }
        return nil
    }
    
    func toDate(format: String = "yyyy-MM-dd") -> Date? {
        return dateFormatter(format: format).date(from: self)
    }
    
    func toDateTime(format: String = "yyyy-MM-dd HH:mm:ss") -> Date? {
        return toDate(format: format)
    }
}

private func threadLocalInstance<T: AnyObject>(identifier: ThreadLocalIdentifier, initialValue: @autoclosure () -> T) -> T {
    let storage = Thread.current.threadDictionary
    let k = identifier.objcDictKey
    
    let instance: T = storage[k] as? T ?? initialValue()
    if storage[k] == nil {
        storage[k] = instance
    }
    
    return instance
}


private func dateFormatter(format: String) -> DateFormatter {
    return threadLocalInstance(identifier: .DateFormatter(format), initialValue: {
        let df = DateFormatter()
        df.dateFormat = format
        return df
    }())
}

private enum ThreadLocalIdentifier {
    case DateFormatter(String)
    
    case DefaultNumberFormatter
    case LocaleNumberFormatter(Locale)
    
    var objcDictKey: String {
        switch self {
        case .DateFormatter(let format):
            return "SS\(self)\(format)"
        case .LocaleNumberFormatter(let l):
            return "SS\(self)\(l.identifier)"
        default:
            return "SS\(self)"
        }
    }
}

private func defaultNumberFormatter() -> NumberFormatter {
    return threadLocalInstance(identifier: .DefaultNumberFormatter, initialValue: NumberFormatter())
}
