//
//  StudentsListFactory.swift
//  StudentApp
//
//  Created by pankaj Sachdeva on 28/05/21.
//

import Foundation

protocol StudentsListFactoryProtocol {
    func makeStudentListRepository() -> StudentsListRepository
}
class StudentsListFactory: StudentsListFactoryProtocol {

    func makeStudentListViewModel() -> StudentsListViewModel {
        return StudentsListViewModel(studentListRepository: makeStudentListRepository())
    }

    func makeStudentListRepository() -> StudentsListRepository {
        return StudentsListRepository(jsonFileHandler: makeJSONFileHandler())
    }

    func makeJSONFileHandler() -> JSONFileHandler {
        return JSONFileHandler()
    }
}
