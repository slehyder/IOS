//
//  CheckBox.swift
//  Cleanpress
//
//  Created by Aida Blanco on 7/15/15.
//  Copyright (c) 2015 ErisRamirez. All rights reserved.
//

import UIKit

class CheckBox: UIButton {

    //images
    let checkedImage = UIImage(named: "check1")
    let unCheckedImage = UIImage(named: "check2")
    let arrowdown = UIImage(named: "arrow_blue")
    let arrowup = UIImage(named: "arrow_blue_up")
    
    //condicion para cambiar la imagen
    var isChecked:Bool = true{
        didSet{
            if isChecked == false{
                self.setImage(checkedImage, forState: .Normal)
            }else{
                self.setImage(unCheckedImage, forState: .Normal)
            }
        }
    }
    
    //recepcion del boton
    override func awakeFromNib() {
        self.addTarget(self, action: "AcceptTermsButton:", forControlEvents: UIControlEvents.TouchUpInside)
        self.isChecked = false
        
        
        
    }
    
    //volver la imagen a su estado normal
    
    func AcceptTermsButton (sender:UIButton) {
        if(sender == self){
            if isChecked == true{
                isChecked = false
            }else{
                isChecked = true
            }
        }
    }
    var isClick:Bool = true{
        didSet{
            if isClick == false{
                self.setImage(checkedImage, forState: .Normal)
            }else{
                self.setImage(unCheckedImage, forState: .Normal)
            }
        }
    }
    
   
    

}
