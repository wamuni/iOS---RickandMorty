//
//  RMCharacterDetailView.swift
//  RickandMorty
//
//  Created by 潘博石 on 05/03/2024.
//

import UIKit

class RMCharacterDetailView: UIView {
    
    static let TAG: String = "RMCharacterDetailView"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .systemBlue
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
}
