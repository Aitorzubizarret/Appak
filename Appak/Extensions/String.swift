//
//  String.swift
//  Appak
//
//  Created by Aitor Zubizarreta Perez on 03/04/2021.
//

import Foundation

extension String {
    
    ///
    /// Search an Icon / Image using Regex.
    ///
    func searchIconImageWithRegex() -> String {
        let pattern: String = "[^ ]+.png 2x"
        var result: String = ""
        
        do {
            let regex = try NSRegularExpression(pattern: pattern)
            if let match = regex.matches(in: self, range: NSRange(self.startIndex..., in: self)).first {
                let range = match.range(at: 0)
                if let imageRange = Range(range, in: self) {
                    result = String(self[imageRange])
                    result = result.replacingOccurrences(of: " 2x", with: "")
                }
            }
           
        } catch let error {
            print("Error searchIconImageWithRegex: \(error.localizedDescription)")
        }
        
        return result
    }
}
