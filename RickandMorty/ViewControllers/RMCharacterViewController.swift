//
//  RMCharacterViewController.swift
//  RickandMorty
//
//  Created by 潘博石 on 20/02/2024.
//

import UIKit
/// Controller to show and search for Character
final class RMCharacterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Character"
        
        let request = RMRequest(
            endpoint: .character,
            queryParameter: [
                URLQueryItem(name: "name", value: "rick"),
                URLQueryItem(name: "status", value: "alive")
            ]
        )
    }

}
