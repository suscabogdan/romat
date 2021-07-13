//
//  RoundButton.swift
//  Romana clasa a 8a
//
//  Created by Susca Bogdan on 24/02/2018.
//  Copyright © 2018 Susca Bogdan. All rights reserved.
//

import UIKit

@IBDesignable
class RoundButton: UIButton {

    @IBInspectable var roundButton:Bool = false
    {
        didSet
        {
            if roundButton
            {
                layer.cornerRadius = frame.height / 2
            }
        }
    }
    override func prepareForInterfaceBuilder() {
        if roundButton {
            layer.cornerRadius = frame.height / 2
        }
    }
}
