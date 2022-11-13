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
}

class ModelBuilder: Builder {
    static func createMainModule() -> UIViewController {
        let model = Person(firstName: "Jack", lastName: "Sparrow")
        let view = MainViewController()
        let presenter = MainPresenter(view: view, person: model)
        view.presenter = presenter
        return view
    }
}
