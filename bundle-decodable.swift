//
//  bundle-decodable.swift
//  MoonShot
//
//  Created by Joseph Norris on 04/09/2023.
//

import Foundation


extension Bundle {
    
    func decode<T: Codable>(_ file: String ) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else{
            fatalError("failed to locate \(file) in bundle")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("failed to load \(file)")
            
        }
        
        let decoder = JSONDecoder()
        
        // here we adjust and format the json data
        let formatter = DateFormatter()
        formatter.dateFormat = "y-MM-dd"
        formatter.timeZone = .gmt
        decoder.dateDecodingStrategy = .formatted(formatter)
        
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("failed to decode \(file)")
        }
        return loaded
        
    }
}
