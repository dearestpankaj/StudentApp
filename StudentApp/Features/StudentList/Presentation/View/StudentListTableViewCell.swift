//
//  StudentListTableViewCell.swift
//  StudentApp
//
//  Created by pankaj Sachdeva on 28/05/21.
//

import UIKit

class StudentListTableViewCell: UITableViewCell {
    static let identifier = "StudentListTableViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        detailTextLabel?.numberOfLines = 0
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configCell(model: StudentTableViewCellViewModel) {
        textLabel?.text = model.name
        detailTextLabel?.text = model.email + "\n" + model.phone
        imageView?.image = model.image
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
