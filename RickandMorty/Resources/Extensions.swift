//
//  Extensions.swift
//  RickandMorty
//
//  Created by 潘博石 on 12/05/2024.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach({ view in
            addSubview(view)
        })
    }
}
