//
//  StudentsListViewModel.swift
//  StudentApp
//
//  Created by pankaj Sachdeva on 28/05/21.
//

import UIKit

protocol StudentsListViewModelProtocol {
    func getStudentList()
    func getNumberOfStudents() -> Int
    func getStudentAIndex(index: Int) -> StudentTableViewCellViewModel
}

class StudentsListViewModel: StudentsListViewModelProtocol {
    let studentListRepository: StudentsListRepositoryProtocol!
    var datasourceArray = [StudentTableViewCellViewModel]()

    init(studentListRepository: StudentsListRepositoryProtocol) {
        self.studentListRepository = studentListRepository
    }

    func getStudentList() {
        studentListRepository.getStudentList { [weak self] studentList in
            guard let studentList = studentList else {
                return
            }
            self?.datasourceArray = studentList.map {
                StudentTableViewCellViewModel(name: $0.firstName + " " + $0.lastName,
                                              email: $0.email,
                                              phone: $0.phoneNumber,
                                              image: UIImage(named: $0.image))
            }
        }
    }

    func getNumberOfStudents() -> Int {
        datasourceArray.count
    }

    func getStudentAIndex(index: Int) -> StudentTableViewCellViewModel {
        datasourceArray[index]
    }
}

struct StudentTableViewCellViewModel {
    let name: String
    let email: String
    let phone: String
    let image: UIImage?
}
