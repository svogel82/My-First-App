//
//  RoundedButton.swift
//  My First App
//
//  Created by Sebastian Vogel on 04.09.18.
//  Copyright © 2018 Sebastian Vogel. All rights reserved.
//

import UIKit

class RoundedButton: UIButton {

    override func awakeFromNib() {
        layer.cornerRadius = frame.size.height/2
    }

}
