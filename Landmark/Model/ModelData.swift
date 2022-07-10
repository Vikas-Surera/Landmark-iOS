//
//  ModelData.swift
//  Landmark
//
//  Created by Vikas Surera on 09/07/22.
//

import Foundation
import Combine

// Observable Object to make a single instance and able to listen and transmit changes
final class ModelData: ObservableObject{
    // @Publichsed to make sure it transmit changes
    @Published var landmarks: [Landmark] = load("landmarkData.json")
}

func load<T: Decodable>(_ filename: String) -> T{
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else{
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do{
        data = try Data(contentsOf: file)
    }catch{
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do{
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    }catch{
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
