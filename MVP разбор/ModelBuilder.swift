//
//  ModuleBuilder.swift
//  MVP разбор
//
//  Created by Eвгений Павлюков on 12.11.2022.
//

import Foundation
import UIKit

protocol Builder {
    static func createMainModule() -> UIViewController
    static func createDetailModule(comment: Comment?) -> UIViewController
}

class ModelBuilder: Builder {
    static func createMainModule() -> UIViewController {
        let view = MainViewController()
        let networkService = NetworkService()
        let presenter = MainPresenter(view: view, networkService: networkService)
        view.presenter = presenter
        return view
    }
    
    static func createDetailModule(comment: Comment?) -> UIViewController { //здесь происходит сборка вьюхи и иньектится
        let view = DetailViewController()
        let networkService = NetworkService()
        let presenter = DetailPresenter(view: view, networkService: networkService, comment: comment)
        view.presenter = presenter
        return view
    }
}


