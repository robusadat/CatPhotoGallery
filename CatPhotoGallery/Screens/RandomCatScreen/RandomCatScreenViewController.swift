//
//  RandomCatScreenViewController.swift
//  CatPhotoGallery
//
//  Created by Sadat on 1/24/24.
//

import UIKit

class RandomCatScreenViewController: UIViewController {
    
    let dataManager = RandomCatScreenDataManager()
    
    lazy var catImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .systemBackground
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
        
    }()
    
    lazy var randomCatButton: UIButton = {
        let button = UIButton()
        button.setTitle("Randomize", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(getCatImage), for: .touchUpInside)
        
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        getCatImage()
    }
    
    private func setupView() {
        view.addSubview(catImageView)
        view.addSubview(randomCatButton)
        
        NSLayoutConstraint.activate([
            catImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            catImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            catImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            catImageView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.7),
            
            randomCatButton.topAnchor.constraint(equalTo: catImageView.bottomAnchor, constant: 20),
            randomCatButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            randomCatButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            randomCatButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc func getCatImage() {
        self.dataManager.getRandomCatImage(completion: { image in
            DispatchQueue.main.async {
                self.catImageView.image = image
            }
        }
        )
    }
    
}
