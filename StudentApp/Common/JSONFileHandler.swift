//
//  JSONFileHandler.swift
//  StudentApp
//
//  Created by pankaj Sachdeva on 28/05/21.
//

import Foundation

protocol JSONFileHandlerProtocol {
    func readLocalJSONFile(forName name: String, completion: @escaping (Result<Data, Error>) -> Void)
}

class JSONFileHandler: JSONFileHandlerProtocol {

    func readLocalJSONFile(forName name: String, completion: @escaping (Result<Data, Error>) -> Void) {
        do {
            if let filePath = Bundle.main.path(forResource: name, ofType: "json") {
                let fileUrl = URL(fileURLWithPath: filePath)
                let data = try Data(contentsOf: fileUrl)
                completion(.success(data))
            }
        } catch let error {
            completion(.failure(error))
        }
    }
}
