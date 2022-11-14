//
//  Presenter.swift
//  MVP разбор
//
//  Created by Eвгений Павлюков on 12.11.2022.
//
// Сколько экранов столько и презентеров нужно обеспечить взаимодествие с констроллером с помощью протоколов например

import Foundation

protocol ViewProtocol: AnyObject { //output
    func success()
    func failure(error: Error)
}

protocol ViewPresenterProtocol: AnyObject { //input
    init(view: ViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol)
    func getComments() //запрашивает комменты из сети
    var comments: [Comment]? { get set }
    func tapTheComment(comment: Comment?) //чтобы передать дальше
}

class MainPresenter: ViewPresenterProtocol {
    
    weak var view: ViewProtocol? //абстракция
    let router: RouterProtocol?
    let networkService: NetworkServiceProtocol!
    var comments: [Comment]?
    
    required init(view: ViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol){
        self.view = view
        self.networkService = networkService
        self.router = router
        getComments()
    }
    
    func tapTheComment(comment: Comment?) {
        router?.showDetail(comment: comment)
    }
    
    func getComments() {
        networkService.getComment { [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(let comments):
                    self.comments = comments
                    self.view?.success()
                case . failure(let error):
                    self.view?.failure(error: error) // нужно синхронизировать
                }
            }
        }
    }
    
}

//осталось настроить слой VIEW
