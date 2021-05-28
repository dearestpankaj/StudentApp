//
//  ViewController.swift
//  StudentApp
//
//  Created by pankaj Sachdeva on 25/05/21.
//

import UIKit

class StudentListViewController: UIViewController {
    var students = [StudentTableViewCellViewModel]()
    var studentsListViewModel: StudentsListViewModelProtocol!
    let cellHeight: CGFloat = 100.0

    @IBOutlet weak var tableview: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        getStudents()
    }

    private func setupView() {
        title = "Students"
        tableview.register(StudentListTableViewCell.self, forCellReuseIdentifier: StudentListTableViewCell.identifier)
        let studentListFactory = StudentsListFactory()
        studentsListViewModel = studentListFactory.makeStudentListViewModel()
    }

    private func getStudents() {
        studentsListViewModel.getStudentList()
    }

}

extension StudentListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return studentsListViewModel.getNumberOfStudents()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: StudentListTableViewCell.identifier,
                                                       for: indexPath) as? StudentListTableViewCell else {
            return UITableViewCell()
        }
        cell.configCell(model: studentsListViewModel.getStudentAIndex(index: indexPath.row))
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let student = studentsListViewModel.getStudentAIndex(index: indexPath.row)
        if let url = URL(string: "tel://\(student.phone)"),
           UIApplication.shared.canOpenURL(url) {
              if #available(iOS 10, *) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
               } else {
                   UIApplication.shared.openURL(url)
               }
           }
    }
}
