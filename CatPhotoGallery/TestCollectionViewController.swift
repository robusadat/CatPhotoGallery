//
//  ViewController.swift
//  CatPhotoGallery
//
//  Created by Sadat on 1/22/24.
//

import UIKit
import SwiftUI

class TestCollectionViewController: UIViewController {
    
    let imageNames = Array(1...6).map {"Image\($0)"}
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 2
        layout.minimumInteritemSpacing = 2
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .systemBackground
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.register(ImageCollectionViewCell.self,
                                forCellWithReuseIdentifier: ImageCollectionViewCell.identifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        return collectionView
    }()
    
    var favorites = [Int]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        collectionView.dataSource = self
        collectionView.delegate = self
    }
}

extension TestCollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageNames.count
    }
    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell",
//                                                      for: indexPath)
//        cell.contentConfiguration = UIHostingConfiguration {
//            HStack {
//                Image(systemName: "star")
//                VStack(alignment: .leading) {
//                    Text("Favorites")
//                        .font(.title)
//                    Text("See all your liked content!")
//                        .font(.body)
//                }
//                .padding()
//                
//                Spacer()
//            }
//        }
//        cell.contentView.backgroundColor = .yellow
//        return cell
//    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCollectionViewCell.identifier, for: indexPath) as? ImageCollectionViewCell else {
            fatalError()
        }
        cell.imageView.image = UIImage(named:  imageNames[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (view.frame.size.width/2) - 4, height: (view.frame.size.width/2) - 4)
    }
    
    func collectionView(_ collectionView: UICollectionView, contextMenuConfigurationForItemAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {
        let config = UIContextMenuConfiguration(identifier: nil, previewProvider: nil) { [weak self] _ in
            
            let open = UIAction(title: "Open",
                                image: UIImage(systemName: "link"),
                                identifier: nil,
                                discoverabilityTitle: nil,
                                state: .off) { _ in
                print("Tapped open")
            }
            
            let favorite = UIAction(title: self?.favorites.contains(indexPath.row) == true ? "Remove Favorite" : "Favorite",
                                    image: self?.favorites.contains(indexPath.row) == true ? UIImage(systemName: "star.fill") : UIImage(systemName: "star"),
                                identifier: nil,
                                discoverabilityTitle: nil,
                                state: .off) { _ in
                if self?.favorites.contains(indexPath.row) == true {
                    self?.favorites.removeAll(where: {$0 == indexPath.row })
                } else {
                    self?.favorites.append(indexPath.row)
                }
                print("Tapped favorite")
            }
            
            let search = UIAction(title: "Search",
                                image: UIImage(systemName: "magnifyingglass"),
                                identifier: nil,
                                discoverabilityTitle: nil,
                                state: .off) { _ in
                print("Tapped search")
            }
            
            return UIMenu(title: "Actions",
                          image: nil,
                          options: UIMenu.Options.displayInline,
                          children: [open, favorite, search])
        }
        
        return config
    }
}

class ImageCollectionViewCell: UICollectionViewCell {
    static let identifier = "ImageCollectionViewCell"
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = contentView.bounds
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
    }
}
