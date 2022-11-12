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

    //MARK: - UILabel
    var myLabel: UILabel!
    var myButton: UIButton!
    var presenter: ViewPresenterProtocol! // dependecy injection
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        createLabel()
        createButton()
    }

    func createLabel() {
        myLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        myLabel.center = view.center
        myLabel.textAlignment = .center
        myLabel.textColor = .black
        view.addSubview(myLabel)
    }
    
    func createButton() {
        myButton = UIButton(frame: CGRect(x: 150, y: 400, width: 70, height: 40))
        
        myButton.backgroundColor = .gray
        myButton.setTitle("Press", for: .normal)
        myButton.layer.cornerRadius = 9
        myButton.addTarget(self, action: #selector(didTapButtonAction), for: .touchDown)
        myButton.addTarget(self, action: #selector(didTapOutButtonAction), for: .touchUpInside)
        view.addSubview(myButton)
    }
    
    
    @objc func didTapButtonAction() {
        self.presenter.showGreeting()
        myButton.alpha = 0.5
    }
    @objc func didTapOutButtonAction() {
        myButton.alpha = 1
    }
}

extension MainViewController: ViewProtocol {
    func setGreetings(greeting: String) {
        self.myLabel.text = greeting
    }
    
    
}
