//
//  WebService.swift
//  Coinss
//
//  Created by Nisa Nur Baştimur on 22.04.2024.
//

import Foundation

enum DataError : Error {
    case InstallError
    case parsingError
    
}

class Webservice {
    
    func installData(url: URL, completion: @escaping (Result<[Crypto],DataError>) -> ()){
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                completion(.failure(.InstallError))
                
            }else if let data = data {
                
                let cryptoList = try? JSONDecoder().decode([Crypto].self, from: data)
                
                if let cryptoList = cryptoList{
                    completion(.success(cryptoList))
                }else {
                    completion(.failure(.parsingError))
                }
                
                
                
            }
                
            
        }.resume()
        
    }
    
}
