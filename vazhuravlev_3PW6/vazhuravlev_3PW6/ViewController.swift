//
//  ViewController.swift
//  vazhuravlev_3PW6
//
//  Created by Валерий Журавлев on 17.03.2022.
//

import UIKit
import MyLogger1
import MyLogger2
import MyLogger3
import SwiftyJSON

class ViewController: UIViewController {

    // MARK: - ViewController's life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupButtons()
        // Do any additional setup after loading the view.
    }
    
    // MARK: - setup functions
    private func setupButtons() {
        let stack = UIStackView()
        self.view.addSubview(stack)

        stack.axis = .vertical
        stack.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        stack.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        let frameworkButton =
            setupButton(title: "Log (framework)", action: #selector(self.frameworkAction))
        let swiftPackageButton =
            setupButton(title: "Log (swift package)", action: #selector(self.swiftPackageAction))
        let podButton =
            setupButton(title: "Log (pod)", action: #selector(self.podAction))
        let carthageButton =
            setupButton(title: "Log (carthage)", action: #selector(self.carthageAction))

        stack.addArrangedSubview(frameworkButton)
        frameworkButton.centerXAnchor.constraint(equalTo: stack.centerXAnchor).isActive = true
        stack.addArrangedSubview(swiftPackageButton)
        swiftPackageButton.centerXAnchor.constraint(equalTo: stack.centerXAnchor).isActive = true
        stack.addArrangedSubview(podButton)
        podButton.centerXAnchor.constraint(equalTo: stack.centerXAnchor).isActive = true
        stack.addArrangedSubview(carthageButton)
        carthageButton.centerXAnchor.constraint(equalTo: stack.centerXAnchor).isActive = true
    }
    
    private func setupButton(title: String, action: Selector) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 24)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: action, for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
    
    // MARK: - actions
    @objc private func frameworkAction() {
        MyLogger1.log("Hello, world")
    }
    
    @objc private func swiftPackageAction() {
        MyLogger2.log("Hello, world")
    }
    
    @objc private func podAction() {
        MyLogger3.log("Hello, world")
    }
    
    @objc private func carthageAction() {
        let json = JSON(["title":"SwiftyJSON", "date": "\(Date())"])
        if let title = json["title"].string,
           let date = json["date"].string {
            print("\(title) from carthage (\(date)): Hello, world!")
        }
    }


}

