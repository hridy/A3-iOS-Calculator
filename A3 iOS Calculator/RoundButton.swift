//
//  RoundButton.swift
//  Calculator Layout iOS13
//
//  Created by Hridyansh on 2020-06-29.
//
//

import UIKit

//@IBDesignable
class RoundButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpButton()
    }
    
    func setUpButton(){
        //        layer.cornerRadius = 25
        if frame.height < frame.width {
            print("Height: \(frame.height)")
            layer.cornerRadius = frame.height / 2
        }
        else {
            print("Width: \(frame.width)")
            layer.cornerRadius = frame.width / 2
        }
        
    }
}
