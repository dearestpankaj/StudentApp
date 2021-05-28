//
//  StudentRepository.swift
//  StudentApp
//
//  Created by pankaj Sachdeva on 26/05/21.
//

import Foundation

protocol StudentsListRepositoryProtocol {
    func getStudentList(completion: @escaping ([Student]?) -> Void)
}

class StudentsListRepository: StudentsListRepositoryProtocol {
    let jsonFileHandler: JSONFileHandler!

    init(jsonFileHandler: JSONFileHandler) {
        self.jsonFileHandler = jsonFileHandler
    }

    func getStudentList(completion: @escaping ([Student]?) -> Void) {
        jsonFileHandler.readLocalJSONFile(forName: "Student-Data") { result in
            switch result {
            case .success(let data):
                do {
                    let studentArray = try JSONDecoder().decode([Student].self, from: data) as [Student]
                    completion(studentArray)
                } catch {
                    completion(nil)
                }
            case .failure(_):
                completion(nil)
            }
        }
    }
}
