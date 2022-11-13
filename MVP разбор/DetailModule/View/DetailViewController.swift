//
//  UIViewController.swift
//  MVP разбор
//
//  Created by Eвгений Павлюков on 13.11.2022.
//

import UIKit

class DetailViewController: UIViewController {
    
    var labelComment: UILabel!
    var presenter: DetailViewPresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        createLabelComment()
    }

    func createLabelComment() {
        labelComment = UILabel(frame: view.bounds)
        labelComment.textAlignment = .center
        labelComment.numberOfLines = 0
        view.addSubview(labelComment)
        presenter.setComment()
    }

}

extension DetailViewController: DetailViewProtocol {
    func setComment(comment: Comment?) {
        labelComment.text = comment?.body
    }
    
    
}
