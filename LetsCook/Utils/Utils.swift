//
//  Utils.swift
//  LetsCook
//
//  Created by George Nyakundi on 17/02/2021.
//

import Foundation

public class Utils {
    static let shared = Utils()
    
    private func readLocalFile(forName: String) -> Data? {
        do {
            if let bundlePath = Bundle.main.path(forResource: forName, ofType: "json"),
               let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                
                return jsonData
            }
        } catch  {
            print(error)
        }
        
        return nil
    }
}
