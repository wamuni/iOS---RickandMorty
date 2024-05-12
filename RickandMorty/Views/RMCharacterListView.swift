//
//  RMCharacterListView.swift
//  RickandMorty
//
//  Created by 潘博石 on 05/03/2024.
//

import UIKit

final class RMCharacterListView: UIView {
    static let TAG: String = "RMCharacterListView"
    private let viewmodel = RMCharacterListViewViewModel()
    
    private let spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.hidesWhenStopped = true
        spinner.translatesAutoresizingMaskIntoConstraints = false
        return spinner
    }()
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.alpha = 0
        collectionView.isHidden = true
        collectionView.backgroundColor = .systemBlue
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false // KEY to avoid Binding warning
        backgroundColor = .systemBlue
        addSubviews(collectionView, spinner)
        spinner.startAnimating()
        addConstraints()
        setupCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    func addConstraints() {
        NSLayoutConstraint.activate([
            spinner.widthAnchor.constraint(equalToConstant: 100),
            spinner.heightAnchor.constraint(equalToConstant: 100),
            spinner.centerXAnchor.constraint(equalTo: centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.leftAnchor.constraint(equalTo: leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    func setupCollectionView() {
        collectionView.dataSource = viewmodel
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.collectionView.isHidden = false
            self.collectionView.alpha = 1
            self.spinner.stopAnimating()
        }
    }
}
