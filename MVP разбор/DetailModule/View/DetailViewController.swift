//
//  UIViewController.swift
//  MVP разбор
//
//  Created by Eвгений Павлюков on 13.11.2022.
//

import UIKit

class DetailViewController: UIViewController {
    
    var labelComment: UILabel!
    var buttonPop: UIButton!
    var presenter: DetailViewPresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        createLabelComment()
        createButtonPop()
//        constraints()
    }

    func createLabelComment() {
        labelComment = UILabel(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 500))
        labelComment.textAlignment = .center
        labelComment.numberOfLines = 0
        view.addSubview(labelComment)
        presenter.setComment()
    }
    
    func createButtonPop() {
        buttonPop = UIButton(type: .roundedRect)
        buttonPop.frame = CGRect(origin: CGPoint(x: 0, y: 550), size: CGSize(width: 100, height: 100))
        buttonPop.center.x = view.center.x
        buttonPop.backgroundColor = .blue
        buttonPop.addTarget(self, action: #selector(tapButton), for: .touchDown)
        view.addSubview(buttonPop)
    }

    @objc func tapButton(){
        presenter.tap()
    }
    
    
//    func constraints() {
//        labelComment.translatesAutoresizingMaskIntoConstraints = false
//        buttonPop.translatesAutoresizingMaskIntoConstraints = false
//        view.translatesAutoresizingMaskIntoConstraints = false
//
//
//        NSLayoutConstraint(item: labelComment,
//                           attribute: .topMargin,
//                           relatedBy: .equal,
//                           toItem: view,
//                           attribute: .topMargin,
//                           multiplier: 1,
//                           constant: 0).isActive = true
//
//        NSLayoutConstraint(item: labelComment,
//                           attribute: .bottomMargin,
//                           relatedBy: .equal,
//                           toItem: view,
//                           attribute: .bottomMargin,
//                           multiplier: 1,
//                           constant: -200).isActive = true
//
//        NSLayoutConstraint(item: labelComment,
//                           attribute: .leadingMargin,
//                           relatedBy: .equal,
//                           toItem: view,
//                           attribute: .leadingMargin,
//                           multiplier: 1,
//                           constant: 0).isActive = true
//
//        NSLayoutConstraint(item: labelComment,
//                           attribute: .trailingMargin,
//                           relatedBy: .equal,
//                           toItem: view,
//                           attribute: .trailingMargin,
//                           multiplier: 1,
//                           constant: 0).isActive = true
//
//        NSLayoutConstraint(item: buttonPop,
//                           attribute: .bottomMargin,
//                           relatedBy: .equal,
//                           toItem: view,
//                           attribute: .bottomMargin,
//                           multiplier: 1,
//                           constant: 60).isActive = true
//
//        NSLayoutConstraint(item: buttonPop,
//                           attribute: .topMargin,
//                           relatedBy: .equal,
//                           toItem: labelComment,
//                           attribute: .bottomMargin,
//                           multiplier: 1,
//                           constant: 20).isActive = true
//
//        NSLayoutConstraint(item: buttonPop,
//                           attribute: .leadingMargin,
//                           relatedBy: .equal,
//                           toItem: view,
//                           attribute: .leadingMargin,
//                           multiplier: 1,
//                           constant: 40).isActive = true
//
//        NSLayoutConstraint(item: buttonPop,
//                           attribute: .trailingMargin,
//                           relatedBy: .equal,
//                           toItem: view,
//                           attribute: .trailingMargin,
//                           multiplier: 1,
//                           constant: 40).isActive = true
//
//
//    }
    
}

extension DetailViewController: DetailViewProtocol {
    func setComment(comment: Comment?) {
        labelComment.text = comment?.body
    }
    
    
}
