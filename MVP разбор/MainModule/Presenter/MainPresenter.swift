//
//  Presenter.swift
//  MVP разбор
//
//  Created by Eвгений Павлюков on 12.11.2022.
//
// Сколько экранов столько и презентеров нужно обеспечить взаимодествие с констроллером с помощью протоколов например

import Foundation

protocol ViewProtocol: AnyObject {
    func setGreetings(greeting: String)
}

protocol ViewPresenterProtocol: AnyObject {
    init(view: ViewProtocol, person: Person)
    func showGreeting()
}

class MainPresenter: ViewPresenterProtocol {
    
    let view: ViewProtocol //абстракция
    let person: Person
    
    required init(view: ViewProtocol, person: Person){
        self.view = view
        self.person = person
    }
    
    func showGreeting() {
        let greeting = self.person.firstName + " " + self.person.lastName // business logic
        self.view.setGreetings(greeting: greeting)
    }
    
}

//осталось настроить слой VIEW
