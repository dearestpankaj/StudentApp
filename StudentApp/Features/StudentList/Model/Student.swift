//
//  Student.swift
//  StudentApp
//
//  Created by pankaj Sachdeva on 26/05/21.
//

import Foundation

// MARK: - Student
struct Student: Codable {
    let firstName, lastName, email, phoneNumber: String
    let image: String
}
