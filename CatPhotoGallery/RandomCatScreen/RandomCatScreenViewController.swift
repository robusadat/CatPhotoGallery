//
//  RandomCatScreenViewController.swift
//  CatPhotoGallery
//
//  Created by Sadat on 1/24/24.
//

import UIKit

class RandomCatScreenViewController: UIViewController {
    
    lazy var catImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .red
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
        
    }()
    
    lazy var randomCatButton: UIButton = {
        let button = UIButton()
        button.setTitle("Randomize", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 10
        
        return button
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        // Do any additional setup after loading the view.
    }
    
    private func setupView() {
        view.addSubview(catImageView)
        
        NSLayoutConstraint.activate([
            catImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            catImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            catImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            catImageView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.7)
        ])
    }

}
