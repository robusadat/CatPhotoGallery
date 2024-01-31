//
//  EntrySceenViewController.swift
//  CatPhotoGallery
//
//  Created by Sadat on 1/24/24.
//

import Foundation
import UIKit

class EntrySceenViewController: UIViewController {
    
    lazy var collectionViewButton: UIButton = {
        let button = UIButton()
        button.setTitle("My Cat", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemBlue
        button.addTarget(self, action: #selector(navigateToCatCollection), for: .touchUpInside)
        button.layer.cornerRadius = 10
        
        return button
    }()
    
    lazy var randomCatButton: UIButton = {
        let button = UIButton()
        button.setTitle("Random Cat", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemBlue
        button.addTarget(self, action: #selector(navigateToRandomCat), for: .touchUpInside)
        button.layer.cornerRadius = 10
        
        return button
    }()
    
    lazy var timerNotificationButton: UIButton = {
        let button = UIButton()
        button.setTitle("Timer Notification", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemBlue
        button.addTarget(self, action: #selector(navigateTTimerNotification), for: .touchUpInside)
        button.layer.cornerRadius = 10
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        view.addSubview(collectionViewButton)
        view.addSubview(randomCatButton)
        view.addSubview(timerNotificationButton)
        
        NSLayoutConstraint.activate([
            collectionViewButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            collectionViewButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            collectionViewButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            collectionViewButton.heightAnchor.constraint(equalToConstant: 50),
            
            randomCatButton.topAnchor.constraint(equalTo: collectionViewButton.bottomAnchor, constant: 20),
            randomCatButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            randomCatButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            randomCatButton.heightAnchor.constraint(equalToConstant: 50),
            
            timerNotificationButton.topAnchor.constraint(equalTo: randomCatButton.bottomAnchor, constant: 20),
            timerNotificationButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            timerNotificationButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            timerNotificationButton.heightAnchor.constraint(equalToConstant: 50),
            
        ])
    }
    
    @objc func navigateToCatCollection() {
        let viewController = TestCollectionViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @objc func navigateToRandomCat() {
        let viewController = RandomCatScreenViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @objc func navigateTTimerNotification() {
        let viewController = TimerNotificationScreenViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
}

