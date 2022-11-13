//
//  ViewController.swift
//  MVP разбор
//
//  Created by Eвгений Павлюков on 03.11.2022.
// MVP это как MVC только тут модель не взаимодействует с вью вообще
// MVP паттерн применяется на слой (отдельная папка) Сервисы нетворк и тд создаются в других папках
// в MVC контроллер тесно связан с вью и туда пишется все подряд. этот код сложно распутать потом и нельзя использовать принципы SOLID,  поэтому придумали MVP чтобы отделить бизнес от логики
//MainModule это один экран, следующий модуль это другой экран

import UIKit
import Foundation

class MainViewController: UIViewController { // это только вью

    //MARK: - TableView
    var myTableView: UITableView!
    var presenter: ViewPresenterProtocol! // dependecy injection
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        createTableView()
    
    }
    
    func createTableView() {
        myTableView = UITableView(frame: view.bounds, style: .plain)
        myTableView.delegate = self
        myTableView.dataSource = self
        myTableView.register(CustomTableCellPresenter.self, forCellReuseIdentifier: CustomTableCellPresenter.identifier)
        
        view.addSubview(myTableView)
    }
    
}

extension MainViewController: ViewProtocol {
    func success() {
        myTableView.reloadData()
    }
    
    func failure(error: Error) {
        print(error.localizedDescription)
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.comments?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let itemCell = tableView.dequeueReusableCell(withIdentifier: CustomTableCellPresenter.identifier, for: indexPath) as? CustomTableCellPresenter {
            let comment = presenter.comments?[indexPath.row]
            var cellSettings = itemCell.defaultContentConfiguration()
            cellSettings.text = comment?.body
            itemCell.contentConfiguration = cellSettings
            return itemCell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let comment = presenter.comments?[indexPath.row]
        let detailViewController = ModelBuilder.createDetailModule(comment: comment)
        navigationController?.pushViewController(detailViewController, animated: true)
    }
    
    
    
}
