//
//  Profile.swift
//  Cleanpress
//
//  Created by Aida Blanco on 7/7/15.
//  Copyright (c) 2015 ErisRamirez. All rights reserved.
//

import UIKit


class Profile: UIViewController, UITextFieldDelegate {
   

  
    //Principal Varibles
    @IBOutlet weak var EditButton: UIButton!
    @IBOutlet weak var FullNameText: UITextField!
    @IBOutlet weak var EmailText: UITextField!
    @IBOutlet weak var PhoneText: UITextField!
    @IBOutlet weak var CreditCardButton: UIButton!
    @IBOutlet weak var AddDirectoryButton: UIButton!
    @IBOutlet weak var ArrowGrayImage: UIImageView!
    @IBOutlet weak var ArrowImage2: UIImageView!
    @IBOutlet weak var ScrollView: UIScrollView!
    @IBOutlet weak var LastNameText: UITextField!
    @IBOutlet weak var BlueLine: UILabel!
    @IBOutlet var Window: UIView!
    @IBOutlet weak var ProgressBlue: UIProgressView!
    @IBOutlet weak var LabelBlueFirst: UILabel!
    
   
    
    //varibles of Credit Card Number
   
    @IBOutlet weak var CreditCardNumber: UITextField!
    @IBOutlet weak var ArrowBlueDown: UIImageView!
    @IBOutlet weak var LabelCreditCard: UILabel!
    @IBOutlet weak var MMFielText: UITextField!
    @IBOutlet weak var CFielText: UITextField!
    @IBOutlet weak var YFielText: UITextField!
    @IBOutlet weak var ZFielText: UITextField!
    @IBOutlet weak var AcceptTermsButton: UIButton!
    @IBOutlet weak var LabelCreditCard5: UILabel!
    @IBOutlet weak var LabelCreditCard2: UILabel!
    @IBOutlet weak var LabelCreditCard3: UILabel!
    @IBOutlet weak var LabelCredit1: UILabel!
    @IBOutlet weak var LabelCredit4: UILabel!
    @IBOutlet weak var EditButtonCredit: UIButton!
    
    //varibles of Home
    @IBOutlet weak var HomeButton: UIButton!
    @IBOutlet weak var ArrowBlue2: UIImageView!
    @IBOutlet weak var AddressHome: UITextField!
    @IBOutlet weak var CloseButton: UIButton!
    @IBOutlet weak var ZipcodeHome: UITextField!
    @IBOutlet weak var SpecialHome: UITextField!
    @IBOutlet weak var LabelHome1: UILabel!
    @IBOutlet weak var UnitedHome: UITextField!
    @IBOutlet weak var LabelHome2: UILabel!
    @IBOutlet weak var LabelHome3: UILabel!
    @IBOutlet weak var LabelHome4: UILabel!
    @IBOutlet weak var LabelHome5: UILabel!
    @IBOutlet weak var LabelHome6: UILabel!
    @IBOutlet weak var EditButtonHome: UIButton!
    @IBOutlet weak var LabelHome7: UILabel!
    
    //varibles of office
    @IBOutlet weak var EditButtonOffice: UIButton!
    @IBOutlet weak var OfficeButton: UIButton!
    @IBOutlet weak var ArrowBlueOffice: UIImageView!
    @IBOutlet weak var LabelOffice1: UILabel!
    @IBOutlet weak var AddressOffice: UITextField!
    @IBOutlet weak var CloseOffice: UIButton!
    @IBOutlet weak var LabelOffice2: UILabel!
    @IBOutlet weak var UnitedOffice: UITextField!
    @IBOutlet weak var ZipcodeOffice: UITextField!
    @IBOutlet weak var LabelOffice3: UILabel!
    @IBOutlet weak var LabelOffice4: UILabel!
    @IBOutlet weak var SpecialOffice: UITextField!
    @IBOutlet weak var LabelOffice6: UILabel!
    @IBOutlet weak var LabelOffice5: UILabel!
    @IBOutlet weak var LabelOffice7: UILabel!
    
    //varibles of Other
    @IBOutlet weak var OtherButton: UIButton!
    @IBOutlet weak var ArrowBlueOther: UIImageView!
    @IBOutlet weak var AddressButtonOther: UITextField!
    @IBOutlet weak var CloseOther: UIButton!
    @IBOutlet weak var UnitedOther: UITextField!
    @IBOutlet weak var ZipcodeOther: UITextField!
    @IBOutlet weak var LabelOther2: UILabel!
    @IBOutlet weak var LabelOther3: UILabel!
    @IBOutlet weak var SpecialOther: UITextField!
    @IBOutlet weak var LabelOther4: UILabel!
    @IBOutlet weak var SaveButton: UIButton!
    @IBOutlet weak var LabelOther5: UILabel!
    @IBOutlet weak var LabelOther6: UILabel!
    @IBOutlet weak var LabelOther1: UILabel!
    @IBOutlet weak var EditButtonOther: UIButton!
    @IBOutlet weak var LabelOther7: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
     
        
        //esconder el contenido detras de la linea principal
            self.BlueLine.layer.zPosition = 2

        
        //iphone 4s
        if (self.Window.frame.size.height <= 480 ){
            self.ScrollView.contentSize = CGSizeMake(self.view.frame.size.width, 1450)
            
            //traer boton de address
            self.AddDirectoryButton.frame = CGRectMake(self.AddDirectoryButton.frame.origin.x, 525, self.AddDirectoryButton.frame.size.width, self.AddDirectoryButton.frame.size.height)
            
            //traer flecha gris de address
            self.ArrowGrayImage.frame = CGRectMake(self.ArrowGrayImage.frame.origin.x, 535, self.ArrowGrayImage.frame.size.width, self.ArrowGrayImage.frame.size.height)
            
            //linea divisora de botones
             self.LabelBlueFirst.frame = CGRectMake(self.LabelBlueFirst.frame.origin.x,500, self.LabelBlueFirst.frame.size.width, self.LabelBlueFirst.frame.size.height)
            //credit card button up
               self.CreditCardButton.frame = CGRectMake(self.CreditCardButton.frame.origin.x, 440, self.CreditCardButton.frame.size.width, self.CreditCardButton.frame.size.height)
            //credit card arrow up
              self.ArrowImage2.frame = CGRectMake(self.ArrowImage2.frame.origin.x, 440, self.ArrowImage2.frame.size.width, self.ArrowImage2.frame.size.height)
            
            
           //iphone 5
        }else if (self.Window.frame.size.height > 480 && self.Window.frame.size.height <= 568 ){
            self.ScrollView.contentSize = CGSizeMake(self.view.frame.size.width, 1214)
            
            //traer boton de address up
            self.AddDirectoryButton.frame = CGRectMake(self.AddDirectoryButton.frame.origin.x, 510, self.AddDirectoryButton.frame.size.width, self.AddDirectoryButton.frame.size.height)
            
            //traer flecha gris address up
            self.ArrowGrayImage.frame = CGRectMake(self.ArrowGrayImage.frame.origin.x, 515, self.ArrowGrayImage.frame.size.width, self.ArrowGrayImage.frame.size.height)
            
            // credit car button up
            self.CreditCardButton.frame = CGRectMake(self.CreditCardButton.frame.origin.x, 440, self.CreditCardButton.frame.size.width, self.CreditCardButton.frame.size.height)
            
            //credit card arrow up
            self.ArrowImage2.frame = CGRectMake(self.ArrowImage2.frame.origin.x, 445, self.ArrowImage2.frame.size.width, self.ArrowImage2.frame.size.height)
            
            //line blue up
             self.LabelBlueFirst.frame = CGRectMake(self.LabelBlueFirst.frame.origin.x,490, self.LabelBlueFirst.frame.size.width, self.LabelBlueFirst.frame.size.height)
            
            
            //iphone 6
        }else if (self.Window.frame.size.height > 568 && self.Window.frame.size.height <= 667){
            self.ScrollView.contentSize = CGSizeMake(self.view.frame.size.width, 1300)
            
            //traer boton de address up
            self.AddDirectoryButton.frame = CGRectMake(self.AddDirectoryButton.frame.origin.x, 570, self.AddDirectoryButton.frame.size.width, self.AddDirectoryButton.frame.size.height)
            
            //traer flecha gris address up
            self.ArrowGrayImage.frame = CGRectMake(self.ArrowGrayImage.frame.origin.x, 580, self.ArrowGrayImage.frame.size.width, self.ArrowGrayImage.frame.size.height)
            
            //credit card button up
            self.CreditCardButton.frame = CGRectMake(self.CreditCardButton.frame.origin.x, 480, self.CreditCardButton.frame.size.width, self.CreditCardButton.frame.size.height)
            
            //credit card arrow up
            self.ArrowImage2.frame = CGRectMake(self.ArrowImage2.frame.origin.x, 480, self.ArrowImage2.frame.size.width, self.ArrowImage2.frame.size.height)
            
            //progressbar up
            self.ProgressBlue.frame = CGRectMake(self.ProgressBlue.frame.origin.x, 450, self.ProgressBlue.frame.size.width, self.ProgressBlue.frame.size.height)
            
            //edit button up
            self.EditButton.frame = CGRectMake(self.EditButton.frame.origin.x, 390, self.EditButton.frame.size.width, self.EditButton.frame.size.height)
            
            //line blue up
              self.LabelBlueFirst.frame = CGRectMake(self.LabelBlueFirst.frame.origin.x, 540, self.LabelBlueFirst.frame.size.width, self.LabelBlueFirst.frame.size.height)
            
            
            //iphone 6 plus
        }else if (self.Window.frame.size.height > 667 && self.Window.frame.size.height <= 736){
            self.ScrollView.contentSize = CGSizeMake(self.view.frame.size.width, 1214)
            
            //traer boton de address up
            self.AddDirectoryButton.frame = CGRectMake(self.AddDirectoryButton.frame.origin.x, 650, self.AddDirectoryButton.frame.size.width, self.AddDirectoryButton.frame.size.height)
            
            //traer flecha gris address up
            self.ArrowGrayImage.frame = CGRectMake(self.ArrowGrayImage.frame.origin.x, 650, self.ArrowGrayImage.frame.size.width, self.ArrowGrayImage.frame.size.height)
            
            //credit card button up
            self.CreditCardButton.frame = CGRectMake(self.CreditCardButton.frame.origin.x, 540, self.CreditCardButton.frame.size.width, self.CreditCardButton.frame.size.height)
            
            //credit card arrow up
            self.ArrowImage2.frame = CGRectMake(self.ArrowImage2.frame.origin.x, 550, self.ArrowImage2.frame.size.width, self.ArrowImage2.frame.size.height)
            
            //progressbar up
            self.ProgressBlue.frame = CGRectMake(self.ProgressBlue.frame.origin.x, 510, self.ProgressBlue.frame.size.width, self.ProgressBlue.frame.size.height)
            
            //edit button up
            self.EditButton.frame = CGRectMake(self.EditButton.frame.origin.x, 430, self.EditButton.frame.size.width, self.EditButton.frame.size.height)
            
            //line blue up
            self.LabelBlueFirst.frame = CGRectMake(self.LabelBlueFirst.frame.origin.x, 615, self.LabelBlueFirst.frame.size.width, self.LabelBlueFirst.frame.size.height)
            
            
            
            
        }
        
        //tamaño del scrollview
         /*self.ScrollView.contentSize = CGSizeMake(self.view.frame.size.width, 1214)*/
        
        
        
        //ocultar elementos credi card number
        self.CreditCardNumber.hidden = true
        self.ArrowBlueDown.hidden = true
        self.CFielText.hidden = true
        self.YFielText.hidden = true
        self.ZFielText.hidden = true
        self.AcceptTermsButton.hidden = true
        self.LabelCreditCard5.hidden = true
        self.LabelCreditCard2.hidden = true
        self.LabelCreditCard3.hidden = true
        self.MMFielText.hidden = true
        self.LabelCreditCard.hidden = true
        self.LabelCredit1.hidden = true
        self.LabelCredit4.hidden = true
        self.EditButtonCredit.hidden = true
        
        
        
        //ocultar elementos de home
        self.HomeButton.hidden = true
        self.ArrowBlue2.hidden = true
        self.AddressHome.hidden = true
        self.CloseButton.hidden = true
        self.ZipcodeHome.hidden = true
        self.SpecialHome.hidden = true
        self.UnitedHome.hidden = true
        self.LabelHome1.hidden = true
        self.LabelHome2.hidden = true
        self.LabelHome3.hidden = true
        self.LabelHome4.hidden = true
        self.LabelHome5.hidden = true
        self.LabelHome6.hidden = true
        self.EditButtonHome.hidden = true
        
        //ocultar elementos de office
        self.OfficeButton.hidden = true
        self.ArrowBlueOffice.hidden = true
        self.LabelOffice1.hidden = true
        self.AddressOffice.hidden = true
        self.CloseOffice.hidden = true
        self.LabelOffice2.hidden = true
        self.UnitedOffice.hidden = true
        self.ZipcodeOffice.hidden = true
        self.LabelOffice3.hidden = true
        self.LabelOffice4.hidden = true
        self.SpecialOffice.hidden = true
        self.LabelOffice6.hidden = true
        self.LabelOffice5.hidden = true
        self.EditButtonOffice.hidden = true
        
        //ocultar elementos de other
        self.OtherButton.hidden = true
        self.ArrowBlueOther.hidden = true
        self.AddressButtonOther.hidden = true
        self.CloseOther.hidden = true
        self.UnitedOther.hidden = true
        self.ZipcodeOther.hidden = true
        self.LabelOther2.hidden = true
        self.LabelOther3.hidden = true
        self.SpecialOther.hidden = true
        self.LabelOther4.hidden = true
        self.SaveButton.hidden = true
        self.LabelOther5.hidden = true
        self.LabelOther6.hidden = true
        self.LabelOther1.hidden = true
        self.EditButtonOther.hidden = true
        
        
        //estado del boton cuando inicia
        //self.EditButton.setTitle("Edit Info", forState: UIControlState.Normal)
        
        //prueba de campos llenos
        self.FullNameText.text = "Aida"
        self.EmailText.text = "hkshg@ndfg"
        self.PhoneText.text = "1135465"
        self.LastNameText.text = "ashdgaf"
       
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
 //BOTON DE EDIT INFO PRINCIPAL
   
    @IBAction func EditButtonTapped(sender: UIButton) {
        
        self.SaveButton.backgroundColor = UIColor(red:0, green:0.902,blue:0.525,alpha:1)
        //cambio del boton de editar
        //self.EditButton.setTitle("Guardar", forState: UIControlState.Normal)
         //self.ScrollView.contentSize = CGSizeMake(self.view.frame.size.width, 1520)
        
        //habilitar los campos que se pueden modificar
        self.FullNameText.enabled = true
        self.PhoneText.enabled = true
        self.LastNameText.enabled = true
        self.CreditCardButton.enabled = false
        self.AddDirectoryButton.enabled = false
        self.SaveButton.hidden = false
        
        //iphone 4
        if (self.Window.frame.size.height <= 480 ){
            self.ScrollView.contentSize = CGSizeMake(self.view.frame.size.width, 1515)
            
            //traer boton de address
            self.SaveButton.frame = CGRectMake(self.SaveButton.frame.origin.x, 600, self.SaveButton.frame.size.width, self.SaveButton.frame.size.height)
        }
            //iphone 5
        else if  (self.Window.frame.size.height > 480 && self.Window.frame.size.height <= 568 ){
            
            self.ScrollView.contentSize = CGSizeMake(self.view.frame.size.width,1655)
            
            self.SaveButton.frame = CGRectMake(self.SaveButton.frame.origin.x,580, self.SaveButton.frame.size.width, self.SaveButton.frame.size.height)
        
            
        }
            //iphone 6
        else if (self.Window.frame.size.height > 568 && self.Window.frame.size.height <= 667){
            
            self.ScrollView.contentSize = CGSizeMake(self.view.frame.size.width, 1895)
              self.SaveButton.frame = CGRectMake(self.SaveButton.frame.origin.x,640, self.SaveButton.frame.size.width, self.SaveButton.frame.size.height)
        }
        
            //iphone 6 plus
        else if (self.Window.frame.size.height > 667 && self.Window.frame.size.height <= 736){
            self.ScrollView.contentSize = CGSizeMake(self.view.frame.size.width, 2103)
            self.SaveButton.frame = CGRectMake(self.SaveButton.frame.origin.x,720, self.SaveButton.frame.size.width, self.SaveButton.frame.size.height)
        }
        //cambiar color del texto cuando el campo esta habilitado
        self.FullNameText.textColor = UIColor .blackColor()
        self.PhoneText.textColor = UIColor .blackColor()
        self.LastNameText.textColor = UIColor.blackColor()
       
        
    }//finalizacion del editinfo principal
    
    //EDITINFO DE CC
    @IBAction func EditInfoCC(sender: UIButton) {
        
        self.SaveButton.backgroundColor = UIColor(red:0, green:0.902,blue:0.525,alpha:1)
        
        self.SaveButton.enabled = true
        self.YFielText.enabled = true
        self.MMFielText.enabled = true
        self.CreditCardNumber.enabled = true
        self.CFielText.enabled = true
        self.ZFielText.enabled = true
        
        
        
        //cambiar color del texto cuando el campo esta habilitado
        self.YFielText.textColor = UIColor.blackColor()
        self.MMFielText.textColor = UIColor .blackColor()
        self.CreditCardNumber.textColor = UIColor.blackColor()
        self.CFielText.textColor = UIColor .blackColor()
        self.ZFielText.textColor = UIColor.blackColor()
        
        
        
    }//finalizacion del boton editinfo cc
    
    //EDIT INFO HOME 
    
    @IBAction func EditInfoH(sender: UIButton) {
        
         self.SaveButton.backgroundColor = UIColor(red:0, green:0.902,blue:0.525,alpha:1)
        self.AddressHome.enabled = true
        self.ZipcodeHome.enabled = true
        self.SpecialHome.enabled = true
        self.UnitedHome.enabled = true
        self.CloseButton.enabled = true
        
        
        self.AddressHome.text = "Aida"
        self.ZipcodeHome.text = "hkshg@ndfg"
        self.SpecialHome.text = "1135465"
        self.UnitedHome.text = "ashdgaf"
        //cambiar color del texto cuando el campo esta habilitado
        self.AddressHome.textColor = UIColor.blackColor()
        self.ZipcodeHome.textColor = UIColor .blackColor()
        self.SpecialHome.textColor = UIColor.blackColor()
        self.UnitedHome.textColor = UIColor .blackColor()

 
    }//FINALIZACION DEL EDIT INFO HOME
    
  //EDIT INFO OFFICE
    @IBAction func EditInfoOff(sender: UIButton) {
        self.SaveButton.backgroundColor = UIColor(red:0, green:0.902,blue:0.525,alpha:1)
        self.AddressOffice.enabled = true
        self.UnitedOffice.enabled = true
        self.SpecialOffice.enabled = true
        self.ZipcodeOffice.enabled = true
        self.CloseOffice.enabled = true
        
        self.AddressOffice.text = "Aida"
        self.UnitedOffice.text = "hkshg@ndfg"
        self.SpecialOffice.text = "1135465"
        self.ZipcodeOffice.text = "ashdgaf"
        
        //cambiar color del texto cuando el campo esta habilitado
        self.AddressOffice.textColor = UIColor.blackColor()
        self.UnitedOffice.textColor = UIColor .blackColor()
        self.SpecialOffice.textColor = UIColor.blackColor()
        self.ZipcodeOffice.textColor = UIColor .blackColor()
        
    }//FINALIZACION DE EDIT INFO OFFICE
    
    @IBAction func EditInfoOther(sender: UIButton) {
        
        self.SaveButton.backgroundColor = UIColor(red:0, green:0.902,blue:0.525,alpha:1)
        self.AddressButtonOther.enabled = true
        self.UnitedOther.enabled = true
        self.SpecialOther.enabled = true
        self.ZipcodeOther.enabled = true
        self.CloseOther.enabled = true
        
        self.AddressButtonOther.text = "Aida"
        self.UnitedOther.text = "hkshg@ndfg"
        self.SpecialOther.text = "1135465"
        self.ZipcodeOther.text = "ashdgaf"
        
        //cambiar color del texto cuando el campo esta habilitado
        self.AddressButtonOther.textColor = UIColor.blackColor()
        self.UnitedOther.textColor = UIColor .blackColor()
        self.SpecialOther.textColor = UIColor.blackColor()
        self.ZipcodeOther.textColor = UIColor .blackColor()
        
        
    }//finalizacion de editinfo other
    
    //CLOSE HOME BUTTON
    @IBAction func CloseH(sender: UIButton) {
        self.AddressHome.text = nil
        self.ZipcodeHome.text = nil
        self.SpecialHome.text = nil
        self.UnitedHome.text = nil
  
        
    }//finalizacion de close home
    
    //CLOSE OFFICE BUTTON
    @IBAction func CloseOff(sender: UIButton) {
        self.AddressOffice.text = nil
        self.UnitedOffice.text = nil
        self.SpecialOffice.text = nil
        self.ZipcodeOffice.text = nil
        
    }//finalizacion close office
    
    //CLOSE OTHER BUTTON
    @IBAction func CloseOth(sender: UIButton) {
        
        self.AddressButtonOther.text = nil
        self.UnitedOther.text = nil
        self.SpecialOther.text = nil
        self.ZipcodeOther.text = nil
    }
    //boton de creditcard
    
    @IBAction func CCIno(sender: UIButton) {
        
        //condicion para cerrar el boton de credit card, y volverlo a su estado inicial
        if(self.CreditCardNumber.hidden==false){//creditcardbutton open
            
            self.ArrowImage2.image = UIImage (named: "arrow_down")
            self.LabelBlueFirst.backgroundColor = UIColor(red:0.686,green:0.686,blue:0.686,alpha:1)
            
            
           
                
            self.CreditCardNumber.hidden = true
            self.ArrowBlueDown.hidden = true
            self.CFielText.hidden = true
            self.YFielText.hidden = true
            self.ZFielText.hidden = true
            self.AcceptTermsButton.hidden = true
            self.LabelCreditCard5.hidden = true
            self.LabelCreditCard2.hidden = true
            self.LabelCreditCard3.hidden = true
            self.MMFielText.hidden = true
            self.LabelCreditCard.hidden = true
            self.LabelCredit1.hidden = true
            self.LabelCredit4.hidden = true
            self.EditButtonCredit.hidden = true
            self.SaveButton.hidden = true
            self.EditButton.hidden = false
            
            
            
            self.HomeButton.hidden = true
            self.ArrowBlue2.hidden = true
            self.LabelHome1.hidden = true
            
            self.OfficeButton.hidden = true
            self.ArrowBlueOffice.hidden = true
            self.LabelOffice1.hidden = true
            
            self.OtherButton.hidden = true
            self.LabelOther5.hidden = true
            self.ArrowBlueOther.hidden = true
          
            //posicionamiento de los elementos
           
            //iphone 4
            if (self.Window.frame.size.height <= 480 ){
                self.ScrollView.contentSize = CGSizeMake(self.view.frame.size.width, 1520)
                
                //traer boton de address
                self.AddDirectoryButton.frame = CGRectMake(self.AddDirectoryButton.frame.origin.x, 525, self.AddDirectoryButton.frame.size.width, self.AddDirectoryButton.frame.size.height)
                
                //traer flecha gris de address
                self.ArrowGrayImage.frame = CGRectMake(self.ArrowGrayImage.frame.origin.x, 535, self.ArrowGrayImage.frame.size.width, self.ArrowGrayImage.frame.size.height)
                
                //linea divisora de botones
                self.LabelBlueFirst.frame = CGRectMake(self.LabelBlueFirst.frame.origin.x,500, self.LabelBlueFirst.frame.size.width, self.LabelBlueFirst.frame.size.height)
                //credit card button up
                self.CreditCardButton.frame = CGRectMake(self.CreditCardButton.frame.origin.x, 440, self.CreditCardButton.frame.size.width, self.CreditCardButton.frame.size.height)
                //credit card arrow up
                self.ArrowImage2.frame = CGRectMake(self.ArrowImage2.frame.origin.x, 440, self.ArrowImage2.frame.size.width, self.ArrowImage2.frame.size.height)
                
            }//finalizacion iphone 4
                
            //iphone 5
            else if  (self.Window.frame.size.height > 480 && self.Window.frame.size.height <= 568 ){
                self.ScrollView.contentSize = CGSizeMake(self.view.frame.size.width, 1214)
                
                //traer boton de address up
                self.AddDirectoryButton.frame = CGRectMake(self.AddDirectoryButton.frame.origin.x, 510, self.AddDirectoryButton.frame.size.width, self.AddDirectoryButton.frame.size.height)
                
                //traer flecha gris address up
                self.ArrowGrayImage.frame = CGRectMake(self.ArrowGrayImage.frame.origin.x, 515, self.ArrowGrayImage.frame.size.width, self.ArrowGrayImage.frame.size.height)
                
                // credit car button up
                self.CreditCardButton.frame = CGRectMake(self.CreditCardButton.frame.origin.x, 440, self.CreditCardButton.frame.size.width, self.CreditCardButton.frame.size.height)
                
                //credit card arrow up
                self.ArrowImage2.frame = CGRectMake(self.ArrowImage2.frame.origin.x, 445, self.ArrowImage2.frame.size.width, self.ArrowImage2.frame.size.height)
                
                //line blue up
                self.LabelBlueFirst.frame = CGRectMake(self.LabelBlueFirst.frame.origin.x,490, self.LabelBlueFirst.frame.size.width, self.LabelBlueFirst.frame.size.height)
                
               
                
            }//finalizacion iphone 5
                
                //iphone 6
            else if (self.Window.frame.size.height > 568 && self.Window.frame.size.height <= 667){
                self.ScrollView.contentSize = CGSizeMake(self.view.frame.size.width, 1300)
                
                //traer boton de address up
                self.AddDirectoryButton.frame = CGRectMake(self.AddDirectoryButton.frame.origin.x, 570, self.AddDirectoryButton.frame.size.width, self.AddDirectoryButton.frame.size.height)
                
                //traer flecha gris address up
                self.ArrowGrayImage.frame = CGRectMake(self.ArrowGrayImage.frame.origin.x, 580, self.ArrowGrayImage.frame.size.width, self.ArrowGrayImage.frame.size.height)
                
                //credit card button up
                self.CreditCardButton.frame = CGRectMake(self.CreditCardButton.frame.origin.x, 480, self.CreditCardButton.frame.size.width, self.CreditCardButton.frame.size.height)
                
                //credit card arrow up
                self.ArrowImage2.frame = CGRectMake(self.ArrowImage2.frame.origin.x, 480, self.ArrowImage2.frame.size.width, self.ArrowImage2.frame.size.height)
                
                //progressbar up
                self.ProgressBlue.frame = CGRectMake(self.ProgressBlue.frame.origin.x, 450, self.ProgressBlue.frame.size.width, self.ProgressBlue.frame.size.height)
                
                //edit button up
                self.EditButtonCredit.frame = CGRectMake(self.EditButton.frame.origin.x, 390, self.EditButtonCredit.frame.size.width, self.EditButtonCredit.frame.size.height)
                
                //line blue up
                self.LabelBlueFirst.frame = CGRectMake(self.LabelBlueFirst.frame.origin.x, 540, self.LabelBlueFirst.frame.size.width, self.LabelBlueFirst.frame.size.height)
                
            }//finalizacion iphone 6
            
                //iphone 6 plus
            else if (self.Window.frame.size.height > 667 && self.Window.frame.size.height <= 736){
                self.ScrollView.contentSize = CGSizeMake(self.view.frame.size.width, 1214)
                
                //traer boton de address up
                self.AddDirectoryButton.frame = CGRectMake(self.AddDirectoryButton.frame.origin.x, 640, self.AddDirectoryButton.frame.size.width, self.AddDirectoryButton.frame.size.height)
                
                //traer flecha gris address up
                self.ArrowGrayImage.frame = CGRectMake(self.ArrowGrayImage.frame.origin.x, 650, self.ArrowGrayImage.frame.size.width, self.ArrowGrayImage.frame.size.height)
                
                //credit card button up
                self.CreditCardButton.frame = CGRectMake(self.CreditCardButton.frame.origin.x, 540, self.CreditCardButton.frame.size.width, self.CreditCardButton.frame.size.height)
                
                //credit card arrow up
                self.ArrowImage2.frame = CGRectMake(self.ArrowImage2.frame.origin.x, 550, self.ArrowImage2.frame.size.width, self.ArrowImage2.frame.size.height)
                
                //progressbar up
                self.ProgressBlue.frame = CGRectMake(self.ProgressBlue.frame.origin.x, 510, self.ProgressBlue.frame.size.width, self.ProgressBlue.frame.size.height)
                
                //edit button up
                self.EditButtonCredit.frame = CGRectMake(self.EditButtonCredit.frame.origin.x, 430, self.EditButtonCredit.frame.size.width, self.EditButtonCredit.frame.size.height)
                
                //line blue up
                self.LabelBlueFirst.frame = CGRectMake(self.LabelBlueFirst.frame.origin.x, 615, self.LabelBlueFirst.frame.size.width, self.LabelBlueFirst.frame.size.height)
                

            }

            
            //cuando el boton credit car se abre, cierra los elementos de Addressbutton
        
        }else if(self.HomeButton.hidden==false){
            
            //cambiar las flechas hacia arriba o hacia abajo
            self.ArrowImage2.image = UIImage (named: "arrow_up")
             self.ArrowGrayImage.image = UIImage (named: "arrow_down")
            
            //cambiar de color la linea divisora de los botones y el color del boton save
            self.LabelBlueFirst.backgroundColor = UIColor(red:0,green:0.882,blue:0.929,alpha:1)
            self.SaveButton.backgroundColor = UIColor(red:0.686,green:0.686,blue:0.686,alpha:1)
            
            //desahabilitar el boton save
            self.SaveButton.enabled = false
            
            self.HomeButton.hidden = true
            self.ArrowBlue2.hidden = true
            self.LabelHome1.hidden = true
            
            self.OfficeButton.hidden = true
            self.ArrowBlueOffice.hidden = true
            self.LabelOffice1.hidden = true
            
            self.OtherButton.hidden = true
            self.LabelOther5.hidden = true
            self.ArrowBlueOther.hidden = true
            
            self.CreditCardNumber.hidden = false
            self.ArrowBlueDown.hidden = false
            self.CFielText.hidden = false
            self.YFielText.hidden = false
            self.ZFielText.hidden = false
            self.AcceptTermsButton.hidden = false
            self.LabelCreditCard5.hidden = false
            self.LabelCreditCard2.hidden = false
            self.LabelCreditCard3.hidden = false
            self.MMFielText.hidden = false
            self.LabelCreditCard.hidden = false
            self.LabelCredit1.hidden = false
            self.LabelCredit4.hidden = false
            self.EditButtonCredit.hidden = false
            self.SaveButton.hidden = false
            self.EditButtonCredit.hidden = false
            
        
            
            //iphone 4
        
            if (self.Window.frame.size.height <= 480 ){
                self.ScrollView.contentSize = CGSizeMake(self.view.frame.size.width, 1795)
                
                
                //posicionamiento de addressbutton
                self.AddDirectoryButton.frame = CGRectMake(self.AddDirectoryButton.frame.origin.x,750, self.AddDirectoryButton.frame.size.width, self.AddDirectoryButton.frame.size.height)
                
                //posicionamiento LabelBlueFirst
                self.LabelBlueFirst.frame = CGRectMake(self.LabelBlueFirst.frame.origin.x,740, self.LabelBlueFirst.frame.size.width, self.LabelBlueFirst.frame.size.height)
            
                   self.ArrowGrayImage.frame = CGRectMake(self.ArrowGrayImage.frame.origin.x,760, self.ArrowGrayImage.frame.size.width, self.ArrowGrayImage.frame.size.height)
                
                 self.LabelCreditCard2.frame = CGRectMake(self.LabelCreditCard2.frame.origin.x,530, self.LabelCreditCard2.frame.size.width, self.LabelCreditCard2.frame.size.height)
                
                 self.LabelCreditCard5.frame = CGRectMake(self.LabelCreditCard5.frame.origin.x,585, self.LabelCreditCard5.frame.size.width, self.LabelCreditCard5.frame.size.height)
                
                self.SaveButton.frame = CGRectMake(self.SaveButton.frame.origin.x,825, self.SaveButton.frame.size.width, self.SaveButton.frame.size.height)
                
             
                
            }// finalizacion del if Iphone4
                
                //iphone 5
            else if (self.Window.frame.size.height > 480 && self.Window.frame.size.height <= 568 ){
                self.ScrollView.contentSize = CGSizeMake(self.view.frame.size.width, 1960)
                
                //traer boton de address up
                self.AddDirectoryButton.frame = CGRectMake(self.AddDirectoryButton.frame.origin.x, 760, self.AddDirectoryButton.frame.size.width, self.AddDirectoryButton.frame.size.height)
                
                //traer flecha gris address up
                self.ArrowGrayImage.frame = CGRectMake(self.ArrowGrayImage.frame.origin.x, 770, self.ArrowGrayImage.frame.size.width, self.ArrowGrayImage.frame.size.height)
                
                self.LabelBlueFirst.frame = CGRectMake(self.LabelBlueFirst.frame.origin.x,750, self.LabelBlueFirst.frame.size.width, self.LabelBlueFirst.frame.size.height)
                
                self.SaveButton.frame = CGRectMake(self.SaveButton.frame.origin.x,820, self.SaveButton.frame.size.width, self.SaveButton.frame.size.height)
                
              
            }// finalizacion de iphone5
                
                //iphone 6
            else if (self.Window.frame.size.height > 568 && self.Window.frame.size.height <= 667){
                self.ScrollView.contentSize = CGSizeMake(self.view.frame.size.width, 2155)
                
                //traer boton de address up
                self.AddDirectoryButton.frame = CGRectMake(self.AddDirectoryButton.frame.origin.x, 750, self.AddDirectoryButton.frame.size.width, self.AddDirectoryButton.frame.size.height)
                
                //traer flecha gris address up
                self.ArrowGrayImage.frame = CGRectMake(self.ArrowGrayImage.frame.origin.x, 760, self.ArrowGrayImage.frame.size.width, self.ArrowGrayImage.frame.size.height)
                
                //line blue up
                self.LabelBlueFirst.frame = CGRectMake(self.LabelBlueFirst.frame.origin.x, 740, self.LabelBlueFirst.frame.size.width, self.LabelBlueFirst.frame.size.height)
                
                //save button
                self.SaveButton.frame = CGRectMake(self.SaveButton.frame.origin.x, 820, self.SaveButton.frame.size.width, self.SaveButton.frame.size.height)
                
                //first line blue
                   self.ProgressBlue.frame = CGRectMake(self.ProgressBlue.frame.origin.x, 420, self.ProgressBlue.frame.size.width, self.ProgressBlue.frame.size.height)
                //credut card button
                 self.CreditCardButton.frame = CGRectMake(self.CreditCardButton.frame.origin.x, 440, self.CreditCardButton.frame.size.width, self.CreditCardButton.frame.size.height)
                //credit card arrow
                self.ArrowImage2.frame = CGRectMake(self.ArrowImage2.frame.origin.x, 450, self.ArrowImage2.frame.size.width, self.ArrowImage2.frame.size.height)
                
                  self.LabelCredit4.frame = CGRectMake(self.LabelCredit4.frame.origin.x, 640, self.LabelCredit4.frame.size.width, self.LabelCredit4.frame.size.height)
                
            }//finalizacion iphone 6
            
                //iphone 6 plus
            else if (self.Window.frame.size.height > 667 && self.Window.frame.size.height <= 736){
                self.ScrollView.contentSize = CGSizeMake(self.view.frame.size.width, 2345)
                
                //traer boton de address up
                self.AddDirectoryButton.frame = CGRectMake(self.AddDirectoryButton.frame.origin.x, 790, self.AddDirectoryButton.frame.size.width, self.AddDirectoryButton.frame.size.height)
                
                //traer flecha gris address up
                self.ArrowGrayImage.frame = CGRectMake(self.ArrowGrayImage.frame.origin.x, 800, self.ArrowGrayImage.frame.size.width, self.ArrowGrayImage.frame.size.height)
                
                //credit card button up
                self.CreditCardButton.frame = CGRectMake(self.CreditCardButton.frame.origin.x, 440, self.CreditCardButton.frame.size.width, self.CreditCardButton.frame.size.height)
                
                //credit card arrow up
                self.ArrowImage2.frame = CGRectMake(self.ArrowImage2.frame.origin.x, 450, self.ArrowImage2.frame.size.width, self.ArrowImage2.frame.size.height)
                
                //progressbar up
                self.ProgressBlue.frame = CGRectMake(self.ProgressBlue.frame.origin.x, 420, self.ProgressBlue.frame.size.width, self.ProgressBlue.frame.size.height)
                
                //line blue up
                self.LabelBlueFirst.frame = CGRectMake(self.LabelBlueFirst.frame.origin.x, 775, self.LabelBlueFirst.frame.size.width, self.LabelBlueFirst.frame.size.height)
                
                self.LabelCredit4.frame = CGRectMake(self.LabelCredit4.frame.origin.x, 630, self.LabelCredit4.frame.size.width, self.LabelCredit4.frame.size.height)
                
                self.AcceptTermsButton.frame = CGRectMake(self.AcceptTermsButton.frame.origin.x, 650,self.AcceptTermsButton.frame.size.width, self.AcceptTermsButton.frame.size.height)
                
                self.SaveButton.frame = CGRectMake(self.SaveButton.frame.origin.x,875,self.SaveButton.frame.size.width, self.AcceptTermsButton.frame.size.height)
                
                self.EditButtonCredit.frame = CGRectMake(self.EditButtonCredit.frame.origin.x,720,self.EditButtonCredit.frame.size.width, self.EditButtonCredit.frame.size.height)
             
                
                
            }

            
        
        }
        
        //credit card button open
                else{
            
            //change the arrow donw image for the arrowup
            self.ArrowImage2.image = UIImage (named: "arrow_up")
            
            //change the color of the firstblueline
            self.LabelBlueFirst.backgroundColor = UIColor(red:0,green:0.882,blue:0.929,alpha:1)
            self.SaveButton.backgroundColor = UIColor (red:0.686,green:0.686,blue:0.686,alpha:1)
        
            self.SaveButton.enabled = false
            
           
            //mostrar los elementos de ese boton
            self.CreditCardNumber.hidden = false
            self.ArrowBlueDown.hidden = false
            self.CFielText.hidden = false
            self.YFielText.hidden = false
            self.ZFielText.hidden = false
            self.AcceptTermsButton.hidden = false
            self.LabelCreditCard5.hidden = false
            self.LabelCreditCard2.hidden = false
            self.LabelCreditCard3.hidden = false
            self.MMFielText.hidden = false
            self.LabelCreditCard.hidden = false
            self.LabelBlueFirst.hidden = false
            self.LabelCredit4.hidden = false
            self.EditButtonCredit.hidden = false
            self.SaveButton.hidden = false
            self.EditButtonCredit.hidden = false
            self.EditButton.hidden = true
            
            
            
            //llenado de los campos
            self.CFielText.text = "Aida"
            self.YFielText.text = "hkshg@ndfg"
            self.ZFielText.text = "1135465"
            self.MMFielText.text = "ashdgaf"
            self.CreditCardNumber.text = "hsgkhkjg"
            
            //desahabilitar campos
            self.CreditCardNumber.enabled = false
            self.CFielText.enabled = false
            self.YFielText.enabled = false
            self.ZFielText.enabled = false
            self.MMFielText.enabled = false
            self.CreditCardNumber.enabled = false
            
            
            //posicion de los elementos Iphone 5
            if (self.Window.frame.size.height > 480 && self.Window.frame.size.height <= 568 ){
                self.ScrollView.contentSize = CGSizeMake(self.view.frame.size.width, 1890)
                
                //traer boton de address up
                self.AddDirectoryButton.frame = CGRectMake(self.AddDirectoryButton.frame.origin.x, 760, self.AddDirectoryButton.frame.size.width, self.AddDirectoryButton.frame.size.height)
                
                //traer flecha gris address up
                self.ArrowGrayImage.frame = CGRectMake(self.ArrowGrayImage.frame.origin.x, 770, self.ArrowGrayImage.frame.size.width, self.ArrowGrayImage.frame.size.height)
                
                self.LabelBlueFirst.frame = CGRectMake(self.LabelBlueFirst.frame.origin.x,750, self.LabelBlueFirst.frame.size.width, self.LabelBlueFirst.frame.size.height)
                
                self.SaveButton.frame = CGRectMake(self.SaveButton.frame.origin.x,820, self.SaveButton.frame.size.width, self.SaveButton.frame.size.height)
                
                //iphone 4
            }else if (self.Window.frame.size.height <= 480 ){
                self.ScrollView.contentSize = CGSizeMake(self.view.frame.size.width, 1730)
                
                //traer boton de address
                self.AddDirectoryButton.frame = CGRectMake(self.AddDirectoryButton.frame.origin.x, 750, self.AddDirectoryButton.frame.size.width, self.AddDirectoryButton.frame.size.height)
                
                //traer flecha gris de address
                self.ArrowGrayImage.frame = CGRectMake(self.ArrowGrayImage.frame.origin.x, 760, self.ArrowGrayImage.frame.size.width, self.ArrowGrayImage.frame.size.height)
                
                self.LabelBlueFirst.frame = CGRectMake(self.LabelBlueFirst.frame.origin.x,740, self.LabelBlueFirst.frame.size.width, self.LabelBlueFirst.frame.size.height)
                
              self.SaveButton.frame = CGRectMake(self.SaveButton.frame.origin.x,820, self.SaveButton.frame.size.width, self.SaveButton.frame.size.height)
            }
                
                //iphone 6
                
            else if (self.Window.frame.size.height > 568 && self.Window.frame.size.height <= 667){
                self.ScrollView.contentSize = CGSizeMake(self.view.frame.size.width, 2075)
                
                //traer boton de address up
                self.AddDirectoryButton.frame = CGRectMake(self.AddDirectoryButton.frame.origin.x, 750, self.AddDirectoryButton.frame.size.width, self.AddDirectoryButton.frame.size.height)
                
                //traer flecha gris address up
                self.ArrowGrayImage.frame = CGRectMake(self.ArrowGrayImage.frame.origin.x, 760, self.ArrowGrayImage.frame.size.width, self.ArrowGrayImage.frame.size.height)
                
                //line blue up
                self.LabelBlueFirst.frame = CGRectMake(self.LabelBlueFirst.frame.origin.x, 740, self.LabelBlueFirst.frame.size.width, self.LabelBlueFirst.frame.size.height)
                
                self.CreditCardButton.frame = CGRectMake(self.CreditCardButton.frame.origin.x, 430, self.CreditCardButton.frame.size.width, self.CreditCardButton.frame.size.height)
                
                //credit card arrow up
                self.ArrowImage2.frame = CGRectMake(self.ArrowImage2.frame.origin.x, 440, self.ArrowImage2.frame.size.width, self.ArrowImage2.frame.size.height)
                
                //primer boton de edit info
                //self.EditButton.frame = CGRectMake(self.EditButton.frame.origin.x, 360, self.EditButton.frame.size.width, self.EditButton.frame.size.height)
                //linea azul principal
                self.ProgressBlue.frame = CGRectMake(self.ProgressBlue.frame.origin.x, 420, self.ProgressBlue.frame.size.width, self.ProgressBlue.frame.size.height)
                
                self.LabelCredit4.frame = CGRectMake(self.LabelCredit4.frame.origin.x, 635, self.LabelCredit4.frame.size.width, self.LabelCredit4.frame.size.height)
                
                self.SaveButton.frame = CGRectMake(self.SaveButton.frame.origin.x, 820, self.SaveButton.frame.size.width, self.SaveButton.frame.size.height)
                
            }//iphone 6 plus
                
            else if (self.Window.frame.size.height > 667 && self.Window.frame.size.height <= 736){
                self.ScrollView.contentSize = CGSizeMake(self.view.frame.size.width, 2210)
                
                //traer boton de address up
                self.AddDirectoryButton.frame = CGRectMake(self.AddDirectoryButton.frame.origin.x, 760, self.AddDirectoryButton.frame.size.width, self.AddDirectoryButton.frame.size.height)
                
                //traer flecha gris address up
                self.ArrowGrayImage.frame = CGRectMake(self.ArrowGrayImage.frame.origin.x, 775, self.ArrowGrayImage.frame.size.width, self.ArrowGrayImage.frame.size.height)
                
                //credit card button up
                self.CreditCardButton.frame = CGRectMake(self.CreditCardButton.frame.origin.x, 450, self.CreditCardButton.frame.size.width, self.CreditCardButton.frame.size.height)
                
                //credit card arrow up
                self.ArrowImage2.frame = CGRectMake(self.ArrowImage2.frame.origin.x, 460, self.ArrowImage2.frame.size.width, self.ArrowImage2.frame.size.height)
                
                //progressbar up
                self.ProgressBlue.frame = CGRectMake(self.ProgressBlue.frame.origin.x, 430, self.ProgressBlue.frame.size.width, self.ProgressBlue.frame.size.height)
                
                //edit button up
                //self.EditButton.frame = CGRectMake(self.EditButton.frame.origin.x, 370, self.EditButton.frame.size.width, self.EditButton.frame.size.height)
                
                //line blue up
                self.LabelBlueFirst.frame = CGRectMake(self.LabelBlueFirst.frame.origin.x, 750, self.LabelBlueFirst.frame.size.width, self.LabelBlueFirst.frame.size.height)
                
                self.LabelCredit4.frame = CGRectMake(self.LabelCredit4.frame.origin.x, 645, self.LabelCredit4.frame.size.width, self.LabelCredit4.frame.size.height)
                
                self.AcceptTermsButton.frame = CGRectMake(self.AcceptTermsButton.frame.origin.x, 635,self.AcceptTermsButton.frame.size.width, self.AcceptTermsButton.frame.size.height)
                
            self.SaveButton.frame = CGRectMake(self.SaveButton.frame.origin.x,830,self.SaveButton.frame.size.width, self.SaveButton.frame.size.height)
                
                self.EditButtonCredit.frame = CGRectMake(self.EditButtonCredit.frame.origin.x,700,self.EditButtonCredit.frame.size.width, self.EditButtonCredit.frame.size.height)
                
                
                
            }
          
        }
        
        
    
    }//finish of func credit card button
    

    @IBAction func AddButton(sender: UIButton) {
        
        //cuando el boton credit card esta abierto, cierra el mismo y abre el de addbutton
        if(self.CreditCardNumber.hidden==false){
        self.LabelBlueFirst.backgroundColor = UIColor(red:0.686,green:0.686,blue:0.686,alpha:1)
            
            
            
            self.ArrowGrayImage.image = UIImage (named: "arrow_up")
          
            self.ArrowImage2.image = UIImage (named: "arrow_down")
            
            self.HomeButton.hidden = false
            self.ArrowBlue2.hidden = false
            self.LabelHome1.hidden = false
            
            self.OfficeButton.hidden = false
            self.ArrowBlueOffice.hidden = false
            self.LabelOffice1.hidden = false
            
            self.OtherButton.hidden = false
            self.LabelOther5.hidden = false
            self.ArrowBlueOther.hidden = false
            self.SaveButton.hidden = true
            
            self.CreditCardNumber.hidden = true
            self.ArrowBlueDown.hidden =  true
            self.CFielText.hidden =  true
            self.YFielText.hidden =  true
            self.ZFielText.hidden =  true
            self.AcceptTermsButton.hidden =  true
            self.LabelCreditCard5.hidden =  true
            self.LabelCreditCard2.hidden =  true
            self.LabelCreditCard3.hidden =  true
            self.MMFielText.hidden =  true
            self.LabelCreditCard.hidden =  true
            self.LabelBlueFirst.hidden =  true
            self.LabelCredit4.hidden =  true
            self.EditButtonCredit.hidden =  true
            self.LabelBlueFirst.hidden = false
         
       
  
            
                //iphone 4
            if (self.Window.frame.size.height <= 480 ){
                self.ScrollView.contentSize = CGSizeMake(self.view.frame.size.width, 1680)
                
                //traer boton de address
                self.HomeButton.frame = CGRectMake(self.HomeButton.frame.origin.x, 570, self.HomeButton.frame.size.width, self.HomeButton.frame.size.height)
                
                //traer flecha gris de address
                self.ArrowBlue2.frame = CGRectMake(self.ArrowBlue2.frame.origin.x, 590, self.ArrowBlue2.frame.size.width, self.ArrowBlue2.frame.size.height)
                
                //label home
                self.LabelHome1.frame = CGRectMake(self.LabelHome1.frame.origin.x,600, self.LabelHome1.frame.size.width, self.LabelHome1.frame.size.height)
                
                //office button
                self.OfficeButton.frame = CGRectMake(self.OfficeButton.frame.origin.x,610, self.OfficeButton.frame.size.width, self.OfficeButton.frame.size.height)
                
                //arrow blue office
                self.ArrowBlueOffice.frame = CGRectMake(self.ArrowBlueOffice.frame.origin.x,640, self.ArrowBlueOffice.frame.size.width, self.ArrowBlueOffice.frame.size.height)
                
                //line office
                self.LabelOffice1.frame = CGRectMake(self.LabelOffice1.frame.origin.x,655, self.LabelOffice1.frame.size.width, self.LabelOffice1.frame.size.height)
                
                //Other Button
                self.OtherButton.frame = CGRectMake(self.OtherButton.frame.origin.x,660, self.OtherButton.frame.size.width, self.OtherButton.frame.size.height)
                
                //arrow blue other
                self.ArrowBlueOther.frame = CGRectMake(self.ArrowBlueOther.frame.origin.x,690, self.ArrowBlueOther.frame.size.width, self.ArrowBlueOther.frame.size.height)
                
                //line Other
                self.LabelOther5.frame = CGRectMake(self.LabelOther5.frame.origin.x,705, self.LabelOther5.frame.size.width, self.LabelOther5.frame.size.height)
               
                self.AddDirectoryButton.frame = CGRectMake(self.AddDirectoryButton.frame.origin.x, 525, self.AddDirectoryButton.frame.size.width, self.AddDirectoryButton.frame.size.height)
                
                //traer flecha gris de address
                self.ArrowGrayImage.frame = CGRectMake(self.ArrowGrayImage.frame.origin.x, 535, self.ArrowGrayImage.frame.size.width, self.ArrowGrayImage.frame.size.height)
                
                self.LabelBlueFirst.frame = CGRectMake(self.LabelBlueFirst.frame.origin.x, 500, self.LabelBlueFirst.frame.size.width, self.LabelBlueFirst.frame.size.height)
                
                self.ArrowImage2.frame = CGRectMake(self.ArrowImage2.frame.origin.x, 450, self.ArrowImage2.frame.size.width, self.ArrowImage2.frame.size.height)
                
                
                
            }//finalizacion de Iphone 4
            
                //iphone5
            else if (self.Window.frame.size.height > 480 && self.Window.frame.size.height <= 568 ){
                self.ScrollView.contentSize = CGSizeMake(self.view.frame.size.width, 1860)
                
                //traer boton de address up
                self.AddDirectoryButton.frame = CGRectMake(self.AddDirectoryButton.frame.origin.x, 530, self.AddDirectoryButton.frame.size.width, self.AddDirectoryButton.frame.size.height)
                
                //traer flecha gris address up
                self.ArrowGrayImage.frame = CGRectMake(self.ArrowGrayImage.frame.origin.x, 540, self.ArrowGrayImage.frame.size.width, self.ArrowGrayImage.frame.size.height)
                
                //linea divisora de botones
                self.LabelBlueFirst.frame = CGRectMake(self.LabelBlueFirst.frame.origin.x,510, self.LabelBlueFirst.frame.size.width, self.LabelBlueFirst.frame.size.height)
                
                //traer boton de address
                self.HomeButton.frame = CGRectMake(self.HomeButton.frame.origin.x, 570, self.HomeButton.frame.size.width, self.HomeButton.frame.size.height)
                
                //traer flecha gris de address
                self.ArrowBlue2.frame = CGRectMake(self.ArrowBlue2.frame.origin.x, 590, self.ArrowBlue2.frame.size.width, self.ArrowBlue2.frame.size.height)
                
                //label home
                self.LabelHome1.frame = CGRectMake(self.LabelHome1.frame.origin.x,600, self.LabelHome1.frame.size.width, self.LabelHome1.frame.size.height)
                
                //office button
                self.OfficeButton.frame = CGRectMake(self.OfficeButton.frame.origin.x,610, self.OfficeButton.frame.size.width, self.OfficeButton.frame.size.height)
                
                //arrow blue office
                self.ArrowBlueOffice.frame = CGRectMake(self.ArrowBlueOffice.frame.origin.x,640, self.ArrowBlueOffice.frame.size.width, self.ArrowBlueOffice.frame.size.height)
                
                //line office
                self.LabelOffice1.frame = CGRectMake(self.LabelOffice1.frame.origin.x,655, self.LabelOffice1.frame.size.width, self.LabelOffice1.frame.size.height)
                
                //Other Button
                self.OtherButton.frame = CGRectMake(self.OtherButton.frame.origin.x,660, self.OtherButton.frame.size.width, self.OtherButton.frame.size.height)
                
                //arrow blue other
                self.ArrowBlueOther.frame = CGRectMake(self.ArrowBlueOther.frame.origin.x,690, self.ArrowBlueOther.frame.size.width, self.ArrowBlueOther.frame.size.height)
                
                //line Other
                self.LabelOther5.frame = CGRectMake(self.LabelOther5.frame.origin.x,705, self.LabelOther5.frame.size.width, self.LabelOther5.frame.size.height)
                

                
                
            }//finalizacion iphone 5
                
                //iphone 6
            else if (self.Window.frame.size.height > 568 && self.Window.frame.size.height <= 667){
                self.ScrollView.contentSize = CGSizeMake(self.view.frame.size.width, 2030)
                
                //traer boton de address
                self.HomeButton.frame = CGRectMake(self.HomeButton.frame.origin.x, 560, self.HomeButton.frame.size.width, self.HomeButton.frame.size.height)
                
                //traer flecha gris de address
                self.ArrowBlue2.frame = CGRectMake(self.ArrowBlue2.frame.origin.x,580, self.ArrowBlue2.frame.size.width, self.ArrowBlue2.frame.size.height)
                
                self.LabelHome1.frame = CGRectMake(self.LabelHome1.frame.origin.x,590, self.LabelHome1.frame.size.width, self.LabelHome1.frame.size.height)
                
                
                //office button
                self.OfficeButton.frame = CGRectMake(self.OfficeButton.frame.origin.x,600, self.OfficeButton.frame.size.width, self.OfficeButton.frame.size.height)
                
                //arrow blue office
                self.ArrowBlueOffice.frame = CGRectMake(self.ArrowBlueOffice.frame.origin.x,635, self.ArrowBlueOffice.frame.size.width, self.ArrowBlueOffice.frame.size.height)
                
                //line office
                self.LabelOffice1.frame = CGRectMake(self.LabelOffice1.frame.origin.x,645, self.LabelOffice1.frame.size.width, self.LabelOffice1.frame.size.height)
                
                //Other Button
                self.OtherButton.frame = CGRectMake(self.OtherButton.frame.origin.x,650, self.OtherButton.frame.size.width, self.OtherButton.frame.size.height)
                
                //arrow blue other
                self.ArrowBlueOther.frame = CGRectMake(self.ArrowBlueOther.frame.origin.x,685, self.ArrowBlueOther.frame.size.width, self.ArrowBlueOther.frame.size.height)
                
                //line Other
                self.LabelOther5.frame = CGRectMake(self.LabelOther5.frame.origin.x,695, self.LabelOther5.frame.size.width, self.LabelOther5.frame.size.height)
                
                  self.AddDirectoryButton.frame = CGRectMake(self.AddDirectoryButton.frame.origin.x,520, self.AddDirectoryButton.frame.size.width, self.AddDirectoryButton.frame.size.height)
                
                    self.LabelBlueFirst.frame = CGRectMake(self.LabelBlueFirst.frame.origin.x,500, self.LabelBlueFirst.frame.size.width, self.LabelBlueFirst.frame.size.height)
                
                
                    self.ArrowGrayImage.frame = CGRectMake(self.ArrowGrayImage.frame.origin.x,530, self.ArrowGrayImage.frame.size.width, self.ArrowGrayImage.frame.size.height)


            }//finalizacion iphone 6
            
            //iphone 6 plus
            else if (self.Window.frame.size.height > 667 && self.Window.frame.size.height <= 736){
                self.ScrollView.contentSize = CGSizeMake(self.view.frame.size.width, 2210)
                
                //traer boton de home
                self.HomeButton.frame = CGRectMake(self.HomeButton.frame.origin.x, 590, self.HomeButton.frame.size.width, self.HomeButton.frame.size.height)
                
                //traer flecha gris de address
                self.ArrowBlue2.frame = CGRectMake(self.ArrowBlue2.frame.origin.x,610, self.ArrowBlue2.frame.size.width, self.ArrowBlue2.frame.size.height)
                
                self.LabelHome1.frame = CGRectMake(self.LabelHome1.frame.origin.x,620, self.LabelHome1.frame.size.width, self.LabelHome1.frame.size.height)
                
                
                //office button
                self.OfficeButton.frame = CGRectMake(self.OfficeButton.frame.origin.x,630, self.OfficeButton.frame.size.width, self.OfficeButton.frame.size.height)
                
                //arrow blue office
                self.ArrowBlueOffice.frame = CGRectMake(self.ArrowBlueOffice.frame.origin.x,660, self.ArrowBlueOffice.frame.size.width, self.ArrowBlueOffice.frame.size.height)
                
                //line office
                self.LabelOffice1.frame = CGRectMake(self.LabelOffice1.frame.origin.x,675, self.LabelOffice1.frame.size.width, self.LabelOffice1.frame.size.height)
                
                //Other Button
                self.OtherButton.frame = CGRectMake(self.OtherButton.frame.origin.x,680, self.OtherButton.frame.size.width, self.OtherButton.frame.size.height)
                
                //arrow blue other
                self.ArrowBlueOther.frame = CGRectMake(self.ArrowBlueOther.frame.origin.x,710, self.ArrowBlueOther.frame.size.width, self.ArrowBlueOther.frame.size.height)
                
                //line Other
                self.LabelOther5.frame = CGRectMake(self.LabelOther5.frame.origin.x,725, self.LabelOther5.frame.size.width, self.LabelOther5.frame.size.height)
                
               
                 self.LabelBlueFirst.frame = CGRectMake(self.LabelBlueFirst.frame.origin.x,520, self.LabelBlueFirst.frame.size.width, self.LabelBlueFirst.frame.size.height)
                
                 self.AddDirectoryButton.frame = CGRectMake(self.AddDirectoryButton.frame.origin.x,550, self.AddDirectoryButton.frame.size.width, self.AddDirectoryButton.frame.size.height)
                
                 self.ArrowGrayImage.frame = CGRectMake(self.ArrowGrayImage.frame.origin.x,560, self.ArrowGrayImage.frame.size.width, self.ArrowGrayImage.frame.size.height)
                
            }

            //cerrar el boton del boton addbutton
            
        }else if (self.HomeButton.hidden==false){
            self.ArrowGrayImage.image = UIImage (named: "arrow_down")
            //self.ScrollView.contentSize = CGSizeMake(self.view.frame.size.width, 1520)
            self
            
            self.HomeButton.hidden = true
            self.ArrowBlue2.hidden = true
            self.LabelHome1.hidden = true
            self.AddressHome.hidden = true
            self.CloseButton.hidden = true
            self.ZipcodeHome.hidden = true
            self.SpecialHome.hidden = true
            self.UnitedHome.hidden = true
            self.LabelHome1.hidden = true
            self.LabelHome2.hidden = true
            self.LabelHome3.hidden = true
            self.LabelHome4.hidden = true
            self.LabelHome5.hidden = true
            self.LabelHome6.hidden = true
            self.EditButtonHome.hidden = true
            
            //ocultar elementos de office
            self.OfficeButton.hidden = true
            self.ArrowBlueOffice.hidden = true
            self.LabelOffice1.hidden = true
            self.AddressOffice.hidden = true
            self.CloseOffice.hidden = true
            self.LabelOffice2.hidden = true
            self.UnitedOffice.hidden = true
            self.ZipcodeOffice.hidden = true
            self.LabelOffice3.hidden = true
            self.LabelOffice4.hidden = true
            self.SpecialOffice.hidden = true
            self.LabelOffice6.hidden = true
            self.LabelOffice5.hidden = true
            self.EditButtonOffice.hidden = true
            
            //ocultar elementos de other
            self.OtherButton.hidden = true
            self.ArrowBlueOther.hidden = true
            self.AddressButtonOther.hidden = true
            self.CloseOther.hidden = true
            self.UnitedOther.hidden = true
            self.ZipcodeOther.hidden = true
            self.LabelOther2.hidden = true
            self.LabelOther3.hidden = true
            self.SpecialOther.hidden = true
            self.LabelOther4.hidden = true
            self.SaveButton.hidden = true
            self.LabelOther5.hidden = true
            self.LabelOther6.hidden = true
            self.LabelOther1.hidden = true
            self.EditButtonOther.hidden = true
            self.SaveButton.hidden = true
            self.EditButton.hidden = false
            
            //posicionamiento de los elementos 
            
            if (self.Window.frame.size.height <= 480 ){
                self.ScrollView.contentSize = CGSizeMake(self.view.frame.size.width, 1520)
            }
            //iphone 5
            else if (self.Window.frame.size.height > 480 && self.Window.frame.size.height <= 568 ){
                self.ScrollView.contentSize = CGSizeMake(self.view.frame.size.width, 1220)
                

            
            }
            
            //iphone 6
            else  if (self.Window.frame.size.height > 568 && self.Window.frame.size.height <= 667){
                self.ScrollView.contentSize = CGSizeMake(self.view.frame.size.width, 1300)
                
                self.AddDirectoryButton.frame = CGRectMake(self.AddDirectoryButton.frame.origin.x, 570, self.AddDirectoryButton.frame.size.width, self.AddDirectoryButton.frame.size.height)
                
                //traer flecha gris address up
                self.ArrowGrayImage.frame = CGRectMake(self.ArrowGrayImage.frame.origin.x, 580, self.ArrowGrayImage.frame.size.width, self.ArrowGrayImage.frame.size.height)
                
                //credit card button up
                self.CreditCardButton.frame = CGRectMake(self.CreditCardButton.frame.origin.x, 480, self.CreditCardButton.frame.size.width, self.CreditCardButton.frame.size.height)
                
                //credit card arrow up
                self.ArrowImage2.frame = CGRectMake(self.ArrowImage2.frame.origin.x, 480, self.ArrowImage2.frame.size.width, self.ArrowImage2.frame.size.height)
                
                //progressbar up
                self.ProgressBlue.frame = CGRectMake(self.ProgressBlue.frame.origin.x, 450, self.ProgressBlue.frame.size.width, self.ProgressBlue.frame.size.height)
                
                //edit button up
                self.EditButton.frame = CGRectMake(self.EditButton.frame.origin.x, 390, self.EditButton.frame.size.width, self.EditButton.frame.size.height)
                
                //line blue up
                self.LabelBlueFirst.frame = CGRectMake(self.LabelBlueFirst.frame.origin.x, 540, self.LabelBlueFirst.frame.size.width, self.LabelBlueFirst.frame.size.height)
                
                
            }
            //iphone 6 plus
            else if (self.Window.frame.size.height > 667 && self.Window.frame.size.height <= 736){
                self.ScrollView.contentSize = CGSizeMake(self.view.frame.size.width, 1214)
                
                //traer boton de address up
                self.AddDirectoryButton.frame = CGRectMake(self.AddDirectoryButton.frame.origin.x, 650, self.AddDirectoryButton.frame.size.width, self.AddDirectoryButton.frame.size.height)
                
                //traer flecha gris address up
                self.ArrowGrayImage.frame = CGRectMake(self.ArrowGrayImage.frame.origin.x, 650, self.ArrowGrayImage.frame.size.width, self.ArrowGrayImage.frame.size.height)
                
                //credit card button up
                self.CreditCardButton.frame = CGRectMake(self.CreditCardButton.frame.origin.x, 540, self.CreditCardButton.frame.size.width, self.CreditCardButton.frame.size.height)
                
                //credit card arrow up
                self.ArrowImage2.frame = CGRectMake(self.ArrowImage2.frame.origin.x, 550, self.ArrowImage2.frame.size.width, self.ArrowImage2.frame.size.height)
                
                //progressbar up
                self.ProgressBlue.frame = CGRectMake(self.ProgressBlue.frame.origin.x, 510, self.ProgressBlue.frame.size.width, self.ProgressBlue.frame.size.height)
                
                //edit button up
                self.EditButton.frame = CGRectMake(self.EditButton.frame.origin.x, 430, self.EditButton.frame.size.width, self.EditButton.frame.size.height)
                
                //line blue up
                self.LabelBlueFirst.frame = CGRectMake(self.LabelBlueFirst.frame.origin.x, 615, self.LabelBlueFirst.frame.size.width, self.LabelBlueFirst.frame.size.height)
                
                
            }
            
            
            
        }//cierre del else if del boton address
            
       

        
        
        //ABRIR EL BOTON DE ADDRESS POR PRIMERA VEZ
            
        else{
            self.ArrowGrayImage.image = UIImage (named: "arrow_up")
        
        //self.ScrollView.contentSize = CGSizeMake(self.view.frame.size.width, 2300)
        
        self.HomeButton.hidden = false
        self.ArrowBlue2.hidden = false
        self.LabelHome1.hidden = false
        
        self.OfficeButton.hidden = false
        self.ArrowBlueOffice.hidden = false
        self.LabelOffice1.hidden = false
        
        self.OtherButton.hidden = false
        self.LabelOther5.hidden = false
        self.ArrowBlueOther.hidden = false
        self.SaveButton.hidden = true
        self.EditButton.hidden = true
        
        
        
        //posicion de los elementos
        if (self.Window.frame.size.height > 480 && self.Window.frame.size.height <= 568 ){
            self.ScrollView.contentSize = CGSizeMake(self.view.frame.size.width, 1750)
            
            //iphone 5
            
            //traer boton de address up
            self.HomeButton.frame = CGRectMake(self.HomeButton.frame.origin.x, 560, self.HomeButton.frame.size.width,self.HomeButton.frame.size.height)
            
            //traer flecha gris address up
            self.ArrowBlue2.frame = CGRectMake(self.ArrowBlue2.frame.origin.x, 580, self.ArrowBlue2.frame.size.width, self.ArrowBlue2.frame.size.height)
            
            
            //line blue up
            self.LabelHome1.frame = CGRectMake(self.LabelHome1.frame.origin.x,590, self.LabelHome1.frame.size.width, self.LabelHome1.frame.size.height)
            
            //office button
            self.OfficeButton.frame = CGRectMake(self.OfficeButton.frame.origin.x,590, self.OfficeButton.frame.size.width, self.OfficeButton.frame.size.height)
            
            //arrow blue office
            self.ArrowBlueOffice.frame = CGRectMake(self.ArrowBlueOffice.frame.origin.x,625, self.ArrowBlueOffice.frame.size.width, self.ArrowBlueOffice.frame.size.height)
            
            //line office
            self.LabelOffice1.frame = CGRectMake(self.LabelOffice1.frame.origin.x,635, self.LabelOffice1.frame.size.width, self.LabelOffice1.frame.size.height)
            //Other Button
            self.OtherButton.frame = CGRectMake(self.OtherButton.frame.origin.x,635, self.OtherButton.frame.size.width, self.OtherButton.frame.size.height)
            //arrow blue other
            self.ArrowBlueOther.frame = CGRectMake(self.ArrowBlueOther.frame.origin.x,670, self.ArrowBlueOther.frame.size.width, self.ArrowBlueOther.frame.size.height)
            //line Other
            self.LabelOther5.frame = CGRectMake(self.LabelOther5.frame.origin.x,680, self.LabelOther5.frame.size.width, self.LabelOther5.frame.size.height)
            
            //iphone 4
        }else if (self.Window.frame.size.height <= 480 ){
            self.ScrollView.contentSize = CGSizeMake(self.view.frame.size.width, 1600)
            
            //traer boton de address
            self.HomeButton.frame = CGRectMake(self.HomeButton.frame.origin.x, 570, self.HomeButton.frame.size.width, self.HomeButton.frame.size.height)
            
            //traer flecha gris de address
            self.ArrowBlue2.frame = CGRectMake(self.ArrowBlue2.frame.origin.x, 590, self.ArrowBlue2.frame.size.width, self.ArrowBlue2.frame.size.height)
            
            self.LabelHome1.frame = CGRectMake(self.LabelHome1.frame.origin.x,600, self.LabelHome1.frame.size.width, self.LabelHome1.frame.size.height)
            
            //office button
            self.OfficeButton.frame = CGRectMake(self.OfficeButton.frame.origin.x,605, self.OfficeButton.frame.size.width, self.OfficeButton.frame.size.height)
            
            //arrow blue office
            self.ArrowBlueOffice.frame = CGRectMake(self.ArrowBlueOffice.frame.origin.x,640, self.ArrowBlueOffice.frame.size.width, self.ArrowBlueOffice.frame.size.height)
            
            //line office
            self.LabelOffice1.frame = CGRectMake(self.LabelOffice1.frame.origin.x,650, self.LabelOffice1.frame.size.width, self.LabelOffice1.frame.size.height)
            
            //Other Button
            self.OtherButton.frame = CGRectMake(self.OtherButton.frame.origin.x,655, self.OtherButton.frame.size.width, self.OtherButton.frame.size.height)
            
            //arrow blue other
            self.ArrowBlueOther.frame = CGRectMake(self.ArrowBlueOther.frame.origin.x,690, self.ArrowBlueOther.frame.size.width, self.ArrowBlueOther.frame.size.height)
            
            //line Other
            self.LabelOther5.frame = CGRectMake(self.LabelOther5.frame.origin.x,700, self.LabelOther5.frame.size.width, self.LabelOther5.frame.size.height)
            
      
            
        }//finalizacion iphone 4
            
            //iphone 6
            
        else if (self.Window.frame.size.height > 568 && self.Window.frame.size.height <= 667){
            self.ScrollView.contentSize = CGSizeMake(self.view.frame.size.width, 2000)
            
            //traer boton de address
            self.HomeButton.frame = CGRectMake(self.HomeButton.frame.origin.x, 620, self.HomeButton.frame.size.width, self.HomeButton.frame.size.height)
            
            //traer flecha gris de address
            self.ArrowBlue2.frame = CGRectMake(self.ArrowBlue2.frame.origin.x,640 , self.ArrowBlue2.frame.size.width, self.ArrowBlue2.frame.size.height)
            
            self.LabelHome1.frame = CGRectMake(self.LabelHome1.frame.origin.x,650, self.LabelHome1.frame.size.width, self.LabelHome1.frame.size.height)
            
            
            //office button
            self.OfficeButton.frame = CGRectMake(self.OfficeButton.frame.origin.x,660, self.OfficeButton.frame.size.width, self.OfficeButton.frame.size.height)
            
            //arrow blue office
            self.ArrowBlueOffice.frame = CGRectMake(self.ArrowBlueOffice.frame.origin.x,690, self.ArrowBlueOffice.frame.size.width, self.ArrowBlueOffice.frame.size.height)
            
            //line office
            self.LabelOffice1.frame = CGRectMake(self.LabelOffice1.frame.origin.x,705, self.LabelOffice1.frame.size.width, self.LabelOffice1.frame.size.height)
            
            //Other Button
            self.OtherButton.frame = CGRectMake(self.OtherButton.frame.origin.x,710, self.OtherButton.frame.size.width, self.OtherButton.frame.size.height)
            
            //arrow blue other
            self.ArrowBlueOther.frame = CGRectMake(self.ArrowBlueOther.frame.origin.x,745, self.ArrowBlueOther.frame.size.width, self.ArrowBlueOther.frame.size.height)
            
            //line Other
            self.LabelOther5.frame = CGRectMake(self.LabelOther5.frame.origin.x,755, self.LabelOther5.frame.size.width, self.LabelOther5.frame.size.height)
            
            //save button
            self.SaveButton.frame = CGRectMake(self.SaveButton.frame.origin.x,890, self.SaveButton.frame.size.width, self.SaveButton.frame.size.height)
            
            
            
        }//iphone 6 plus
            
        else if (self.Window.frame.size.height > 667 && self.Window.frame.size.height <= 736){
            self.ScrollView.contentSize = CGSizeMake(self.view.frame.size.width, 2250)
            
            //traer boton de address
            self.HomeButton.frame = CGRectMake(self.HomeButton.frame.origin.x, 710, self.HomeButton.frame.size.width, self.HomeButton.frame.size.height)
            
            //traer flecha gris de address
            self.ArrowBlue2.frame = CGRectMake(self.ArrowBlue2.frame.origin.x,720 , self.ArrowBlue2.frame.size.width, self.ArrowBlue2.frame.size.height)
            
            self.LabelHome1.frame = CGRectMake(self.LabelHome1.frame.origin.x,740, self.LabelHome1.frame.size.width, self.LabelHome1.frame.size.height)
            
            
            //office button
            self.OfficeButton.frame = CGRectMake(self.OfficeButton.frame.origin.x,755, self.OfficeButton.frame.size.width, self.OfficeButton.frame.size.height)
            
            //arrow blue office
            self.ArrowBlueOffice.frame = CGRectMake(self.ArrowBlueOffice.frame.origin.x,790, self.ArrowBlueOffice.frame.size.width, self.ArrowBlueOffice.frame.size.height)
            
            //line office
            self.LabelOffice1.frame = CGRectMake(self.LabelOffice1.frame.origin.x,800, self.LabelOffice1.frame.size.width, self.LabelOffice1.frame.size.height)
            
            //Other Button
            self.OtherButton.frame = CGRectMake(self.OtherButton.frame.origin.x,815, self.OtherButton.frame.size.width, self.OtherButton.frame.size.height)
            
            //arrow blue other
            self.ArrowBlueOther.frame = CGRectMake(self.ArrowBlueOther.frame.origin.x,850, self.ArrowBlueOther.frame.size.width, self.ArrowBlueOther.frame.size.height)
            
            //line Other
            self.LabelOther5.frame = CGRectMake(self.LabelOther5.frame.origin.x,860, self.LabelOther5.frame.size.width, self.LabelOther5.frame.size.height)
            
            //save button
            self.SaveButton.frame = CGRectMake(self.SaveButton.frame.origin.x,990, self.SaveButton.frame.size.width, self.SaveButton.frame.size.height)
        
        }
        
        }// cierre del primer condicional
        
        
    }

   

    //return of the keyboard 
    func textFieldShouldReturn(textField: UITextField) -> Bool{
     
        //text de datos del usuario
         FullNameText.resignFirstResponder()
         LastNameText.resignFirstResponder()
         PhoneText.resignFirstResponder()
        
        //text del creditcard info
        MMFielText.resignFirstResponder()
        CFielText.resignFirstResponder()
        YFielText.resignFirstResponder()
        ZFielText.resignFirstResponder()
        
        //text de home
         AddressHome.resignFirstResponder()
         ZipcodeHome.resignFirstResponder()
         SpecialHome.resignFirstResponder()
         UnitedHome.resignFirstResponder()
        
        //text office
        AddressOffice.resignFirstResponder()
        UnitedOffice.resignFirstResponder()
        ZipcodeOffice.resignFirstResponder()
        SpecialOffice.resignFirstResponder()
        
        //text other
       AddressButtonOther.resignFirstResponder()
       UnitedOther.resignFirstResponder()
       ZipcodeOther.resignFirstResponder()
       SpecialOther.resignFirstResponder()
        
  
       
        return true
        
    }// finish of the return keyboard
    
    // HOME BUTTON ACTION
    @IBAction func HButton(sender: UIButton) {
       
        if(self.AddressOffice.hidden==false){
            
              self.ScrollView.contentSize = CGSizeMake(self.view.frame.size.width, 2350)
            //cambiar flechas
            self.ArrowBlueOffice.image = UIImage (named: "arrow_blue")
            self.ArrowBlue2.image = UIImage (named: "arrow_blue_UP")
            
            self.HomeButton.tintColor = UIColor (red: 0.945, green: 0.945, blue: 0.945, alpha: 1)
            self.OtherButton.tintColor = UIColor (red: 0.945, green: 0.945, blue: 0.945, alpha: 1)
            self.OfficeButton.tintColor = UIColor (red: 0.757,green:0.761,blue:0.784,alpha:1)
            self.SaveButton.backgroundColor = UIColor (red:0.686,green:0.686,blue:0.686,alpha:1)
            
            self.SaveButton.enabled = false
            self.CreditCardButton.enabled = false
        
            //mostrar elementos de office
            self.OfficeButton.hidden = false
            self.ArrowBlueOffice.hidden = false
            self.LabelOffice1.hidden = false
            self.AddressOffice.hidden = true
            self.CloseOffice.hidden = true
            self.LabelOffice2.hidden = true
            self.UnitedOffice.hidden = true
            self.ZipcodeOffice.hidden = true
            self.LabelOffice3.hidden = true
            self.LabelOffice4.hidden = true
            self.SpecialOffice.hidden = true
            self.LabelOffice6.hidden = true
            self.LabelOffice5.hidden = true
            self.EditButtonOffice.hidden = true
            self.SaveButton.hidden = false
            self.OtherButton.hidden = false
            self.ArrowBlueOther.hidden = false
            self.LabelOther1.hidden = false
            
            //ocultar elementos de home
            self.HomeButton.hidden = false
            self.ArrowBlue2.hidden = false
            self.AddressHome.hidden = false
            self.CloseButton.hidden = false
            self.ZipcodeHome.hidden = false
            self.SpecialHome.hidden = false
            self.UnitedHome.hidden = false
            self.LabelHome1.hidden = false
            self.LabelHome2.hidden = false
            self.LabelHome3.hidden = false
            self.LabelHome4.hidden = false
            self.LabelHome5.hidden = false
            self.LabelHome6.hidden = false
            self.EditButtonHome.hidden = false
            
            //  POSICIONAMIENTO DE LOS ELEMENTOS
            
            
            //iphone 4
            if (self.Window.frame.size.height <= 480 ){
                self.ScrollView.contentSize = CGSizeMake(self.view.frame.size.width, 1865)
                
                self.AddressHome.frame = CGRectMake(self.AddressHome.frame.origin.x,600, self.AddressHome.frame.size.width, self.AddressHome.frame.size.height)
                
                self.LabelHome2.frame = CGRectMake(self.LabelHome2.frame.origin.x,650, self.LabelHome2.frame.size.width, self.LabelHome2.frame.size.height)
                
                self.LabelHome3.frame = CGRectMake(self.LabelHome3.frame.origin.x,660, self.LabelHome3.frame.size.width, self.LabelHome3.frame.size.height)
                
                self.CloseButton.frame = CGRectMake(self.CloseButton.frame.origin.x,620, self.CloseButton.frame.size.width, self.CloseButton.frame.size.height)
                
                self.UnitedHome.frame = CGRectMake(self.UnitedHome.frame.origin.x,640, self.UnitedHome.frame.size.width, self.UnitedHome.frame.size.height)
                
                self.ZipcodeHome.frame = CGRectMake(self.ZipcodeHome.frame.origin.x,640, self.ZipcodeHome.frame.size.width, self.ZipcodeHome.frame.size.height)
                
                self.LabelHome6.frame = CGRectMake(self.LabelHome6.frame.origin.x,695, self.LabelHome6.frame.size.width, self.LabelHome6.frame.size.height)
                
                self.SpecialHome.frame = CGRectMake(self.SpecialHome.frame.origin.x,685, self.SpecialHome.frame.size.width, self.SpecialHome.frame.size.height)
                
                self.LabelHome5.frame = CGRectMake(self.LabelHome5.frame.origin.x,740, self.LabelHome5.frame.size.width, self.LabelHome5.frame.size.height)
                
                self.EditButtonHome.frame = CGRectMake(self.EditButtonHome.frame.origin.x,770, self.EditButtonHome.frame.size.width, self.EditButtonHome.frame.size.height)
                
                self.LabelHome4.frame = CGRectMake(self.LabelHome4.frame.origin.x,825, self.LabelHome4.frame.size.width, self.LabelHome4.frame.size.height)
                
                
                //traer boton de address
                self.OfficeButton.frame = CGRectMake(self.OfficeButton.frame.origin.x,820, self.OfficeButton.frame.size.width, self.OfficeButton.frame.size.height)
                
                //arrow blue office
                self.ArrowBlueOffice.frame = CGRectMake(self.ArrowBlueOffice.frame.origin.x,850, self.ArrowBlueOffice.frame.size.width, self.ArrowBlueOffice.frame.size.height)
                
                //line office
                self.LabelOffice1.frame = CGRectMake(self.LabelOffice1.frame.origin.x,870, self.LabelOffice1.frame.size.width, self.LabelOffice1.frame.size.height)
                
                //Other Button
                self.OtherButton.frame = CGRectMake(self.OtherButton.frame.origin.x,870, self.OtherButton.frame.size.width, self.OtherButton.frame.size.height)
                
                //arrow blue other
                self.ArrowBlueOther.frame = CGRectMake(self.ArrowBlueOther.frame.origin.x,900, self.ArrowBlueOther.frame.size.width, self.ArrowBlueOther.frame.size.height)
                
                //line Other
                self.LabelOther5.frame = CGRectMake(self.LabelOther5.frame.origin.x,920, self.LabelOther5.frame.size.width, self.LabelOther5.frame.size.height)
                
                
                self.SaveButton.frame = CGRectMake(self.SaveButton.frame.origin.x,950, self.SaveButton.frame.size.width, self.SaveButton.frame.size.height)
                
                
                
            }//finalizacion del iphone 4
                
                //iphone 5
            else if (self.Window.frame.size.height > 480 && self.Window.frame.size.height <= 568 ){
                self.ScrollView.contentSize = CGSizeMake(self.view.frame.size.width, 2025)
                
                self.AddressHome.frame = CGRectMake(self.AddressHome.frame.origin.x,590, self.AddressHome.frame.size.width, self.AddressHome.frame.size.height)
                
                self.LabelHome2.frame = CGRectMake(self.LabelHome2.frame.origin.x,640, self.LabelHome2.frame.size.width, self.LabelHome2.frame.size.height)
                
                self.LabelHome3.frame = CGRectMake(self.LabelHome3.frame.origin.x,645, self.LabelHome3.frame.size.width, self.LabelHome3.frame.size.height)
                
                self.CloseButton.frame = CGRectMake(self.CloseButton.frame.origin.x,620, self.CloseButton.frame.size.width, self.CloseButton.frame.size.height)
                
                self.UnitedHome.frame = CGRectMake(self.UnitedHome.frame.origin.x,640, self.UnitedHome.frame.size.width, self.UnitedHome.frame.size.height)
                
                self.ZipcodeHome.frame = CGRectMake(self.ZipcodeHome.frame.origin.x,640, self.ZipcodeHome.frame.size.width, self.ZipcodeHome.frame.size.height)
                
                self.LabelHome6.frame = CGRectMake(self.LabelHome6.frame.origin.x,695, self.LabelHome6.frame.size.width, self.LabelHome6.frame.size.height)
                
                self.SpecialHome.frame = CGRectMake(self.SpecialHome.frame.origin.x,685, self.SpecialHome.frame.size.width, self.SpecialHome.frame.size.height)
                
                self.LabelHome5.frame = CGRectMake(self.LabelHome5.frame.origin.x,740, self.LabelHome5.frame.size.width, self.LabelHome5.frame.size.height)
                
                self.EditButtonHome.frame = CGRectMake(self.EditButtonHome.frame.origin.x,770, self.EditButtonHome.frame.size.width, self.EditButtonHome.frame.size.height)
                
                self.LabelHome4.frame = CGRectMake(self.LabelHome4.frame.origin.x,825, self.LabelHome4.frame.size.width, self.LabelHome4.frame.size.height)
                
                
                //traer boton de address
                self.OfficeButton.frame = CGRectMake(self.OfficeButton.frame.origin.x,820, self.OfficeButton.frame.size.width, self.OfficeButton.frame.size.height)
                
                //arrow blue office
                self.ArrowBlueOffice.frame = CGRectMake(self.ArrowBlueOffice.frame.origin.x,850, self.ArrowBlueOffice.frame.size.width, self.ArrowBlueOffice.frame.size.height)
                
                //line office
                self.LabelOffice1.frame = CGRectMake(self.LabelOffice1.frame.origin.x,870, self.LabelOffice1.frame.size.width, self.LabelOffice1.frame.size.height)
                
                //Other Button
                self.OtherButton.frame = CGRectMake(self.OtherButton.frame.origin.x,870, self.OtherButton.frame.size.width, self.OtherButton.frame.size.height)
                
                //arrow blue other
                self.ArrowBlueOther.frame = CGRectMake(self.ArrowBlueOther.frame.origin.x,900, self.ArrowBlueOther.frame.size.width, self.ArrowBlueOther.frame.size.height)
                
                //line Other
                self.LabelOther5.frame = CGRectMake(self.LabelOther5.frame.origin.x,920, self.LabelOther5.frame.size.width, self.LabelOther5.frame.size.height)
                
                
                self.SaveButton.frame = CGRectMake(self.SaveButton.frame.origin.x,950, self.SaveButton.frame.size.width, self.SaveButton.frame.size.height)
                
                
                
            }//finalizacion iphone 5
                
                //iphone 6
            else if (self.Window.frame.size.height > 568 && self.Window.frame.size.height <= 667){
                self.ScrollView.contentSize = CGSizeMake(self.view.frame.size.width, 2250)
                
                
                self.AddressHome.frame = CGRectMake(self.AddressHome.frame.origin.x,645, self.AddressHome.frame.size.width, self.AddressHome.frame.size.height)
                
                self.LabelHome2.frame = CGRectMake(self.LabelHome2.frame.origin.x,700, self.LabelHome2.frame.size.width, self.LabelHome2.frame.size.height)
                
                self.LabelHome3.frame = CGRectMake(self.LabelHome3.frame.origin.x,700, self.LabelHome3.frame.size.width, self.LabelHome3.frame.size.height)
                
                self.CloseButton.frame = CGRectMake(self.CloseButton.frame.origin.x,670, self.CloseButton.frame.size.width, self.CloseButton.frame.size.height)
                
                self.UnitedHome.frame = CGRectMake(self.UnitedHome.frame.origin.x,695, self.UnitedHome.frame.size.width, self.UnitedHome.frame.size.height)
                
                self.ZipcodeHome.frame = CGRectMake(self.ZipcodeHome.frame.origin.x,695, self.ZipcodeHome.frame.size.width, self.ZipcodeHome.frame.size.height)
                
                self.LabelHome6.frame = CGRectMake(self.LabelHome6.frame.origin.x,750, self.LabelHome6.frame.size.width, self.LabelHome6.frame.size.height)
                
                self.SpecialHome.frame = CGRectMake(self.SpecialHome.frame.origin.x,750, self.SpecialHome.frame.size.width, self.SpecialHome.frame.size.height)
                
                self.LabelHome5.frame = CGRectMake(self.LabelHome5.frame.origin.x,800, self.LabelHome5.frame.size.width, self.LabelHome5.frame.size.height)
                
                self.EditButtonHome.frame = CGRectMake(self.EditButtonHome.frame.origin.x,820, self.EditButtonHome.frame.size.width, self.EditButtonHome.frame.size.height)
                
                self.LabelHome4.frame = CGRectMake(self.LabelHome4.frame.origin.x,870, self.LabelHome4.frame.size.width, self.LabelHome4.frame.size.height)
                
                
                //traer boton de address
                self.OfficeButton.frame = CGRectMake(self.OfficeButton.frame.origin.x,870, self.OfficeButton.frame.size.width, self.OfficeButton.frame.size.height)
                
                //arrow blue office
                self.ArrowBlueOffice.frame = CGRectMake(self.ArrowBlueOffice.frame.origin.x,900, self.ArrowBlueOffice.frame.size.width, self.ArrowBlueOffice.frame.size.height)
                
                //line office
                self.LabelOffice1.frame = CGRectMake(self.LabelOffice1.frame.origin.x,920, self.LabelOffice1.frame.size.width, self.LabelOffice1.frame.size.height)
                
                //Other Button
                self.OtherButton.frame = CGRectMake(self.OtherButton.frame.origin.x,920, self.OtherButton.frame.size.width, self.OtherButton.frame.size.height)
                
                //arrow blue other
                self.ArrowBlueOther.frame = CGRectMake(self.ArrowBlueOther.frame.origin.x,950, self.ArrowBlueOther.frame.size.width, self.ArrowBlueOther.frame.size.height)
                
                //line Other
                self.LabelOther5.frame = CGRectMake(self.LabelOther5.frame.origin.x,970, self.LabelOther5.frame.size.width, self.LabelOther5.frame.size.height)
                
                
                self.SaveButton.frame = CGRectMake(self.SaveButton.frame.origin.x,995, self.SaveButton.frame.size.width, self.SaveButton.frame.size.height)
                
            }//finalizacion del iphone 6
                
                //iphone 6 plus
            else if (self.Window.frame.size.height > 667 && self.Window.frame.size.height <= 736){
                self.ScrollView.contentSize = CGSizeMake(self.view.frame.size.width, 2450)
                
                self.AddressHome.frame = CGRectMake(self.AddressHome.frame.origin.x,740, self.AddressHome.frame.size.width, self.AddressHome.frame.size.height)
                
                self.LabelHome2.frame = CGRectMake(self.LabelHome2.frame.origin.x,790, self.LabelHome2.frame.size.width, self.LabelHome2.frame.size.height)
                
                self.LabelHome3.frame = CGRectMake(self.LabelHome3.frame.origin.x,790, self.LabelHome3.frame.size.width, self.LabelHome3.frame.size.height)
                
                self.CloseButton.frame = CGRectMake(self.CloseButton.frame.origin.x,760, self.CloseButton.frame.size.width, self.CloseButton.frame.size.height)
                
                self.UnitedHome.frame = CGRectMake(self.UnitedHome.frame.origin.x,785, self.UnitedHome.frame.size.width, self.UnitedHome.frame.size.height)
                
                self.ZipcodeHome.frame = CGRectMake(self.ZipcodeHome.frame.origin.x,785, self.ZipcodeHome.frame.size.width, self.ZipcodeHome.frame.size.height)
                
                self.LabelHome6.frame = CGRectMake(self.LabelHome6.frame.origin.x,840, self.LabelHome6.frame.size.width, self.LabelHome6.frame.size.height)
                
                self.SpecialHome.frame = CGRectMake(self.SpecialHome.frame.origin.x,830, self.SpecialHome.frame.size.width, self.SpecialHome.frame.size.height)
                
                self.LabelHome5.frame = CGRectMake(self.LabelHome5.frame.origin.x,885, self.LabelHome5.frame.size.width, self.LabelHome5.frame.size.height)
                
                self.EditButtonHome.frame = CGRectMake(self.EditButtonHome.frame.origin.x,910, self.EditButtonHome.frame.size.width, self.EditButtonHome.frame.size.height)
                
                self.LabelHome4.frame = CGRectMake(self.LabelHome4.frame.origin.x,960, self.LabelHome4.frame.size.width, self.LabelHome4.frame.size.height)
                
                
                //traer boton de address
                self.OfficeButton.frame = CGRectMake(self.OfficeButton.frame.origin.x,950, self.OfficeButton.frame.size.width, self.OfficeButton.frame.size.height)
                
                //arrow blue office
                self.ArrowBlueOffice.frame = CGRectMake(self.ArrowBlueOffice.frame.origin.x,980, self.ArrowBlueOffice.frame.size.width, self.ArrowBlueOffice.frame.size.height)
                
                //line office
                self.LabelOffice1.frame = CGRectMake(self.LabelOffice1.frame.origin.x,1000, self.LabelOffice1.frame.size.width, self.LabelOffice1.frame.size.height)
                
                //Other Button
                self.OtherButton.frame = CGRectMake(self.OtherButton.frame.origin.x,990, self.OtherButton.frame.size.width, self.OtherButton.frame.size.height)
                
                //arrow blue other
                self.ArrowBlueOther.frame = CGRectMake(self.ArrowBlueOther.frame.origin.x,1020, self.ArrowBlueOther.frame.size.width, self.ArrowBlueOther.frame.size.height)
                
                //line Other
                self.LabelOther5.frame = CGRectMake(self.LabelOther5.frame.origin.x,1040, self.LabelOther5.frame.size.width, self.LabelOther5.frame.size.height)
                
                
                self.SaveButton.frame = CGRectMake(self.SaveButton.frame.origin.x,1070, self.SaveButton.frame.size.width, self.SaveButton.frame.size.height)
                
                
                
                
            }//finalizacion Iphone 6plus

            
            
            
              }//finalizacion del offce open
        
        else if (self.AddressButtonOther.hidden==false){
            
              self.ScrollView.contentSize = CGSizeMake(self.view.frame.size.width, 2350)
            //cambiar flechas
            self.ArrowBlueOther.image = UIImage (named: "arrow_blue")
            self.ArrowBlue2.image = UIImage (named: "arrow_blue_UP")
            
            //cambiar color de las letras
            self.HomeButton.tintColor = UIColor (red: 0.945, green: 0.945, blue: 0.945, alpha: 1)
            self.OfficeButton.tintColor = UIColor (red: 0.945, green: 0.945, blue: 0.945, alpha: 1)
            self.OtherButton.tintColor = UIColor (red: 0.757,green:0.761,blue:0.784,alpha:1)
            self.SaveButton.backgroundColor = UIColor (red:0.686,green:0.686,blue:0.686,alpha:1)
            
            //desabilitar savebutton
            self.SaveButton.enabled = false
            self.CreditCardButton.enabled = false
            
            
        //mostrar elementos de other
            self.OtherButton.hidden = false
            self.ArrowBlueOther.hidden = false
            self.AddressButtonOther.hidden = true
            self.CloseOther.hidden = true
            self.UnitedOther.hidden = true
            self.ZipcodeOther.hidden = true
            self.LabelOther2.hidden = true
            self.LabelOther3.hidden = true
            self.SpecialOther.hidden = true
            self.LabelOther4.hidden = true
            self.SaveButton.hidden = false
            self.LabelOther5.hidden = false
            self.LabelOther6.hidden = true
            self.LabelOther1.hidden = true
            self.EditButtonOther.hidden = true
          
            
            
            //ocultar elementos de home
            self.HomeButton.hidden = false
            self.ArrowBlue2.hidden = false
            self.AddressHome.hidden = false
            self.CloseButton.hidden = false
            self.ZipcodeHome.hidden = false
            self.SpecialHome.hidden = false
            self.UnitedHome.hidden = false
            self.LabelHome1.hidden = false
            self.LabelHome2.hidden = false
            self.LabelHome3.hidden = false
            self.LabelHome4.hidden = false
            self.LabelHome5.hidden = false
            self.LabelHome6.hidden = false
            self.EditButtonHome.hidden = false
            
            //  POSICIONAMIENTO DE LOS ELEMENTOS
            
            
            //iphone 4
            if (self.Window.frame.size.height <= 480 ){
                self.ScrollView.contentSize = CGSizeMake(self.view.frame.size.width, 1865)
                
                self.AddressHome.frame = CGRectMake(self.AddressHome.frame.origin.x,600, self.AddressHome.frame.size.width, self.AddressHome.frame.size.height)
                
                self.LabelHome2.frame = CGRectMake(self.LabelHome2.frame.origin.x,650, self.LabelHome2.frame.size.width, self.LabelHome2.frame.size.height)
                
                self.LabelHome3.frame = CGRectMake(self.LabelHome3.frame.origin.x,660, self.LabelHome3.frame.size.width, self.LabelHome3.frame.size.height)
                
                self.CloseButton.frame = CGRectMake(self.CloseButton.frame.origin.x,620, self.CloseButton.frame.size.width, self.CloseButton.frame.size.height)
                
                self.UnitedHome.frame = CGRectMake(self.UnitedHome.frame.origin.x,640, self.UnitedHome.frame.size.width, self.UnitedHome.frame.size.height)
                
                self.ZipcodeHome.frame = CGRectMake(self.ZipcodeHome.frame.origin.x,640, self.ZipcodeHome.frame.size.width, self.ZipcodeHome.frame.size.height)
                
                self.LabelHome6.frame = CGRectMake(self.LabelHome6.frame.origin.x,695, self.LabelHome6.frame.size.width, self.LabelHome6.frame.size.height)
                
                self.SpecialHome.frame = CGRectMake(self.SpecialHome.frame.origin.x,685, self.SpecialHome.frame.size.width, self.SpecialHome.frame.size.height)
                
                self.LabelHome5.frame = CGRectMake(self.LabelHome5.frame.origin.x,740, self.LabelHome5.frame.size.width, self.LabelHome5.frame.size.height)
                
                self.EditButtonHome.frame = CGRectMake(self.EditButtonHome.frame.origin.x,770, self.EditButtonHome.frame.size.width, self.EditButtonHome.frame.size.height)
                
                self.LabelHome4.frame = CGRectMake(self.LabelHome4.frame.origin.x,825, self.LabelHome4.frame.size.width, self.LabelHome4.frame.size.height)
                
                
                //traer boton de address
                self.OfficeButton.frame = CGRectMake(self.OfficeButton.frame.origin.x,820, self.OfficeButton.frame.size.width, self.OfficeButton.frame.size.height)
                
                //arrow blue office
                self.ArrowBlueOffice.frame = CGRectMake(self.ArrowBlueOffice.frame.origin.x,850, self.ArrowBlueOffice.frame.size.width, self.ArrowBlueOffice.frame.size.height)
                
                //line office
                self.LabelOffice1.frame = CGRectMake(self.LabelOffice1.frame.origin.x,870, self.LabelOffice1.frame.size.width, self.LabelOffice1.frame.size.height)
                
                //Other Button
                self.OtherButton.frame = CGRectMake(self.OtherButton.frame.origin.x,870, self.OtherButton.frame.size.width, self.OtherButton.frame.size.height)
                
                //arrow blue other
                self.ArrowBlueOther.frame = CGRectMake(self.ArrowBlueOther.frame.origin.x,900, self.ArrowBlueOther.frame.size.width, self.ArrowBlueOther.frame.size.height)
                
                //line Other
                self.LabelOther5.frame = CGRectMake(self.LabelOther5.frame.origin.x,920, self.LabelOther5.frame.size.width, self.LabelOther5.frame.size.height)
                
                
                self.SaveButton.frame = CGRectMake(self.SaveButton.frame.origin.x,950, self.SaveButton.frame.size.width, self.SaveButton.frame.size.height)
                
                
                
            }//finalizacion del iphone 4
                
                //iphone 5
            else if (self.Window.frame.size.height > 480 && self.Window.frame.size.height <= 568 ){
                self.ScrollView.contentSize = CGSizeMake(self.view.frame.size.width, 2025)
                
                self.AddressHome.frame = CGRectMake(self.AddressHome.frame.origin.x,590, self.AddressHome.frame.size.width, self.AddressHome.frame.size.height)
                
                self.LabelHome2.frame = CGRectMake(self.LabelHome2.frame.origin.x,640, self.LabelHome2.frame.size.width, self.LabelHome2.frame.size.height)
                
                self.LabelHome3.frame = CGRectMake(self.LabelHome3.frame.origin.x,645, self.LabelHome3.frame.size.width, self.LabelHome3.frame.size.height)
                
                self.CloseButton.frame = CGRectMake(self.CloseButton.frame.origin.x,620, self.CloseButton.frame.size.width, self.CloseButton.frame.size.height)
                
                self.UnitedHome.frame = CGRectMake(self.UnitedHome.frame.origin.x,640, self.UnitedHome.frame.size.width, self.UnitedHome.frame.size.height)
                
                self.ZipcodeHome.frame = CGRectMake(self.ZipcodeHome.frame.origin.x,640, self.ZipcodeHome.frame.size.width, self.ZipcodeHome.frame.size.height)
                
                self.LabelHome6.frame = CGRectMake(self.LabelHome6.frame.origin.x,695, self.LabelHome6.frame.size.width, self.LabelHome6.frame.size.height)
                
                self.SpecialHome.frame = CGRectMake(self.SpecialHome.frame.origin.x,685, self.SpecialHome.frame.size.width, self.SpecialHome.frame.size.height)
                
                self.LabelHome5.frame = CGRectMake(self.LabelHome5.frame.origin.x,740, self.LabelHome5.frame.size.width, self.LabelHome5.frame.size.height)
                
                self.EditButtonHome.frame = CGRectMake(self.EditButtonHome.frame.origin.x,770, self.EditButtonHome.frame.size.width, self.EditButtonHome.frame.size.height)
                
                self.LabelHome4.frame = CGRectMake(self.LabelHome4.frame.origin.x,825, self.LabelHome4.frame.size.width, self.LabelHome4.frame.size.height)
                
                
                //traer boton de address
                self.OfficeButton.frame = CGRectMake(self.OfficeButton.frame.origin.x,820, self.OfficeButton.frame.size.width, self.OfficeButton.frame.size.height)
                
                //arrow blue office
                self.ArrowBlueOffice.frame = CGRectMake(self.ArrowBlueOffice.frame.origin.x,850, self.ArrowBlueOffice.frame.size.width, self.ArrowBlueOffice.frame.size.height)
                
                //line office
                self.LabelOffice1.frame = CGRectMake(self.LabelOffice1.frame.origin.x,870, self.LabelOffice1.frame.size.width, self.LabelOffice1.frame.size.height)
                
                //Other Button
                self.OtherButton.frame = CGRectMake(self.OtherButton.frame.origin.x,870, self.OtherButton.frame.size.width, self.OtherButton.frame.size.height)
                
                //arrow blue other
                self.ArrowBlueOther.frame = CGRectMake(self.ArrowBlueOther.frame.origin.x,900, self.ArrowBlueOther.frame.size.width, self.ArrowBlueOther.frame.size.height)
                
                //line Other
                self.LabelOther5.frame = CGRectMake(self.LabelOther5.frame.origin.x,920, self.LabelOther5.frame.size.width, self.LabelOther5.frame.size.height)
                
                
                self.SaveButton.frame = CGRectMake(self.SaveButton.frame.origin.x,950, self.SaveButton.frame.size.width, self.SaveButton.frame.size.height)
                
                
                
            }//finalizacion iphone 5
                
                //iphone 6
            else if (self.Window.frame.size.height > 568 && self.Window.frame.size.height <= 667){
                self.ScrollView.contentSize = CGSizeMake(self.view.frame.size.width, 2250)
                
                
                self.AddressHome.frame = CGRectMake(self.AddressHome.frame.origin.x,645, self.AddressHome.frame.size.width, self.AddressHome.frame.size.height)
                
                self.LabelHome2.frame = CGRectMake(self.LabelHome2.frame.origin.x,700, self.LabelHome2.frame.size.width, self.LabelHome2.frame.size.height)
                
                self.LabelHome3.frame = CGRectMake(self.LabelHome3.frame.origin.x,700, self.LabelHome3.frame.size.width, self.LabelHome3.frame.size.height)
                
                self.CloseButton.frame = CGRectMake(self.CloseButton.frame.origin.x,670, self.CloseButton.frame.size.width, self.CloseButton.frame.size.height)
                
                self.UnitedHome.frame = CGRectMake(self.UnitedHome.frame.origin.x,695, self.UnitedHome.frame.size.width, self.UnitedHome.frame.size.height)
                
                self.ZipcodeHome.frame = CGRectMake(self.ZipcodeHome.frame.origin.x,695, self.ZipcodeHome.frame.size.width, self.ZipcodeHome.frame.size.height)
                
                self.LabelHome6.frame = CGRectMake(self.LabelHome6.frame.origin.x,750, self.LabelHome6.frame.size.width, self.LabelHome6.frame.size.height)
                
                self.SpecialHome.frame = CGRectMake(self.SpecialHome.frame.origin.x,750, self.SpecialHome.frame.size.width, self.SpecialHome.frame.size.height)
                
                self.LabelHome5.frame = CGRectMake(self.LabelHome5.frame.origin.x,800, self.LabelHome5.frame.size.width, self.LabelHome5.frame.size.height)
                
                self.EditButtonHome.frame = CGRectMake(self.EditButtonHome.frame.origin.x,820, self.EditButtonHome.frame.size.width, self.EditButtonHome.frame.size.height)
                
                self.LabelHome4.frame = CGRectMake(self.LabelHome4.frame.origin.x,870, self.LabelHome4.frame.size.width, self.LabelHome4.frame.size.height)
                
                
                //traer boton de address
                self.OfficeButton.frame = CGRectMake(self.OfficeButton.frame.origin.x,870, self.OfficeButton.frame.size.width, self.OfficeButton.frame.size.height)
                
                //arrow blue office
                self.ArrowBlueOffice.frame = CGRectMake(self.ArrowBlueOffice.frame.origin.x,900, self.ArrowBlueOffice.frame.size.width, self.ArrowBlueOffice.frame.size.height)
                
                //line office
                self.LabelOffice1.frame = CGRectMake(self.LabelOffice1.frame.origin.x,920, self.LabelOffice1.frame.size.width, self.LabelOffice1.frame.size.height)
                
                //Other Button
                self.OtherButton.frame = CGRectMake(self.OtherButton.frame.origin.x,920, self.OtherButton.frame.size.width, self.OtherButton.frame.size.height)
                
                //arrow blue other
                self.ArrowBlueOther.frame = CGRectMake(self.ArrowBlueOther.frame.origin.x,950, self.ArrowBlueOther.frame.size.width, self.ArrowBlueOther.frame.size.height)
                
                //line Other
                self.LabelOther5.frame = CGRectMake(self.LabelOther5.frame.origin.x,970, self.LabelOther5.frame.size.width, self.LabelOther5.frame.size.height)
                
                
                self.SaveButton.frame = CGRectMake(self.SaveButton.frame.origin.x,995, self.SaveButton.frame.size.width, self.SaveButton.frame.size.height)
                
            }//finalizacion del iphone 6
                
                //iphone 6 plus
            else if (self.Window.frame.size.height > 667 && self.Window.frame.size.height <= 736){
                self.ScrollView.contentSize = CGSizeMake(self.view.frame.size.width, 2450)
                
                self.AddressHome.frame = CGRectMake(self.AddressHome.frame.origin.x,740, self.AddressHome.frame.size.width, self.AddressHome.frame.size.height)
                
                self.LabelHome2.frame = CGRectMake(self.LabelHome2.frame.origin.x,790, self.LabelHome2.frame.size.width, self.LabelHome2.frame.size.height)
                
                self.LabelHome3.frame = CGRectMake(self.LabelHome3.frame.origin.x,790, self.LabelHome3.frame.size.width, self.LabelHome3.frame.size.height)
                
                self.CloseButton.frame = CGRectMake(self.CloseButton.frame.origin.x,760, self.CloseButton.frame.size.width, self.CloseButton.frame.size.height)
                
                self.UnitedHome.frame = CGRectMake(self.UnitedHome.frame.origin.x,785, self.UnitedHome.frame.size.width, self.UnitedHome.frame.size.height)
                
                self.ZipcodeHome.frame = CGRectMake(self.ZipcodeHome.frame.origin.x,785, self.ZipcodeHome.frame.size.width, self.ZipcodeHome.frame.size.height)
                
                self.LabelHome6.frame = CGRectMake(self.LabelHome6.frame.origin.x,840, self.LabelHome6.frame.size.width, self.LabelHome6.frame.size.height)
                
                self.SpecialHome.frame = CGRectMake(self.SpecialHome.frame.origin.x,830, self.SpecialHome.frame.size.width, self.SpecialHome.frame.size.height)
                
                self.LabelHome5.frame = CGRectMake(self.LabelHome5.frame.origin.x,885, self.LabelHome5.frame.size.width, self.LabelHome5.frame.size.height)
                
                self.EditButtonHome.frame = CGRectMake(self.EditButtonHome.frame.origin.x,910, self.EditButtonHome.frame.size.width, self.EditButtonHome.frame.size.height)
                
                self.LabelHome4.frame = CGRectMake(self.LabelHome4.frame.origin.x,960, self.LabelHome4.frame.size.width, self.LabelHome4.frame.size.height)
                
                
                //traer boton de address
                self.OfficeButton.frame = CGRectMake(self.OfficeButton.frame.origin.x,950, self.OfficeButton.frame.size.width, self.OfficeButton.frame.size.height)
                
                //arrow blue office
                self.ArrowBlueOffice.frame = CGRectMake(self.ArrowBlueOffice.frame.origin.x,980, self.ArrowBlueOffice.frame.size.width, self.ArrowBlueOffice.frame.size.height)
                
                //line office
                self.LabelOffice1.frame = CGRectMake(self.LabelOffice1.frame.origin.x,1000, self.LabelOffice1.frame.size.width, self.LabelOffice1.frame.size.height)
                
                //Other Button
                self.OtherButton.frame = CGRectMake(self.OtherButton.frame.origin.x,990, self.OtherButton.frame.size.width, self.OtherButton.frame.size.height)
                
                //arrow blue other
                self.ArrowBlueOther.frame = CGRectMake(self.ArrowBlueOther.frame.origin.x,1020, self.ArrowBlueOther.frame.size.width, self.ArrowBlueOther.frame.size.height)
                
                //line Other
                self.LabelOther5.frame = CGRectMake(self.LabelOther5.frame.origin.x,1040, self.LabelOther5.frame.size.width, self.LabelOther5.frame.size.height)
                
                
                self.SaveButton.frame = CGRectMake(self.SaveButton.frame.origin.x,1070, self.SaveButton.frame.size.width, self.SaveButton.frame.size.height)
                
                
                
                
            }//finalizacion de iphone 6plus
            
            
            
            
        
        }//finalizacion del addbuttonOther
        else if(self.AddressHome.hidden==false){
              self.ScrollView.contentSize = CGSizeMake(self.view.frame.size.width, 2350)
        self.ArrowBlue2.image = UIImage (named: "arrow_blue")
        self.CreditCardButton.enabled = true
            
        //ocultar elementos de home
            self.HomeButton.hidden = false
            self.ArrowBlue2.hidden = false
            self.AddressHome.hidden = true
            self.CloseButton.hidden = true
            self.ZipcodeHome.hidden = true
            self.SpecialHome.hidden = true
            self.UnitedHome.hidden = true
            self.LabelHome1.hidden = false
            self.LabelHome2.hidden = true
            self.LabelHome3.hidden = true
            self.LabelHome4.hidden = true
            self.LabelHome5.hidden = true
            self.LabelHome6.hidden = true
            self.EditButtonHome.hidden = true
            self.SaveButton.hidden = true
            
            
      
            
            //POSICIONAMIENTO DE LOS ELEMENTOS
            
            if (self.Window.frame.size.height > 480 && self.Window.frame.size.height <= 568 ){
                self.ScrollView.contentSize = CGSizeMake(self.view.frame.size.width, 1750)
                
                //iphone 5
                
                //traer boton de address up
                self.HomeButton.frame = CGRectMake(self.HomeButton.frame.origin.x, 560, self.HomeButton.frame.size.width,self.HomeButton.frame.size.height)
                
                //traer flecha gris address up
                self.ArrowBlue2.frame = CGRectMake(self.ArrowBlue2.frame.origin.x, 580, self.ArrowBlue2.frame.size.width, self.ArrowBlue2.frame.size.height)
                
                
                //line blue up
                self.LabelHome1.frame = CGRectMake(self.LabelHome1.frame.origin.x,590, self.LabelHome1.frame.size.width, self.LabelHome1.frame.size.height)
                
                //office button
                self.OfficeButton.frame = CGRectMake(self.OfficeButton.frame.origin.x,590, self.OfficeButton.frame.size.width, self.OfficeButton.frame.size.height)
                
                //arrow blue office
                self.ArrowBlueOffice.frame = CGRectMake(self.ArrowBlueOffice.frame.origin.x,625, self.ArrowBlueOffice.frame.size.width, self.ArrowBlueOffice.frame.size.height)
                
                //line office
                self.LabelOffice1.frame = CGRectMake(self.LabelOffice1.frame.origin.x,635, self.LabelOffice1.frame.size.width, self.LabelOffice1.frame.size.height)
                //Other Button
                self.OtherButton.frame = CGRectMake(self.OtherButton.frame.origin.x,635, self.OtherButton.frame.size.width, self.OtherButton.frame.size.height)
                //arrow blue other
                self.ArrowBlueOther.frame = CGRectMake(self.ArrowBlueOther.frame.origin.x,670, self.ArrowBlueOther.frame.size.width, self.ArrowBlueOther.frame.size.height)
                //line Other
                self.LabelOther5.frame = CGRectMake(self.LabelOther5.frame.origin.x,680, self.LabelOther5.frame.size.width, self.LabelOther5.frame.size.height)
                
                //iphone 4
            }else if (self.Window.frame.size.height <= 480 ){
                self.ScrollView.contentSize = CGSizeMake(self.view.frame.size.width, 1700)
                
                //traer boton de address
                self.HomeButton.frame = CGRectMake(self.HomeButton.frame.origin.x,570, self.HomeButton.frame.size.width, self.HomeButton.frame.size.height)
                
                //traer flecha gris de address
                self.ArrowBlue2.frame = CGRectMake(self.ArrowBlue2.frame.origin.x, 590, self.ArrowBlue2.frame.size.width, self.ArrowBlue2.frame.size.height)
                
                self.LabelHome1.frame = CGRectMake(self.LabelHome1.frame.origin.x,600, self.LabelHome1.frame.size.width, self.LabelHome1.frame.size.height)
                
                //office button
                self.OfficeButton.frame = CGRectMake(self.OfficeButton.frame.origin.x,605, self.OfficeButton.frame.size.width, self.OfficeButton.frame.size.height)
                
                //arrow blue office
                self.ArrowBlueOffice.frame = CGRectMake(self.ArrowBlueOffice.frame.origin.x,640, self.ArrowBlueOffice.frame.size.width, self.ArrowBlueOffice.frame.size.height)
                
                //line office
                self.LabelOffice1.frame = CGRectMake(self.LabelOffice1.frame.origin.x,650, self.LabelOffice1.frame.size.width, self.LabelOffice1.frame.size.height)
                
                //Other Button
                self.OtherButton.frame = CGRectMake(self.OtherButton.frame.origin.x,655, self.OtherButton.frame.size.width, self.OtherButton.frame.size.height)
                
                //arrow blue other
                self.ArrowBlueOther.frame = CGRectMake(self.ArrowBlueOther.frame.origin.x,690, self.ArrowBlueOther.frame.size.width, self.ArrowBlueOther.frame.size.height)
                
                //line Other
                self.LabelOther5.frame = CGRectMake(self.LabelOther5.frame.origin.x,700, self.LabelOther5.frame.size.width, self.LabelOther5.frame.size.height)
                
                
                
            }//finalizacion iphone 4
                
                //iphone 6
                
            else if (self.Window.frame.size.height > 568 && self.Window.frame.size.height <= 667){
                self.ScrollView.contentSize = CGSizeMake(self.view.frame.size.width, 2000)
                
                //traer boton de address
                self.HomeButton.frame = CGRectMake(self.HomeButton.frame.origin.x, 620, self.HomeButton.frame.size.width, self.HomeButton.frame.size.height)
                
                //traer flecha gris de address
                self.ArrowBlue2.frame = CGRectMake(self.ArrowBlue2.frame.origin.x,640 , self.ArrowBlue2.frame.size.width, self.ArrowBlue2.frame.size.height)
                
                self.LabelHome1.frame = CGRectMake(self.LabelHome1.frame.origin.x,650, self.LabelHome1.frame.size.width, self.LabelHome1.frame.size.height)
                
                
                //office button
                self.OfficeButton.frame = CGRectMake(self.OfficeButton.frame.origin.x,660, self.OfficeButton.frame.size.width, self.OfficeButton.frame.size.height)
                
                //arrow blue office
                self.ArrowBlueOffice.frame = CGRectMake(self.ArrowBlueOffice.frame.origin.x,690, self.ArrowBlueOffice.frame.size.width, self.ArrowBlueOffice.frame.size.height)
                
                //line office
                self.LabelOffice1.frame = CGRectMake(self.LabelOffice1.frame.origin.x,705, self.LabelOffice1.frame.size.width, self.LabelOffice1.frame.size.height)
                
                //Other Button
                self.OtherButton.frame = CGRectMake(self.OtherButton.frame.origin.x,710, self.OtherButton.frame.size.width, self.OtherButton.frame.size.height)
                
                //arrow blue other
                self.ArrowBlueOther.frame = CGRectMake(self.ArrowBlueOther.frame.origin.x,745, self.ArrowBlueOther.frame.size.width, self.ArrowBlueOther.frame.size.height)
                
                //line Other
                self.LabelOther5.frame = CGRectMake(self.LabelOther5.frame.origin.x,755, self.LabelOther5.frame.size.width, self.LabelOther5.frame.size.height)
                
                //save button
                self.SaveButton.frame = CGRectMake(self.SaveButton.frame.origin.x,890, self.SaveButton.frame.size.width, self.SaveButton.frame.size.height)
                
                
                
            }//iphone 6 plus
                
            else if (self.Window.frame.size.height > 667 && self.Window.frame.size.height <= 736){
                self.ScrollView.contentSize = CGSizeMake(self.view.frame.size.width, 2250)
                
                //traer boton de address
                self.HomeButton.frame = CGRectMake(self.HomeButton.frame.origin.x, 710, self.HomeButton.frame.size.width, self.HomeButton.frame.size.height)
                
                //traer flecha gris de address
                self.ArrowBlue2.frame = CGRectMake(self.ArrowBlue2.frame.origin.x,720 , self.ArrowBlue2.frame.size.width, self.ArrowBlue2.frame.size.height)
                
                self.LabelHome1.frame = CGRectMake(self.LabelHome1.frame.origin.x,740, self.LabelHome1.frame.size.width, self.LabelHome1.frame.size.height)
                
                
                //office button
                self.OfficeButton.frame = CGRectMake(self.OfficeButton.frame.origin.x,755, self.OfficeButton.frame.size.width, self.OfficeButton.frame.size.height)
                
                //arrow blue office
                self.ArrowBlueOffice.frame = CGRectMake(self.ArrowBlueOffice.frame.origin.x,790, self.ArrowBlueOffice.frame.size.width, self.ArrowBlueOffice.frame.size.height)
                
                //line office
                self.LabelOffice1.frame = CGRectMake(self.LabelOffice1.frame.origin.x,800, self.LabelOffice1.frame.size.width, self.LabelOffice1.frame.size.height)
                
                //Other Button
                self.OtherButton.frame = CGRectMake(self.OtherButton.frame.origin.x,815, self.OtherButton.frame.size.width, self.OtherButton.frame.size.height)
                
                //arrow blue other
                self.ArrowBlueOther.frame = CGRectMake(self.ArrowBlueOther.frame.origin.x,850, self.ArrowBlueOther.frame.size.width, self.ArrowBlueOther.frame.size.height)
                
                //line Other
                self.LabelOther5.frame = CGRectMake(self.LabelOther5.frame.origin.x,860, self.LabelOther5.frame.size.width, self.LabelOther5.frame.size.height)
                
                //save button
                self.SaveButton.frame = CGRectMake(self.SaveButton.frame.origin.x,990, self.SaveButton.frame.size.width, self.SaveButton.frame.size.height)
                
            }

            
            
            
            
        
        
        
        }//finalizacion del addresshome false
        
        else{
            self.SaveButton.backgroundColor = UIColor (red:0.686,green:0.686,blue:0.686,alpha:1)
            
              self.ScrollView.contentSize = CGSizeMake(self.view.frame.size.width, 2350)
               self.ArrowBlue2.image = UIImage (named: "arrow_blue_UP")
            self.HomeButton.tintColor = UIColor.redColor()
            self.OtherButton.tintColor = UIColor (red: 0.945, green: 0.945, blue: 0.945, alpha: 1)
            self.OfficeButton.tintColor = UIColor (red: 0.945, green: 0.945, blue: 0.945, alpha: 1)
            
            self.SaveButton.enabled = false
            self.CreditCardButton.enabled = false
            self.AddressHome.enabled = false
            self.ZipcodeHome.enabled = false
            self.SpecialHome.enabled = false
            self.UnitedHome.enabled = false
            self.CloseButton.enabled = false
            
         
            //mostrar elementos de home
            self.HomeButton.hidden = false
            self.ArrowBlue2.hidden = false
            self.AddressHome.hidden = false
            self.CloseButton.hidden = false
            self.ZipcodeHome.hidden = false
            self.SpecialHome.hidden = false
            self.UnitedHome.hidden = false
            self.LabelHome1.hidden = false
            self.LabelHome2.hidden = false
            self.LabelHome3.hidden = false
            self.LabelHome4.hidden = false
            self.LabelHome5.hidden = false
            self.LabelHome6.hidden = false
            self.EditButtonHome.hidden = false
            self.SaveButton.hidden = false
            self.SaveButton.hidden = false
            
            //  POSICIONAMIENTO DE LOS ELEMENTOS 
            
            
            //iphone 4
            if (self.Window.frame.size.height <= 480 ){
                self.ScrollView.contentSize = CGSizeMake(self.view.frame.size.width, 1865)
                
            self.AddressHome.frame = CGRectMake(self.AddressHome.frame.origin.x,600, self.AddressHome.frame.size.width, self.AddressHome.frame.size.height)
                
                self.LabelHome2.frame = CGRectMake(self.LabelHome2.frame.origin.x,650, self.LabelHome2.frame.size.width, self.LabelHome2.frame.size.height)
                
                self.LabelHome3.frame = CGRectMake(self.LabelHome3.frame.origin.x,650, self.LabelHome3.frame.size.width, self.LabelHome3.frame.size.height)
                
                self.CloseButton.frame = CGRectMake(self.CloseButton.frame.origin.x,620, self.CloseButton.frame.size.width, self.CloseButton.frame.size.height)
                
                self.UnitedHome.frame = CGRectMake(self.UnitedHome.frame.origin.x,640, self.UnitedHome.frame.size.width, self.UnitedHome.frame.size.height)
                
                self.ZipcodeHome.frame = CGRectMake(self.ZipcodeHome.frame.origin.x,640, self.ZipcodeHome.frame.size.width, self.ZipcodeHome.frame.size.height)
                
                self.LabelHome6.frame = CGRectMake(self.LabelHome6.frame.origin.x,695, self.LabelHome6.frame.size.width, self.LabelHome6.frame.size.height)
                
                self.SpecialHome.frame = CGRectMake(self.SpecialHome.frame.origin.x,685, self.SpecialHome.frame.size.width, self.SpecialHome.frame.size.height)
                
                self.LabelHome5.frame = CGRectMake(self.LabelHome5.frame.origin.x,740, self.LabelHome5.frame.size.width, self.LabelHome5.frame.size.height)
                
                self.EditButtonHome.frame = CGRectMake(self.EditButtonHome.frame.origin.x,770, self.EditButtonHome.frame.size.width, self.EditButtonHome.frame.size.height)
                
                self.LabelHome4.frame = CGRectMake(self.LabelHome4.frame.origin.x,825, self.LabelHome4.frame.size.width, self.LabelHome4.frame.size.height)
                
                
                //traer boton de address
                self.OfficeButton.frame = CGRectMake(self.OfficeButton.frame.origin.x,820, self.OfficeButton.frame.size.width, self.OfficeButton.frame.size.height)
                
                //arrow blue office
                self.ArrowBlueOffice.frame = CGRectMake(self.ArrowBlueOffice.frame.origin.x,850, self.ArrowBlueOffice.frame.size.width, self.ArrowBlueOffice.frame.size.height)
                
                    //line office
                self.LabelOffice1.frame = CGRectMake(self.LabelOffice1.frame.origin.x,870, self.LabelOffice1.frame.size.width, self.LabelOffice1.frame.size.height)
                
                //Other Button
                self.OtherButton.frame = CGRectMake(self.OtherButton.frame.origin.x,870, self.OtherButton.frame.size.width, self.OtherButton.frame.size.height)
                
                //arrow blue other
                self.ArrowBlueOther.frame = CGRectMake(self.ArrowBlueOther.frame.origin.x,900, self.ArrowBlueOther.frame.size.width, self.ArrowBlueOther.frame.size.height)
                
                //line Other
                self.LabelOther5.frame = CGRectMake(self.LabelOther5.frame.origin.x,920, self.LabelOther5.frame.size.width, self.LabelOther5.frame.size.height)
                
                
                self.SaveButton.frame = CGRectMake(self.SaveButton.frame.origin.x,950, self.SaveButton.frame.size.width, self.SaveButton.frame.size.height)
                
                
                
            }//finalizacion del iphone 4
                
                //iphone 5
            else if (self.Window.frame.size.height > 480 && self.Window.frame.size.height <= 568 ){
                self.ScrollView.contentSize = CGSizeMake(self.view.frame.size.width, 2028)
                
                self.AddressHome.frame = CGRectMake(self.AddressHome.frame.origin.x,590, self.AddressHome.frame.size.width, self.AddressHome.frame.size.height)
                
                self.LabelHome2.frame = CGRectMake(self.LabelHome2.frame.origin.x,640, self.LabelHome2.frame.size.width, self.LabelHome2.frame.size.height)
                
                self.LabelHome3.frame = CGRectMake(self.LabelHome3.frame.origin.x,645, self.LabelHome3.frame.size.width, self.LabelHome3.frame.size.height)
                
                self.CloseButton.frame = CGRectMake(self.CloseButton.frame.origin.x,610, self.CloseButton.frame.size.width, self.CloseButton.frame.size.height)
                
                self.UnitedHome.frame = CGRectMake(self.UnitedHome.frame.origin.x,640, self.UnitedHome.frame.size.width, self.UnitedHome.frame.size.height)
                
                self.ZipcodeHome.frame = CGRectMake(self.ZipcodeHome.frame.origin.x,640, self.ZipcodeHome.frame.size.width, self.ZipcodeHome.frame.size.height)
                
                self.LabelHome6.frame = CGRectMake(self.LabelHome6.frame.origin.x,695, self.LabelHome6.frame.size.width, self.LabelHome6.frame.size.height)
                
                self.SpecialHome.frame = CGRectMake(self.SpecialHome.frame.origin.x,685, self.SpecialHome.frame.size.width, self.SpecialHome.frame.size.height)
                
                self.LabelHome5.frame = CGRectMake(self.LabelHome5.frame.origin.x,740, self.LabelHome5.frame.size.width, self.LabelHome5.frame.size.height)
                
                self.EditButtonHome.frame = CGRectMake(self.EditButtonHome.frame.origin.x,770, self.EditButtonHome.frame.size.width, self.EditButtonHome.frame.size.height)
                
                self.LabelHome4.frame = CGRectMake(self.LabelHome4.frame.origin.x,825, self.LabelHome4.frame.size.width, self.LabelHome4.frame.size.height)
                
                
                //traer boton de address
                self.OfficeButton.frame = CGRectMake(self.OfficeButton.frame.origin.x,820, self.OfficeButton.frame.size.width, self.OfficeButton.frame.size.height)
                
                //arrow blue office
                self.ArrowBlueOffice.frame = CGRectMake(self.ArrowBlueOffice.frame.origin.x,850, self.ArrowBlueOffice.frame.size.width, self.ArrowBlueOffice.frame.size.height)
                
                //line office
                self.LabelOffice1.frame = CGRectMake(self.LabelOffice1.frame.origin.x,870, self.LabelOffice1.frame.size.width, self.LabelOffice1.frame.size.height)
                
                //Other Button
                self.OtherButton.frame = CGRectMake(self.OtherButton.frame.origin.x,870, self.OtherButton.frame.size.width, self.OtherButton.frame.size.height)
                
                //arrow blue other
                self.ArrowBlueOther.frame = CGRectMake(self.ArrowBlueOther.frame.origin.x,900, self.ArrowBlueOther.frame.size.width, self.ArrowBlueOther.frame.size.height)
                
                //line Other
                self.LabelOther5.frame = CGRectMake(self.LabelOther5.frame.origin.x,920, self.LabelOther5.frame.size.width, self.LabelOther5.frame.size.height)
                
                
                self.SaveButton.frame = CGRectMake(self.SaveButton.frame.origin.x,950, self.SaveButton.frame.size.width, self.SaveButton.frame.size.height)
                
                
                
            }//finalizacion iphone 5
                
                //iphone 6
            else if (self.Window.frame.size.height > 568 && self.Window.frame.size.height <= 667){
                self.ScrollView.contentSize = CGSizeMake(self.view.frame.size.width, 2250)
                
                
                self.AddressHome.frame = CGRectMake(self.AddressHome.frame.origin.x,645, self.AddressHome.frame.size.width, self.AddressHome.frame.size.height)
                
                self.LabelHome2.frame = CGRectMake(self.LabelHome2.frame.origin.x,700, self.LabelHome2.frame.size.width, self.LabelHome2.frame.size.height)
                
                self.LabelHome3.frame = CGRectMake(self.LabelHome3.frame.origin.x,700, self.LabelHome3.frame.size.width, self.LabelHome3.frame.size.height)
                
                self.CloseButton.frame = CGRectMake(self.CloseButton.frame.origin.x,670, self.CloseButton.frame.size.width, self.CloseButton.frame.size.height)
                
                self.UnitedHome.frame = CGRectMake(self.UnitedHome.frame.origin.x,695, self.UnitedHome.frame.size.width, self.UnitedHome.frame.size.height)
                
                self.ZipcodeHome.frame = CGRectMake(self.ZipcodeHome.frame.origin.x,695, self.ZipcodeHome.frame.size.width, self.ZipcodeHome.frame.size.height)
                
                self.LabelHome6.frame = CGRectMake(self.LabelHome6.frame.origin.x,750, self.LabelHome6.frame.size.width, self.LabelHome6.frame.size.height)
                
                self.SpecialHome.frame = CGRectMake(self.SpecialHome.frame.origin.x,750, self.SpecialHome.frame.size.width, self.SpecialHome.frame.size.height)
                
                self.LabelHome5.frame = CGRectMake(self.LabelHome5.frame.origin.x,800, self.LabelHome5.frame.size.width, self.LabelHome5.frame.size.height)
                
                self.EditButtonHome.frame = CGRectMake(self.EditButtonHome.frame.origin.x,820, self.EditButtonHome.frame.size.width, self.EditButtonHome.frame.size.height)
                
                self.LabelHome4.frame = CGRectMake(self.LabelHome4.frame.origin.x,870, self.LabelHome4.frame.size.width, self.LabelHome4.frame.size.height)
                
                
                //traer boton de address
                self.OfficeButton.frame = CGRectMake(self.OfficeButton.frame.origin.x,870, self.OfficeButton.frame.size.width, self.OfficeButton.frame.size.height)
                
                //arrow blue office
                self.ArrowBlueOffice.frame = CGRectMake(self.ArrowBlueOffice.frame.origin.x,900, self.ArrowBlueOffice.frame.size.width, self.ArrowBlueOffice.frame.size.height)
                
                //line office
                self.LabelOffice1.frame = CGRectMake(self.LabelOffice1.frame.origin.x,920, self.LabelOffice1.frame.size.width, self.LabelOffice1.frame.size.height)
                
                //Other Button
                self.OtherButton.frame = CGRectMake(self.OtherButton.frame.origin.x,920, self.OtherButton.frame.size.width, self.OtherButton.frame.size.height)
                
                //arrow blue other
                self.ArrowBlueOther.frame = CGRectMake(self.ArrowBlueOther.frame.origin.x,950, self.ArrowBlueOther.frame.size.width, self.ArrowBlueOther.frame.size.height)
                
                //line Other
                self.LabelOther5.frame = CGRectMake(self.LabelOther5.frame.origin.x,970, self.LabelOther5.frame.size.width, self.LabelOther5.frame.size.height)
                
                
                self.SaveButton.frame = CGRectMake(self.SaveButton.frame.origin.x,995, self.SaveButton.frame.size.width, self.SaveButton.frame.size.height)
                
            }//finalizacion del iphone 6
            
            //iphone 6 plus
            else if (self.Window.frame.size.height > 667 && self.Window.frame.size.height <= 736){
                self.ScrollView.contentSize = CGSizeMake(self.view.frame.size.width, 2450)
                
                self.AddressHome.frame = CGRectMake(self.AddressHome.frame.origin.x,740, self.AddressHome.frame.size.width, self.AddressHome.frame.size.height)
                
                self.LabelHome2.frame = CGRectMake(self.LabelHome2.frame.origin.x,790, self.LabelHome2.frame.size.width, self.LabelHome2.frame.size.height)
                
                self.LabelHome3.frame = CGRectMake(self.LabelHome3.frame.origin.x,790, self.LabelHome3.frame.size.width, self.LabelHome3.frame.size.height)
                
                self.CloseButton.frame = CGRectMake(self.CloseButton.frame.origin.x,760, self.CloseButton.frame.size.width, self.CloseButton.frame.size.height)
                
                self.UnitedHome.frame = CGRectMake(self.UnitedHome.frame.origin.x,785, self.UnitedHome.frame.size.width, self.UnitedHome.frame.size.height)
                
                self.ZipcodeHome.frame = CGRectMake(self.ZipcodeHome.frame.origin.x,785, self.ZipcodeHome.frame.size.width, self.ZipcodeHome.frame.size.height)
                
                self.LabelHome6.frame = CGRectMake(self.LabelHome6.frame.origin.x,840, self.LabelHome6.frame.size.width, self.LabelHome6.frame.size.height)
                
                self.SpecialHome.frame = CGRectMake(self.SpecialHome.frame.origin.x,830, self.SpecialHome.frame.size.width, self.SpecialHome.frame.size.height)
                
                self.LabelHome5.frame = CGRectMake(self.LabelHome5.frame.origin.x,885, self.LabelHome5.frame.size.width, self.LabelHome5.frame.size.height)
                
                self.EditButtonHome.frame = CGRectMake(self.EditButtonHome.frame.origin.x,910, self.EditButtonHome.frame.size.width, self.EditButtonHome.frame.size.height)
                
                self.LabelHome4.frame = CGRectMake(self.LabelHome4.frame.origin.x,960, self.LabelHome4.frame.size.width, self.LabelHome4.frame.size.height)
                
                
                //traer boton de address
                self.OfficeButton.frame = CGRectMake(self.OfficeButton.frame.origin.x,950, self.OfficeButton.frame.size.width, self.OfficeButton.frame.size.height)
                
                //arrow blue office
                self.ArrowBlueOffice.frame = CGRectMake(self.ArrowBlueOffice.frame.origin.x,980, self.ArrowBlueOffice.frame.size.width, self.ArrowBlueOffice.frame.size.height)
                
                //line office
                self.LabelOffice1.frame = CGRectMake(self.LabelOffice1.frame.origin.x,1000, self.LabelOffice1.frame.size.width, self.LabelOffice1.frame.size.height)
                
                //Other Button
                self.OtherButton.frame = CGRectMake(self.OtherButton.frame.origin.x,990, self.OtherButton.frame.size.width, self.OtherButton.frame.size.height)
                
                //arrow blue other
                self.ArrowBlueOther.frame = CGRectMake(self.ArrowBlueOther.frame.origin.x,1020, self.ArrowBlueOther.frame.size.width, self.ArrowBlueOther.frame.size.height)
                
                //line Other
                self.LabelOther5.frame = CGRectMake(self.LabelOther5.frame.origin.x,1040, self.LabelOther5.frame.size.width, self.LabelOther5.frame.size.height)
                
                
                self.SaveButton.frame = CGRectMake(self.SaveButton.frame.origin.x,1070, self.SaveButton.frame.size.width, self.SaveButton.frame.size.height)
                
                
                
                
            }//finalizacion Iphone 6plus
        
        }//finalizacion del home abierto
        
        
    }//finalizacion del boton home
  
    //OFFICE BUTTON ACTION
    @IBAction func OffButton(sender: UIButton) {
        
        if(self.AddressHome.hidden==false){
            
             self.ScrollView.contentSize = CGSizeMake(self.view.frame.size.width, 2350)
             self.ArrowBlueOffice.image = UIImage (named: "arrow_blue_UP")
              self.ArrowBlue2.image = UIImage (named: "arrow_blue")
            self.SaveButton.backgroundColor = UIColor (red:0.686,green:0.686,blue:0.686,alpha:1)
            self.SaveButton.enabled = false
            self.CreditCardButton.enabled = false
            
            //ocultar elementos de home
            self.HomeButton.hidden = false
            self.ArrowBlue2.hidden = false
            self.AddressHome.hidden = true
            self.CloseButton.hidden = true
            self.ZipcodeHome.hidden = true
            self.SpecialHome.hidden = true
            self.UnitedHome.hidden = true
            self.LabelHome1.hidden = false
            self.LabelHome2.hidden = true
            self.LabelHome3.hidden = true
            self.LabelHome4.hidden = true
            self.LabelHome5.hidden = true
            self.LabelHome6.hidden = true
            self.EditButtonHome.hidden = true
            self.SaveButton.hidden = true
            
            
            //mostrar elementos de office
            self.OfficeButton.hidden = false
            self.ArrowBlueOffice.hidden = false
            self.LabelOffice1.hidden = false
            self.AddressOffice.hidden = false
            self.CloseOffice.hidden = false
            self.LabelOffice2.hidden = false
            self.UnitedOffice.hidden = false
            self.ZipcodeOffice.hidden = false
            self.LabelOffice3.hidden = false
            self.LabelOffice4.hidden = false
            self.SpecialOffice.hidden = false
            self.LabelOffice6.hidden = false
            self.LabelOffice5.hidden = false
            self.EditButtonOffice.hidden = false
            self.SaveButton.hidden = false
            
            //POSICIONAMIENTO DE LOS ELEMENTOS
            
            //iphone 4
            if (self.Window.frame.size.height <= 480 ){
                self.ScrollView.contentSize = CGSizeMake(self.view.frame.size.width, 1850)
                
                self.AddressOffice.frame = CGRectMake(self.AddressOffice.frame.origin.x,650, self.AddressOffice.frame.size.width, self.AddressOffice.frame.size.height)
                
                self.LabelOffice2.frame = CGRectMake(self.LabelOffice2.frame.origin.x,700, self.LabelOffice2.frame.size.width, self.LabelOffice2.frame.size.height)
                
                self.LabelOffice3.frame = CGRectMake(self.LabelOffice3.frame.origin.x,695, self.LabelOffice3.frame.size.width, self.LabelOffice3.frame.size.height)
                
                self.CloseOffice.frame = CGRectMake(self.CloseOffice.frame.origin.x,670, self.CloseOffice.frame.size.width, self.CloseOffice.frame.size.height)
                
                self.UnitedOffice.frame = CGRectMake(self.UnitedOffice.frame.origin.x,690, self.UnitedOffice.frame.size.width, self.UnitedOffice.frame.size.height)
                
                self.ZipcodeOffice.frame = CGRectMake(self.ZipcodeOffice.frame.origin.x,690, self.ZipcodeOffice.frame.size.width, self.ZipcodeOffice.frame.size.height)
                
                self.LabelOffice6.frame = CGRectMake(self.LabelOffice6.frame.origin.x,750, self.LabelOffice6.frame.size.width, self.LabelOffice6.frame.size.height)
                
                self.SpecialOffice.frame = CGRectMake(self.SpecialOffice.frame.origin.x,740, self.SpecialOffice.frame.size.width, self.SpecialOffice.frame.size.height)
                
                self.LabelOffice5.frame = CGRectMake(self.LabelOffice5.frame.origin.x,860, self.LabelOffice5.frame.size.width, self.LabelOffice5.frame.size.height)
                
                self.EditButtonOffice.frame = CGRectMake(self.EditButtonOffice.frame.origin.x,810, self.EditButtonOffice.frame.size.width, self.EditButtonOffice.frame.size.height)
                
                self.LabelOffice4.frame = CGRectMake(self.LabelOffice4.frame.origin.x,790, self.LabelOffice4.frame.size.width, self.LabelOffice4.frame.size.height)
                
                
                //traer boton de address
                self.OfficeButton.frame = CGRectMake(self.OfficeButton.frame.origin.x,600, self.OfficeButton.frame.size.width, self.OfficeButton.frame.size.height)
                
                //arrow blue office
                self.ArrowBlueOffice.frame = CGRectMake(self.ArrowBlueOffice.frame.origin.x,635, self.ArrowBlueOffice.frame.size.width, self.ArrowBlueOffice.frame.size.height)
                
                //line office
                self.LabelOffice1.frame = CGRectMake(self.LabelOffice1.frame.origin.x,650, self.LabelOffice1.frame.size.width, self.LabelOffice1.frame.size.height)
                
                //Other Button
                self.OtherButton.frame = CGRectMake(self.OtherButton.frame.origin.x,850, self.OtherButton.frame.size.width, self.OtherButton.frame.size.height)
                
                //arrow blue other
                self.ArrowBlueOther.frame = CGRectMake(self.ArrowBlueOther.frame.origin.x,880, self.ArrowBlueOther.frame.size.width, self.ArrowBlueOther.frame.size.height)
                
                //line Other
                self.LabelOther5.frame = CGRectMake(self.LabelOther5.frame.origin.x,905, self.LabelOther5.frame.size.width, self.LabelOther5.frame.size.height)
                
                
                self.SaveButton.frame = CGRectMake(self.SaveButton.frame.origin.x,930, self.SaveButton.frame.size.width, self.SaveButton.frame.size.height)
                
                
                
            }//finalizacion del iphone 4
                
                //iphone 5
            else if (self.Window.frame.size.height > 480 && self.Window.frame.size.height <= 568 ){
                self.ScrollView.contentSize = CGSizeMake(self.view.frame.size.width, 1965)
                
                self.AddressOffice.frame = CGRectMake(self.AddressOffice.frame.origin.x,630, self.AddressOffice.frame.size.width, self.AddressOffice.frame.size.height)
                
                self.LabelOffice2.frame = CGRectMake(self.LabelOffice2.frame.origin.x,680, self.LabelOffice2.frame.size.width, self.LabelOffice2.frame.size.height)
                
                self.LabelOffice3.frame = CGRectMake(self.LabelOffice3.frame.origin.x,680, self.LabelOffice3.frame.size.width, self.LabelOffice3.frame.size.height)
                
                self.CloseOffice.frame = CGRectMake(self.CloseOffice.frame.origin.x,660, self.CloseOffice.frame.size.width, self.CloseOffice.frame.size.height)
                
                self.UnitedOffice.frame = CGRectMake(self.UnitedOffice.frame.origin.x,670, self.UnitedOffice.frame.size.width, self.UnitedOffice.frame.size.height)
                
                self.ZipcodeOffice.frame = CGRectMake(self.ZipcodeOffice.frame.origin.x,670, self.ZipcodeOffice.frame.size.width, self.ZipcodeOffice.frame.size.height)
                
                self.LabelOffice6.frame = CGRectMake(self.LabelOffice6.frame.origin.x,725, self.LabelOffice6.frame.size.width, self.LabelOffice6.frame.size.height)
                
                self.SpecialOffice.frame = CGRectMake(self.SpecialOffice.frame.origin.x,715, self.SpecialOffice.frame.size.width, self.SpecialOffice.frame.size.height)
                
                self.LabelOffice5.frame = CGRectMake(self.LabelOffice5.frame.origin.x,760, self.LabelOffice5.frame.size.width, self.LabelOffice5.frame.size.height)
                
                self.EditButtonOffice.frame = CGRectMake(self.EditButtonOffice.frame.origin.x,780, self.EditButtonOffice.frame.size.width, self.EditButtonOffice.frame.size.height)
                
                self.LabelOffice4.frame = CGRectMake(self.LabelOffice4.frame.origin.x,830, self.LabelOffice4.frame.size.width, self.LabelOffice4.frame.size.height)
                
                
                //traer boton de address
                self.OfficeButton.frame = CGRectMake(self.OfficeButton.frame.origin.x,590, self.OfficeButton.frame.size.width, self.OfficeButton.frame.size.height)
                
                //arrow blue office
                self.ArrowBlueOffice.frame = CGRectMake(self.ArrowBlueOffice.frame.origin.x,620, self.ArrowBlueOffice.frame.size.width, self.ArrowBlueOffice.frame.size.height)
                
                //line office
                self.LabelOffice1.frame = CGRectMake(self.LabelOffice1.frame.origin.x,640, self.LabelOffice1.frame.size.width, self.LabelOffice1.frame.size.height)
                
                //Other Button
                self.OtherButton.frame = CGRectMake(self.OtherButton.frame.origin.x,820, self.OtherButton.frame.size.width, self.OtherButton.frame.size.height)
                
                //arrow blue other
                self.ArrowBlueOther.frame = CGRectMake(self.ArrowBlueOther.frame.origin.x,850, self.ArrowBlueOther.frame.size.width, self.ArrowBlueOther.frame.size.height)
                
                //line Other
                self.LabelOther5.frame = CGRectMake(self.LabelOther5.frame.origin.x,870, self.LabelOther5.frame.size.width, self.LabelOther5.frame.size.height)
                
                
                self.SaveButton.frame = CGRectMake(self.SaveButton.frame.origin.x,890, self.SaveButton.frame.size.width, self.SaveButton.frame.size.height)
                
                
                
            }//finalizacion iphone 5
                
                //iphone 6
            else if (self.Window.frame.size.height > 568 && self.Window.frame.size.height <= 667){
                self.ScrollView.contentSize = CGSizeMake(self.view.frame.size.width, 2220)
                
                
                self.AddressOffice.frame = CGRectMake(self.AddressOffice.frame.origin.x,690, self.AddressOffice.frame.size.width, self.AddressOffice.frame.size.height)
                
                self.LabelOffice2.frame = CGRectMake(self.LabelOffice2.frame.origin.x,740, self.LabelOffice2.frame.size.width, self.LabelOffice2.frame.size.height)
                
                self.LabelOffice3.frame = CGRectMake(self.LabelOffice3.frame.origin.x,740, self.LabelOffice3.frame.size.width, self.LabelOffice3.frame.size.height)
                
                self.CloseOffice.frame = CGRectMake(self.CloseOffice.frame.origin.x,720, self.CloseOffice.frame.size.width, self.CloseOffice.frame.size.height)
                
                self.UnitedOffice.frame = CGRectMake(self.UnitedOffice.frame.origin.x,730, self.UnitedOffice.frame.size.width, self.UnitedOffice.frame.size.height)
                
                self.ZipcodeOffice.frame = CGRectMake(self.ZipcodeOffice.frame.origin.x,730, self.ZipcodeOffice.frame.size.width, self.ZipcodeOffice.frame.size.height)
                
                self.LabelOffice6.frame = CGRectMake(self.LabelOffice6.frame.origin.x,785, self.LabelOffice6.frame.size.width, self.LabelOffice6.frame.size.height)
                
                self.SpecialOffice.frame = CGRectMake(self.SpecialOffice.frame.origin.x,770, self.SpecialOffice.frame.size.width, self.SpecialOffice.frame.size.height)
                
                self.LabelOffice5.frame = CGRectMake(self.LabelOffice5.frame.origin.x,825, self.LabelOffice5.frame.size.width, self.LabelOffice5.frame.size.height)
                
                self.EditButtonOffice.frame = CGRectMake(self.EditButtonOffice.frame.origin.x,850, self.EditButtonOffice.frame.size.width, self.EditButtonOffice.frame.size.height)
                
                self.LabelOffice4.frame = CGRectMake(self.LabelOffice4.frame.origin.x,900, self.LabelOffice4.frame.size.width, self.LabelOffice4.frame.size.height)
                
                
                //traer boton de address
                self.OfficeButton.frame = CGRectMake(self.OfficeButton.frame.origin.x,650, self.OfficeButton.frame.size.width, self.OfficeButton.frame.size.height)
                
                //arrow blue office
                self.ArrowBlueOffice.frame = CGRectMake(self.ArrowBlueOffice.frame.origin.x,680, self.ArrowBlueOffice.frame.size.width, self.ArrowBlueOffice.frame.size.height)
                
                //line office
                self.LabelOffice1.frame = CGRectMake(self.LabelOffice1.frame.origin.x,700, self.LabelOffice1.frame.size.width, self.LabelOffice1.frame.size.height)
                
                //Other Button
                self.OtherButton.frame = CGRectMake(self.OtherButton.frame.origin.x,890, self.OtherButton.frame.size.width, self.OtherButton.frame.size.height)
                
                //arrow blue other
                self.ArrowBlueOther.frame = CGRectMake(self.ArrowBlueOther.frame.origin.x,920, self.ArrowBlueOther.frame.size.width, self.ArrowBlueOther.frame.size.height)
                
                //line Other
                self.LabelOther5.frame = CGRectMake(self.LabelOther5.frame.origin.x,940, self.LabelOther5.frame.size.width, self.LabelOther5.frame.size.height)
                
                
                self.SaveButton.frame = CGRectMake(self.SaveButton.frame.origin.x,965, self.SaveButton.frame.size.width, self.SaveButton.frame.size.height)
                
            }//finalizacion del iphone 6
                
                //iphone 6 plus
            else if (self.Window.frame.size.height > 667 && self.Window.frame.size.height <= 736){
                self.ScrollView.contentSize = CGSizeMake(self.view.frame.size.width, 2450)
                
                self.AddressOffice.frame = CGRectMake(self.AddressOffice.frame.origin.x,790, self.AddressOffice.frame.size.width, self.AddressOffice.frame.size.height)
                
                self.LabelOffice2.frame = CGRectMake(self.LabelOffice2.frame.origin.x,840, self.LabelOffice2.frame.size.width, self.LabelOffice2.frame.size.height)
                
                self.LabelOffice3.frame = CGRectMake(self.LabelOffice3.frame.origin.x,840, self.LabelOffice3.frame.size.width, self.LabelOffice3.frame.size.height)
                
                self.CloseOffice.frame = CGRectMake(self.CloseOffice.frame.origin.x,810, self.CloseOffice.frame.size.width, self.CloseOffice.frame.size.height)
                
                self.UnitedOffice.frame = CGRectMake(self.UnitedOffice.frame.origin.x,830, self.UnitedOffice.frame.size.width, self.UnitedOffice.frame.size.height)
                
                self.ZipcodeOffice.frame = CGRectMake(self.ZipcodeOffice.frame.origin.x,830, self.ZipcodeOffice.frame.size.width, self.ZipcodeOffice.frame.size.height)
                
                self.LabelOffice6.frame = CGRectMake(self.LabelOffice6.frame.origin.x,885, self.LabelOffice6.frame.size.width, self.LabelOffice6.frame.size.height)
                
                self.SpecialOffice.frame = CGRectMake(self.SpecialOffice.frame.origin.x,870, self.SpecialOffice.frame.size.width, self.SpecialOffice.frame.size.height)
                
                self.LabelOffice5.frame = CGRectMake(self.LabelOffice5.frame.origin.x,925, self.LabelOffice5.frame.size.width, self.LabelOffice5.frame.size.height)
                
                self.EditButtonOffice.frame = CGRectMake(self.EditButtonOffice.frame.origin.x,950, self.EditButtonOffice.frame.size.width, self.EditButtonOffice.frame.size.height)
                
                self.LabelOffice4.frame = CGRectMake(self.LabelOffice4.frame.origin.x,1000, self.LabelOffice4.frame.size.width, self.LabelOffice4.frame.size.height)
                
                
                //traer boton de address
                self.OfficeButton.frame = CGRectMake(self.OfficeButton.frame.origin.x,750, self.OfficeButton.frame.size.width, self.OfficeButton.frame.size.height)
                
                //arrow blue office
                self.ArrowBlueOffice.frame = CGRectMake(self.ArrowBlueOffice.frame.origin.x,780, self.ArrowBlueOffice.frame.size.width, self.ArrowBlueOffice.frame.size.height)
                
                //line office
                self.LabelOffice1.frame = CGRectMake(self.LabelOffice1.frame.origin.x,800, self.LabelOffice1.frame.size.width, self.LabelOffice1.frame.size.height)
                
                //Other Button
                self.OtherButton.frame = CGRectMake(self.OtherButton.frame.origin.x,990, self.OtherButton.frame.size.width, self.OtherButton.frame.size.height)
                
                //arrow blue other
                self.ArrowBlueOther.frame = CGRectMake(self.ArrowBlueOther.frame.origin.x,1020, self.ArrowBlueOther.frame.size.width, self.ArrowBlueOther.frame.size.height)
                
                //line Other
                self.LabelOther5.frame = CGRectMake(self.LabelOther5.frame.origin.x,1040, self.LabelOther5.frame.size.width, self.LabelOther5.frame.size.height)
                
                
                self.SaveButton.frame = CGRectMake(self.SaveButton.frame.origin.x,1070, self.SaveButton.frame.size.width, self.SaveButton.frame.size.height)
                
                
                
                
            }//finalizacion Iphone 6plus
            

            
            
            
        
        
        }//finalizacion homebutton false
        
        
        else if(self.AddressButtonOther.hidden==false){
             self.ScrollView.contentSize = CGSizeMake(self.view.frame.size.width, 2350)
            
            self.ArrowBlueOffice.image = UIImage (named: "arrow_blue_UP")
            self.ArrowBlueOther.image = UIImage (named: "arrow_blue")
            self.SaveButton.backgroundColor = UIColor (red:0.686,green:0.686,blue:0.686,alpha:1)
            self.SaveButton.enabled = false
            self.CreditCardButton.enabled = false

            
            //mostrar elementos de office
            self.OfficeButton.hidden = false
            self.ArrowBlueOffice.hidden = false
            self.LabelOffice1.hidden = false
            self.AddressOffice.hidden = false
            self.CloseOffice.hidden = false
            self.LabelOffice2.hidden = false
            self.UnitedOffice.hidden = false
            self.ZipcodeOffice.hidden = false
            self.LabelOffice3.hidden = false
            self.LabelOffice4.hidden = false
            self.SpecialOffice.hidden = false
            self.LabelOffice6.hidden = false
            self.LabelOffice5.hidden = false
            self.EditButtonOffice.hidden = false
            self.SaveButton.hidden = false
            
            //ocultar elementos de Other
            self.OtherButton.hidden = false
            self.ArrowBlueOther.hidden = false
            self.AddressButtonOther.hidden = true
            self.CloseOther.hidden = true
            self.UnitedOther.hidden = true
            self.ZipcodeOther.hidden = true
            self.LabelOther2.hidden = true
            self.LabelOther3.hidden = true
            self.SpecialOther.hidden = true
            self.LabelOther4.hidden = true
            self.LabelOther5.hidden = false
            self.LabelOther6.hidden = true
            self.LabelOther1.hidden = true
            self.EditButtonOther.hidden = true
            
            //POSICIONAMIENTO DE LOS ELEMENTOS
            
            //iphone 4
            if (self.Window.frame.size.height <= 480 ){
                self.ScrollView.contentSize = CGSizeMake(self.view.frame.size.width, 1850)
                
                self.AddressOffice.frame = CGRectMake(self.AddressOffice.frame.origin.x,650, self.AddressOffice.frame.size.width, self.AddressOffice.frame.size.height)
                
                self.LabelOffice2.frame = CGRectMake(self.LabelOffice2.frame.origin.x,700, self.LabelOffice2.frame.size.width, self.LabelOffice2.frame.size.height)
                
                self.LabelOffice3.frame = CGRectMake(self.LabelOffice3.frame.origin.x,695, self.LabelOffice3.frame.size.width, self.LabelOffice3.frame.size.height)
                
                self.CloseOffice.frame = CGRectMake(self.CloseOffice.frame.origin.x,670, self.CloseOffice.frame.size.width, self.CloseOffice.frame.size.height)
                
                self.UnitedOffice.frame = CGRectMake(self.UnitedOffice.frame.origin.x,690, self.UnitedOffice.frame.size.width, self.UnitedOffice.frame.size.height)
                
                self.ZipcodeOffice.frame = CGRectMake(self.ZipcodeOffice.frame.origin.x,690, self.ZipcodeOffice.frame.size.width, self.ZipcodeOffice.frame.size.height)
                
                self.LabelOffice6.frame = CGRectMake(self.LabelOffice6.frame.origin.x,750, self.LabelOffice6.frame.size.width, self.LabelOffice6.frame.size.height)
                
                self.SpecialOffice.frame = CGRectMake(self.SpecialOffice.frame.origin.x,740, self.SpecialOffice.frame.size.width, self.SpecialOffice.frame.size.height)
                
                self.LabelOffice5.frame = CGRectMake(self.LabelOffice5.frame.origin.x,860, self.LabelOffice5.frame.size.width, self.LabelOffice5.frame.size.height)
                
                self.EditButtonOffice.frame = CGRectMake(self.EditButtonOffice.frame.origin.x,810, self.EditButtonOffice.frame.size.width, self.EditButtonOffice.frame.size.height)
                
                self.LabelOffice4.frame = CGRectMake(self.LabelOffice4.frame.origin.x,790, self.LabelOffice4.frame.size.width, self.LabelOffice4.frame.size.height)
                
                
                //traer boton de address
                self.OfficeButton.frame = CGRectMake(self.OfficeButton.frame.origin.x,600, self.OfficeButton.frame.size.width, self.OfficeButton.frame.size.height)
                
                //arrow blue office
                self.ArrowBlueOffice.frame = CGRectMake(self.ArrowBlueOffice.frame.origin.x,635, self.ArrowBlueOffice.frame.size.width, self.ArrowBlueOffice.frame.size.height)
                
                //line office
                self.LabelOffice1.frame = CGRectMake(self.LabelOffice1.frame.origin.x,650, self.LabelOffice1.frame.size.width, self.LabelOffice1.frame.size.height)
                
                //Other Button
                self.OtherButton.frame = CGRectMake(self.OtherButton.frame.origin.x,850, self.OtherButton.frame.size.width, self.OtherButton.frame.size.height)
                
                //arrow blue other
                self.ArrowBlueOther.frame = CGRectMake(self.ArrowBlueOther.frame.origin.x,880, self.ArrowBlueOther.frame.size.width, self.ArrowBlueOther.frame.size.height)
                
                //line Other
                self.LabelOther5.frame = CGRectMake(self.LabelOther5.frame.origin.x,905, self.LabelOther5.frame.size.width, self.LabelOther5.frame.size.height)
                
                
                self.SaveButton.frame = CGRectMake(self.SaveButton.frame.origin.x,930, self.SaveButton.frame.size.width, self.SaveButton.frame.size.height)
                
                
                
            }//finalizacion del iphone 4
                
                //iphone 5
            else if (self.Window.frame.size.height > 480 && self.Window.frame.size.height <= 568 ){
                self.ScrollView.contentSize = CGSizeMake(self.view.frame.size.width, 1960)
                
                self.AddressOffice.frame = CGRectMake(self.AddressOffice.frame.origin.x,630, self.AddressOffice.frame.size.width, self.AddressOffice.frame.size.height)
                
                self.LabelOffice2.frame = CGRectMake(self.LabelOffice2.frame.origin.x,680, self.LabelOffice2.frame.size.width, self.LabelOffice2.frame.size.height)
                
                self.LabelOffice3.frame = CGRectMake(self.LabelOffice3.frame.origin.x,680, self.LabelOffice3.frame.size.width, self.LabelOffice3.frame.size.height)
                
                self.CloseOffice.frame = CGRectMake(self.CloseOffice.frame.origin.x,660, self.CloseOffice.frame.size.width, self.CloseOffice.frame.size.height)
                
                self.UnitedOffice.frame = CGRectMake(self.UnitedOffice.frame.origin.x,670, self.UnitedOffice.frame.size.width, self.UnitedOffice.frame.size.height)
                
                self.ZipcodeOffice.frame = CGRectMake(self.ZipcodeOffice.frame.origin.x,670, self.ZipcodeOffice.frame.size.width, self.ZipcodeOffice.frame.size.height)
                
                self.LabelOffice6.frame = CGRectMake(self.LabelOffice6.frame.origin.x,725, self.LabelOffice6.frame.size.width, self.LabelOffice6.frame.size.height)
                
                self.SpecialOffice.frame = CGRectMake(self.SpecialOffice.frame.origin.x,715, self.SpecialOffice.frame.size.width, self.SpecialOffice.frame.size.height)
                
                self.LabelOffice5.frame = CGRectMake(self.LabelOffice5.frame.origin.x,760, self.LabelOffice5.frame.size.width, self.LabelOffice5.frame.size.height)
                
                self.EditButtonOffice.frame = CGRectMake(self.EditButtonOffice.frame.origin.x,780, self.EditButtonOffice.frame.size.width, self.EditButtonOffice.frame.size.height)
                
                self.LabelOffice4.frame = CGRectMake(self.LabelOffice4.frame.origin.x,830, self.LabelOffice4.frame.size.width, self.LabelOffice4.frame.size.height)
                
                
                //traer boton de address
                self.OfficeButton.frame = CGRectMake(self.OfficeButton.frame.origin.x,590, self.OfficeButton.frame.size.width, self.OfficeButton.frame.size.height)
                
                //arrow blue office
                self.ArrowBlueOffice.frame = CGRectMake(self.ArrowBlueOffice.frame.origin.x,620, self.ArrowBlueOffice.frame.size.width, self.ArrowBlueOffice.frame.size.height)
                
                //line office
                self.LabelOffice1.frame = CGRectMake(self.LabelOffice1.frame.origin.x,640, self.LabelOffice1.frame.size.width, self.LabelOffice1.frame.size.height)
                
                //Other Button
                self.OtherButton.frame = CGRectMake(self.OtherButton.frame.origin.x,820, self.OtherButton.frame.size.width, self.OtherButton.frame.size.height)
                
                //arrow blue other
                self.ArrowBlueOther.frame = CGRectMake(self.ArrowBlueOther.frame.origin.x,850, self.ArrowBlueOther.frame.size.width, self.ArrowBlueOther.frame.size.height)
                
                //line Other
                self.LabelOther5.frame = CGRectMake(self.LabelOther5.frame.origin.x,870, self.LabelOther5.frame.size.width, self.LabelOther5.frame.size.height)
                
                
                self.SaveButton.frame = CGRectMake(self.SaveButton.frame.origin.x,890, self.SaveButton.frame.size.width, self.SaveButton.frame.size.height)
                
                
                
            }//finalizacion iphone 5
                
                //iphone 6
            else if (self.Window.frame.size.height > 568 && self.Window.frame.size.height <= 667){
                self.ScrollView.contentSize = CGSizeMake(self.view.frame.size.width, 2220)
                
                
                self.AddressOffice.frame = CGRectMake(self.AddressOffice.frame.origin.x,690, self.AddressOffice.frame.size.width, self.AddressOffice.frame.size.height)
                
                self.LabelOffice2.frame = CGRectMake(self.LabelOffice2.frame.origin.x,740, self.LabelOffice2.frame.size.width, self.LabelOffice2.frame.size.height)
                
                self.LabelOffice3.frame = CGRectMake(self.LabelOffice3.frame.origin.x,740, self.LabelOffice3.frame.size.width, self.LabelOffice3.frame.size.height)
                
                self.CloseOffice.frame = CGRectMake(self.CloseOffice.frame.origin.x,720, self.CloseOffice.frame.size.width, self.CloseOffice.frame.size.height)
                
                self.UnitedOffice.frame = CGRectMake(self.UnitedOffice.frame.origin.x,730, self.UnitedOffice.frame.size.width, self.UnitedOffice.frame.size.height)
                
                self.ZipcodeOffice.frame = CGRectMake(self.ZipcodeOffice.frame.origin.x,730, self.ZipcodeOffice.frame.size.width, self.ZipcodeOffice.frame.size.height)
                
                self.LabelOffice6.frame = CGRectMake(self.LabelOffice6.frame.origin.x,785, self.LabelOffice6.frame.size.width, self.LabelOffice6.frame.size.height)
                
                self.SpecialOffice.frame = CGRectMake(self.SpecialOffice.frame.origin.x,770, self.SpecialOffice.frame.size.width, self.SpecialOffice.frame.size.height)
                
                self.LabelOffice5.frame = CGRectMake(self.LabelOffice5.frame.origin.x,825, self.LabelOffice5.frame.size.width, self.LabelOffice5.frame.size.height)
                
                self.EditButtonOffice.frame = CGRectMake(self.EditButtonOffice.frame.origin.x,850, self.EditButtonOffice.frame.size.width, self.EditButtonOffice.frame.size.height)
                
                self.LabelOffice4.frame = CGRectMake(self.LabelOffice4.frame.origin.x,900, self.LabelOffice4.frame.size.width, self.LabelOffice4.frame.size.height)
                
                
                //traer boton de address
                self.OfficeButton.frame = CGRectMake(self.OfficeButton.frame.origin.x,650, self.OfficeButton.frame.size.width, self.OfficeButton.frame.size.height)
                
                //arrow blue office
                self.ArrowBlueOffice.frame = CGRectMake(self.ArrowBlueOffice.frame.origin.x,680, self.ArrowBlueOffice.frame.size.width, self.ArrowBlueOffice.frame.size.height)
                
                //line office
                self.LabelOffice1.frame = CGRectMake(self.LabelOffice1.frame.origin.x,700, self.LabelOffice1.frame.size.width, self.LabelOffice1.frame.size.height)
                
                //Other Button
                self.OtherButton.frame = CGRectMake(self.OtherButton.frame.origin.x,890, self.OtherButton.frame.size.width, self.OtherButton.frame.size.height)
                
                //arrow blue other
                self.ArrowBlueOther.frame = CGRectMake(self.ArrowBlueOther.frame.origin.x,920, self.ArrowBlueOther.frame.size.width, self.ArrowBlueOther.frame.size.height)
                
                //line Other
                self.LabelOther5.frame = CGRectMake(self.LabelOther5.frame.origin.x,940, self.LabelOther5.frame.size.width, self.LabelOther5.frame.size.height)
                
                
                self.SaveButton.frame = CGRectMake(self.SaveButton.frame.origin.x,965, self.SaveButton.frame.size.width, self.SaveButton.frame.size.height)
                
            }//finalizacion del iphone 6
                
                //iphone 6 plus
            else if (self.Window.frame.size.height > 667 && self.Window.frame.size.height <= 736){
                self.ScrollView.contentSize = CGSizeMake(self.view.frame.size.width, 2450)
                
                self.AddressOffice.frame = CGRectMake(self.AddressOffice.frame.origin.x,790, self.AddressOffice.frame.size.width, self.AddressOffice.frame.size.height)
                
                self.LabelOffice2.frame = CGRectMake(self.LabelOffice2.frame.origin.x,840, self.LabelOffice2.frame.size.width, self.LabelOffice2.frame.size.height)
                
                self.LabelOffice3.frame = CGRectMake(self.LabelOffice3.frame.origin.x,840, self.LabelOffice3.frame.size.width, self.LabelOffice3.frame.size.height)
                
                self.CloseOffice.frame = CGRectMake(self.CloseOffice.frame.origin.x,810, self.CloseOffice.frame.size.width, self.CloseOffice.frame.size.height)
                
                self.UnitedOffice.frame = CGRectMake(self.UnitedOffice.frame.origin.x,830, self.UnitedOffice.frame.size.width, self.UnitedOffice.frame.size.height)
                
                self.ZipcodeOffice.frame = CGRectMake(self.ZipcodeOffice.frame.origin.x,830, self.ZipcodeOffice.frame.size.width, self.ZipcodeOffice.frame.size.height)
                
                self.LabelOffice6.frame = CGRectMake(self.LabelOffice6.frame.origin.x,885, self.LabelOffice6.frame.size.width, self.LabelOffice6.frame.size.height)
                
                self.SpecialOffice.frame = CGRectMake(self.SpecialOffice.frame.origin.x,870, self.SpecialOffice.frame.size.width, self.SpecialOffice.frame.size.height)
                
                self.LabelOffice5.frame = CGRectMake(self.LabelOffice5.frame.origin.x,925, self.LabelOffice5.frame.size.width, self.LabelOffice5.frame.size.height)
                
                self.EditButtonOffice.frame = CGRectMake(self.EditButtonOffice.frame.origin.x,950, self.EditButtonOffice.frame.size.width, self.EditButtonOffice.frame.size.height)
                
                self.LabelOffice4.frame = CGRectMake(self.LabelOffice4.frame.origin.x,1000, self.LabelOffice4.frame.size.width, self.LabelOffice4.frame.size.height)
                
                
                //traer boton de address
                self.OfficeButton.frame = CGRectMake(self.OfficeButton.frame.origin.x,750, self.OfficeButton.frame.size.width, self.OfficeButton.frame.size.height)
                
                //arrow blue office
                self.ArrowBlueOffice.frame = CGRectMake(self.ArrowBlueOffice.frame.origin.x,780, self.ArrowBlueOffice.frame.size.width, self.ArrowBlueOffice.frame.size.height)
                
                //line office
                self.LabelOffice1.frame = CGRectMake(self.LabelOffice1.frame.origin.x,800, self.LabelOffice1.frame.size.width, self.LabelOffice1.frame.size.height)
                
                //Other Button
                self.OtherButton.frame = CGRectMake(self.OtherButton.frame.origin.x,990, self.OtherButton.frame.size.width, self.OtherButton.frame.size.height)
                
                //arrow blue other
                self.ArrowBlueOther.frame = CGRectMake(self.ArrowBlueOther.frame.origin.x,1020, self.ArrowBlueOther.frame.size.width, self.ArrowBlueOther.frame.size.height)
                
                //line Other
                self.LabelOther5.frame = CGRectMake(self.LabelOther5.frame.origin.x,1040, self.LabelOther5.frame.size.width, self.LabelOther5.frame.size.height)
                
                
                self.SaveButton.frame = CGRectMake(self.SaveButton.frame.origin.x,1070, self.SaveButton.frame.size.width, self.SaveButton.frame.size.height)
                
                
                
                
            }//finalizacion Iphone 6plus
            

   
            
        
        
        
        }//fnalizacion del otherbutton flase
        
        else if(self.AddressOffice.hidden==false){
            
            self.ArrowBlueOffice.image = UIImage (named: "arrow_blue")
             self.ScrollView.contentSize = CGSizeMake(self.view.frame.size.width, 2350)
          self.CreditCardButton.enabled = true
            self.OfficeButton.hidden = false
            self.ArrowBlueOffice.hidden = false
            self.LabelOffice1.hidden = false
            self.AddressOffice.hidden = true
            self.CloseOffice.hidden = true
            self.LabelOffice2.hidden = true
            self.UnitedOffice.hidden = true
            self.ZipcodeOffice.hidden = true
            self.LabelOffice3.hidden = true
            self.LabelOffice4.hidden = true
            self.SpecialOffice.hidden = true
            self.LabelOffice6.hidden = true
            self.LabelOffice5.hidden = true
            self.EditButtonOffice.hidden = true
            self.SaveButton.hidden = true
         
            
            
            if (self.Window.frame.size.height > 480 && self.Window.frame.size.height <= 568 ){
                self.ScrollView.contentSize = CGSizeMake(self.view.frame.size.width, 1750)
                
                //iphone 5
                
                //traer boton de address up
                self.HomeButton.frame = CGRectMake(self.HomeButton.frame.origin.x, 560, self.HomeButton.frame.size.width,self.HomeButton.frame.size.height)
                
                //traer flecha gris address up
                self.ArrowBlue2.frame = CGRectMake(self.ArrowBlue2.frame.origin.x, 580, self.ArrowBlue2.frame.size.width, self.ArrowBlue2.frame.size.height)
                
                
                //line blue up
                self.LabelHome1.frame = CGRectMake(self.LabelHome1.frame.origin.x,590, self.LabelHome1.frame.size.width, self.LabelHome1.frame.size.height)
                
                //office button
                self.OfficeButton.frame = CGRectMake(self.OfficeButton.frame.origin.x,590, self.OfficeButton.frame.size.width, self.OfficeButton.frame.size.height)
                
                //arrow blue office
                self.ArrowBlueOffice.frame = CGRectMake(self.ArrowBlueOffice.frame.origin.x,625, self.ArrowBlueOffice.frame.size.width, self.ArrowBlueOffice.frame.size.height)
                
                //line office
                self.LabelOffice1.frame = CGRectMake(self.LabelOffice1.frame.origin.x,635, self.LabelOffice1.frame.size.width, self.LabelOffice1.frame.size.height)
                //Other Button
                self.OtherButton.frame = CGRectMake(self.OtherButton.frame.origin.x,635, self.OtherButton.frame.size.width, self.OtherButton.frame.size.height)
                //arrow blue other
                self.ArrowBlueOther.frame = CGRectMake(self.ArrowBlueOther.frame.origin.x,670, self.ArrowBlueOther.frame.size.width, self.ArrowBlueOther.frame.size.height)
                //line Other
                self.LabelOther5.frame = CGRectMake(self.LabelOther5.frame.origin.x,680, self.LabelOther5.frame.size.width, self.LabelOther5.frame.size.height)
                
                //iphone 4
            }else if (self.Window.frame.size.height <= 480 ){
                self.ScrollView.contentSize = CGSizeMake(self.view.frame.size.width, 1600)
                
                //traer boton de address
                self.HomeButton.frame = CGRectMake(self.HomeButton.frame.origin.x, 570, self.HomeButton.frame.size.width, self.HomeButton.frame.size.height)
                
                //traer flecha gris de address
                self.ArrowBlue2.frame = CGRectMake(self.ArrowBlue2.frame.origin.x, 590, self.ArrowBlue2.frame.size.width, self.ArrowBlue2.frame.size.height)
                
                self.LabelHome1.frame = CGRectMake(self.LabelHome1.frame.origin.x,600, self.LabelHome1.frame.size.width, self.LabelHome1.frame.size.height)
                
                //office button
                self.OfficeButton.frame = CGRectMake(self.OfficeButton.frame.origin.x,605, self.OfficeButton.frame.size.width, self.OfficeButton.frame.size.height)
                
                //arrow blue office
                self.ArrowBlueOffice.frame = CGRectMake(self.ArrowBlueOffice.frame.origin.x,640, self.ArrowBlueOffice.frame.size.width, self.ArrowBlueOffice.frame.size.height)
                
                //line office
                self.LabelOffice1.frame = CGRectMake(self.LabelOffice1.frame.origin.x,650, self.LabelOffice1.frame.size.width, self.LabelOffice1.frame.size.height)
                
                //Other Button
                self.OtherButton.frame = CGRectMake(self.OtherButton.frame.origin.x,655, self.OtherButton.frame.size.width, self.OtherButton.frame.size.height)
                
                //arrow blue other
                self.ArrowBlueOther.frame = CGRectMake(self.ArrowBlueOther.frame.origin.x,690, self.ArrowBlueOther.frame.size.width, self.ArrowBlueOther.frame.size.height)
                
                //line Other
                self.LabelOther5.frame = CGRectMake(self.LabelOther5.frame.origin.x,700, self.LabelOther5.frame.size.width, self.LabelOther5.frame.size.height)
                
                
                
            }//finalizacion iphone 4
                
                //iphone 6
                
            else if (self.Window.frame.size.height > 568 && self.Window.frame.size.height <= 667){
                self.ScrollView.contentSize = CGSizeMake(self.view.frame.size.width, 2000)
                
                //traer boton de address
                self.HomeButton.frame = CGRectMake(self.HomeButton.frame.origin.x, 620, self.HomeButton.frame.size.width, self.HomeButton.frame.size.height)
                
                //traer flecha gris de address
                self.ArrowBlue2.frame = CGRectMake(self.ArrowBlue2.frame.origin.x,640 , self.ArrowBlue2.frame.size.width, self.ArrowBlue2.frame.size.height)
                
                self.LabelHome1.frame = CGRectMake(self.LabelHome1.frame.origin.x,650, self.LabelHome1.frame.size.width, self.LabelHome1.frame.size.height)
                
                
                //office button
                self.OfficeButton.frame = CGRectMake(self.OfficeButton.frame.origin.x,660, self.OfficeButton.frame.size.width, self.OfficeButton.frame.size.height)
                
                //arrow blue office
                self.ArrowBlueOffice.frame = CGRectMake(self.ArrowBlueOffice.frame.origin.x,690, self.ArrowBlueOffice.frame.size.width, self.ArrowBlueOffice.frame.size.height)
                
                //line office
                self.LabelOffice1.frame = CGRectMake(self.LabelOffice1.frame.origin.x,705, self.LabelOffice1.frame.size.width, self.LabelOffice1.frame.size.height)
                
                //Other Button
                self.OtherButton.frame = CGRectMake(self.OtherButton.frame.origin.x,710, self.OtherButton.frame.size.width, self.OtherButton.frame.size.height)
                
                //arrow blue other
                self.ArrowBlueOther.frame = CGRectMake(self.ArrowBlueOther.frame.origin.x,745, self.ArrowBlueOther.frame.size.width, self.ArrowBlueOther.frame.size.height)
                
                //line Other
                self.LabelOther5.frame = CGRectMake(self.LabelOther5.frame.origin.x,755, self.LabelOther5.frame.size.width, self.LabelOther5.frame.size.height)
                
                //save button
                self.SaveButton.frame = CGRectMake(self.SaveButton.frame.origin.x,890, self.SaveButton.frame.size.width, self.SaveButton.frame.size.height)
                
                
                
            }//iphone 6 plus
                
            else if (self.Window.frame.size.height > 667 && self.Window.frame.size.height <= 736){
                self.ScrollView.contentSize = CGSizeMake(self.view.frame.size.width, 2250)
                
                //traer boton de address
                self.HomeButton.frame = CGRectMake(self.HomeButton.frame.origin.x, 710, self.HomeButton.frame.size.width, self.HomeButton.frame.size.height)
                
                //traer flecha gris de address
                self.ArrowBlue2.frame = CGRectMake(self.ArrowBlue2.frame.origin.x,720 , self.ArrowBlue2.frame.size.width, self.ArrowBlue2.frame.size.height)
                
                self.LabelHome1.frame = CGRectMake(self.LabelHome1.frame.origin.x,740, self.LabelHome1.frame.size.width, self.LabelHome1.frame.size.height)
                
                
                //office button
                self.OfficeButton.frame = CGRectMake(self.OfficeButton.frame.origin.x,755, self.OfficeButton.frame.size.width, self.OfficeButton.frame.size.height)
                
                //arrow blue office
                self.ArrowBlueOffice.frame = CGRectMake(self.ArrowBlueOffice.frame.origin.x,790, self.ArrowBlueOffice.frame.size.width, self.ArrowBlueOffice.frame.size.height)
                
                //line office
                self.LabelOffice1.frame = CGRectMake(self.LabelOffice1.frame.origin.x,800, self.LabelOffice1.frame.size.width, self.LabelOffice1.frame.size.height)
                
                //Other Button
                self.OtherButton.frame = CGRectMake(self.OtherButton.frame.origin.x,815, self.OtherButton.frame.size.width, self.OtherButton.frame.size.height)
                
                //arrow blue other
                self.ArrowBlueOther.frame = CGRectMake(self.ArrowBlueOther.frame.origin.x,850, self.ArrowBlueOther.frame.size.width, self.ArrowBlueOther.frame.size.height)
                
                //line Other
                self.LabelOther5.frame = CGRectMake(self.LabelOther5.frame.origin.x,860, self.LabelOther5.frame.size.width, self.LabelOther5.frame.size.height)
                
                //save button
                self.SaveButton.frame = CGRectMake(self.SaveButton.frame.origin.x,990, self.SaveButton.frame.size.width, self.SaveButton.frame.size.height)
                
            }

            
        
        
        }//finalizacion de officebutton false
        
        else{
            
            self.ArrowBlueOffice.image = UIImage (named: "arrow_blue_UP")
            
            self.ScrollView.contentSize = CGSizeMake(self.view.frame.size.width, 2350)
            self.SaveButton.backgroundColor = UIColor (red:0.686,green:0.686,blue:0.686,alpha:1)
            self.SaveButton.enabled = false
            self.CreditCardButton.enabled = false
            self.CloseOffice.enabled = false
            
            //mostrar elementos de office
            self.OfficeButton.hidden = false
            self.ArrowBlueOffice.hidden = false
            self.LabelOffice1.hidden = false
            self.AddressOffice.hidden = false
            self.CloseOffice.hidden = false
            self.LabelOffice2.hidden = false
            self.UnitedOffice.hidden = false
            self.ZipcodeOffice.hidden = false
            self.LabelOffice3.hidden = false
            self.LabelOffice4.hidden = false
            self.SpecialOffice.hidden = false
            self.LabelOffice6.hidden = false
            self.LabelOffice5.hidden = false
            self.EditButtonOffice.hidden = false
            self.SaveButton.hidden = false
            

            
            //POSICIONAMIENTO DE LOS ELEMENTOS
            
            //iphone 4
            if (self.Window.frame.size.height <= 480 ){
                self.ScrollView.contentSize = CGSizeMake(self.view.frame.size.width, 1840)
                
                self.AddressOffice.frame = CGRectMake(self.AddressOffice.frame.origin.x,650, self.AddressOffice.frame.size.width, self.AddressOffice.frame.size.height)
                
                self.LabelOffice2.frame = CGRectMake(self.LabelOffice2.frame.origin.x,700, self.LabelOffice2.frame.size.width, self.LabelOffice2.frame.size.height)
                
                self.LabelOffice3.frame = CGRectMake(self.LabelOffice3.frame.origin.x,695, self.LabelOffice3.frame.size.width, self.LabelOffice3.frame.size.height)
                
                self.CloseOffice.frame = CGRectMake(self.CloseOffice.frame.origin.x,670, self.CloseOffice.frame.size.width, self.CloseOffice.frame.size.height)
                
                self.UnitedOffice.frame = CGRectMake(self.UnitedOffice.frame.origin.x,690, self.UnitedOffice.frame.size.width, self.UnitedOffice.frame.size.height)
                
                self.ZipcodeOffice.frame = CGRectMake(self.ZipcodeOffice.frame.origin.x,690, self.ZipcodeOffice.frame.size.width, self.ZipcodeOffice.frame.size.height)
                
                self.LabelOffice6.frame = CGRectMake(self.LabelOffice6.frame.origin.x,750, self.LabelOffice6.frame.size.width, self.LabelOffice6.frame.size.height)
                
                self.SpecialOffice.frame = CGRectMake(self.SpecialOffice.frame.origin.x,740, self.SpecialOffice.frame.size.width, self.SpecialOffice.frame.size.height)
                
                self.LabelOffice5.frame = CGRectMake(self.LabelOffice5.frame.origin.x,860, self.LabelOffice5.frame.size.width, self.LabelOffice5.frame.size.height)
                
                self.EditButtonOffice.frame = CGRectMake(self.EditButtonOffice.frame.origin.x,810, self.EditButtonOffice.frame.size.width, self.EditButtonOffice.frame.size.height)
                
                self.LabelOffice4.frame = CGRectMake(self.LabelOffice4.frame.origin.x,790, self.LabelOffice4.frame.size.width, self.LabelOffice4.frame.size.height)
                
                
                //traer boton de address
                self.OfficeButton.frame = CGRectMake(self.OfficeButton.frame.origin.x,600, self.OfficeButton.frame.size.width, self.OfficeButton.frame.size.height)
                
                //arrow blue office
                self.ArrowBlueOffice.frame = CGRectMake(self.ArrowBlueOffice.frame.origin.x,635, self.ArrowBlueOffice.frame.size.width, self.ArrowBlueOffice.frame.size.height)
                
                //line office
                self.LabelOffice1.frame = CGRectMake(self.LabelOffice1.frame.origin.x,650, self.LabelOffice1.frame.size.width, self.LabelOffice1.frame.size.height)
                
                //Other Button
                self.OtherButton.frame = CGRectMake(self.OtherButton.frame.origin.x,850, self.OtherButton.frame.size.width, self.OtherButton.frame.size.height)
                
                //arrow blue other
                self.ArrowBlueOther.frame = CGRectMake(self.ArrowBlueOther.frame.origin.x,880, self.ArrowBlueOther.frame.size.width, self.ArrowBlueOther.frame.size.height)
                
                //line Other
                self.LabelOther5.frame = CGRectMake(self.LabelOther5.frame.origin.x,905, self.LabelOther5.frame.size.width, self.LabelOther5.frame.size.height)
                
                
                self.SaveButton.frame = CGRectMake(self.SaveButton.frame.origin.x,930, self.SaveButton.frame.size.width, self.SaveButton.frame.size.height)
                
                
                
            }//finalizacion del iphone 4
                
                //iphone 5
            else if (self.Window.frame.size.height > 480 && self.Window.frame.size.height <= 568 ){
                self.ScrollView.contentSize = CGSizeMake(self.view.frame.size.width, 1965)
                
                self.AddressOffice.frame = CGRectMake(self.AddressOffice.frame.origin.x,630, self.AddressOffice.frame.size.width, self.AddressOffice.frame.size.height)
                
                self.LabelOffice2.frame = CGRectMake(self.LabelOffice2.frame.origin.x,680, self.LabelOffice2.frame.size.width, self.LabelOffice2.frame.size.height)
                
                self.LabelOffice3.frame = CGRectMake(self.LabelOffice3.frame.origin.x,680, self.LabelOffice3.frame.size.width, self.LabelOffice3.frame.size.height)
                
                self.CloseOffice.frame = CGRectMake(self.CloseOffice.frame.origin.x,650, self.CloseOffice.frame.size.width, self.CloseOffice.frame.size.height)
                
                self.UnitedOffice.frame = CGRectMake(self.UnitedOffice.frame.origin.x,670, self.UnitedOffice.frame.size.width, self.UnitedOffice.frame.size.height)
                
                self.ZipcodeOffice.frame = CGRectMake(self.ZipcodeOffice.frame.origin.x,670, self.ZipcodeOffice.frame.size.width, self.ZipcodeOffice.frame.size.height)
                
                self.LabelOffice6.frame = CGRectMake(self.LabelOffice6.frame.origin.x,725, self.LabelOffice6.frame.size.width, self.LabelOffice6.frame.size.height)
                
                self.SpecialOffice.frame = CGRectMake(self.SpecialOffice.frame.origin.x,715, self.SpecialOffice.frame.size.width, self.SpecialOffice.frame.size.height)
                
                self.LabelOffice5.frame = CGRectMake(self.LabelOffice5.frame.origin.x,760, self.LabelOffice5.frame.size.width, self.LabelOffice5.frame.size.height)
                
                self.EditButtonOffice.frame = CGRectMake(self.EditButtonOffice.frame.origin.x,780, self.EditButtonOffice.frame.size.width, self.EditButtonOffice.frame.size.height)
                
                self.LabelOffice4.frame = CGRectMake(self.LabelOffice4.frame.origin.x,830, self.LabelOffice4.frame.size.width, self.LabelOffice4.frame.size.height)
                
                
                //traer boton de address
                self.OfficeButton.frame = CGRectMake(self.OfficeButton.frame.origin.x,590, self.OfficeButton.frame.size.width, self.OfficeButton.frame.size.height)
                
                //arrow blue office
                self.ArrowBlueOffice.frame = CGRectMake(self.ArrowBlueOffice.frame.origin.x,620, self.ArrowBlueOffice.frame.size.width, self.ArrowBlueOffice.frame.size.height)
                
                //line office
                self.LabelOffice1.frame = CGRectMake(self.LabelOffice1.frame.origin.x,640, self.LabelOffice1.frame.size.width, self.LabelOffice1.frame.size.height)
                
                //Other Button
                self.OtherButton.frame = CGRectMake(self.OtherButton.frame.origin.x,820, self.OtherButton.frame.size.width, self.OtherButton.frame.size.height)
                
                //arrow blue other
                self.ArrowBlueOther.frame = CGRectMake(self.ArrowBlueOther.frame.origin.x,850, self.ArrowBlueOther.frame.size.width, self.ArrowBlueOther.frame.size.height)
                
                //line Other
                self.LabelOther5.frame = CGRectMake(self.LabelOther5.frame.origin.x,870, self.LabelOther5.frame.size.width, self.LabelOther5.frame.size.height)
                
                
                self.SaveButton.frame = CGRectMake(self.SaveButton.frame.origin.x,890, self.SaveButton.frame.size.width, self.SaveButton.frame.size.height)
                
                
                
            }//finalizacion iphone 5
                
                //iphone 6
            else if (self.Window.frame.size.height > 568 && self.Window.frame.size.height <= 667){
                self.ScrollView.contentSize = CGSizeMake(self.view.frame.size.width, 2220)
                
                
                self.AddressOffice.frame = CGRectMake(self.AddressOffice.frame.origin.x,690, self.AddressOffice.frame.size.width, self.AddressOffice.frame.size.height)
                
                self.LabelOffice2.frame = CGRectMake(self.LabelOffice2.frame.origin.x,740, self.LabelOffice2.frame.size.width, self.LabelOffice2.frame.size.height)
                
                self.LabelOffice3.frame = CGRectMake(self.LabelOffice3.frame.origin.x,740, self.LabelOffice3.frame.size.width, self.LabelOffice3.frame.size.height)
                
                self.CloseOffice.frame = CGRectMake(self.CloseOffice.frame.origin.x,710, self.CloseOffice.frame.size.width, self.CloseOffice.frame.size.height)
                
                self.UnitedOffice.frame = CGRectMake(self.UnitedOffice.frame.origin.x,730, self.UnitedOffice.frame.size.width, self.UnitedOffice.frame.size.height)
                
                self.ZipcodeOffice.frame = CGRectMake(self.ZipcodeOffice.frame.origin.x,730, self.ZipcodeOffice.frame.size.width, self.ZipcodeOffice.frame.size.height)
                
                self.LabelOffice6.frame = CGRectMake(self.LabelOffice6.frame.origin.x,785, self.LabelOffice6.frame.size.width, self.LabelOffice6.frame.size.height)
                
                self.SpecialOffice.frame = CGRectMake(self.SpecialOffice.frame.origin.x,770, self.SpecialOffice.frame.size.width, self.SpecialOffice.frame.size.height)
                
                self.LabelOffice5.frame = CGRectMake(self.LabelOffice5.frame.origin.x,825, self.LabelOffice5.frame.size.width, self.LabelOffice5.frame.size.height)
                
                self.EditButtonOffice.frame = CGRectMake(self.EditButtonOffice.frame.origin.x,850, self.EditButtonOffice.frame.size.width, self.EditButtonOffice.frame.size.height)
                
                self.LabelOffice4.frame = CGRectMake(self.LabelOffice4.frame.origin.x,900, self.LabelOffice4.frame.size.width, self.LabelOffice4.frame.size.height)
                
                
                //traer boton de address
                self.OfficeButton.frame = CGRectMake(self.OfficeButton.frame.origin.x,650, self.OfficeButton.frame.size.width, self.OfficeButton.frame.size.height)
                
                //arrow blue office
                self.ArrowBlueOffice.frame = CGRectMake(self.ArrowBlueOffice.frame.origin.x,680, self.ArrowBlueOffice.frame.size.width, self.ArrowBlueOffice.frame.size.height)
                
                //line office
                self.LabelOffice1.frame = CGRectMake(self.LabelOffice1.frame.origin.x,700, self.LabelOffice1.frame.size.width, self.LabelOffice1.frame.size.height)
                
                //Other Button
                self.OtherButton.frame = CGRectMake(self.OtherButton.frame.origin.x,890, self.OtherButton.frame.size.width, self.OtherButton.frame.size.height)
                
                //arrow blue other
                self.ArrowBlueOther.frame = CGRectMake(self.ArrowBlueOther.frame.origin.x,920, self.ArrowBlueOther.frame.size.width, self.ArrowBlueOther.frame.size.height)
                
                //line Other
                self.LabelOther5.frame = CGRectMake(self.LabelOther5.frame.origin.x,940, self.LabelOther5.frame.size.width, self.LabelOther5.frame.size.height)
                
                
                self.SaveButton.frame = CGRectMake(self.SaveButton.frame.origin.x,965, self.SaveButton.frame.size.width, self.SaveButton.frame.size.height)
                
            }//finalizacion del iphone 6
                
                //iphone 6 plus
            else if (self.Window.frame.size.height > 667 && self.Window.frame.size.height <= 736){
                self.ScrollView.contentSize = CGSizeMake(self.view.frame.size.width, 2450)
                
                self.AddressOffice.frame = CGRectMake(self.AddressOffice.frame.origin.x,790, self.AddressOffice.frame.size.width, self.AddressOffice.frame.size.height)
                
                self.LabelOffice2.frame = CGRectMake(self.LabelOffice2.frame.origin.x,840, self.LabelOffice2.frame.size.width, self.LabelOffice2.frame.size.height)
                
                self.LabelOffice3.frame = CGRectMake(self.LabelOffice3.frame.origin.x,840, self.LabelOffice3.frame.size.width, self.LabelOffice3.frame.size.height)
                
                self.CloseOffice.frame = CGRectMake(self.CloseOffice.frame.origin.x,810, self.CloseOffice.frame.size.width, self.CloseOffice.frame.size.height)
                
                self.UnitedOffice.frame = CGRectMake(self.UnitedOffice.frame.origin.x,830, self.UnitedOffice.frame.size.width, self.UnitedOffice.frame.size.height)
                
                self.ZipcodeOffice.frame = CGRectMake(self.ZipcodeOffice.frame.origin.x,830, self.ZipcodeOffice.frame.size.width, self.ZipcodeOffice.frame.size.height)
                
                self.LabelOffice6.frame = CGRectMake(self.LabelOffice6.frame.origin.x,885, self.LabelOffice6.frame.size.width, self.LabelOffice6.frame.size.height)
                
                self.SpecialOffice.frame = CGRectMake(self.SpecialOffice.frame.origin.x,870, self.SpecialOffice.frame.size.width, self.SpecialOffice.frame.size.height)
                
                self.LabelOffice5.frame = CGRectMake(self.LabelOffice5.frame.origin.x,925, self.LabelOffice5.frame.size.width, self.LabelOffice5.frame.size.height)
                
                self.EditButtonOffice.frame = CGRectMake(self.EditButtonOffice.frame.origin.x,950, self.EditButtonOffice.frame.size.width, self.EditButtonOffice.frame.size.height)
                
                self.LabelOffice4.frame = CGRectMake(self.LabelOffice4.frame.origin.x,1000, self.LabelOffice4.frame.size.width, self.LabelOffice4.frame.size.height)
                
                
                //traer boton de address
                self.OfficeButton.frame = CGRectMake(self.OfficeButton.frame.origin.x,750, self.OfficeButton.frame.size.width, self.OfficeButton.frame.size.height)
                
                //arrow blue office
                self.ArrowBlueOffice.frame = CGRectMake(self.ArrowBlueOffice.frame.origin.x,780, self.ArrowBlueOffice.frame.size.width, self.ArrowBlueOffice.frame.size.height)
                
                //line office
                self.LabelOffice1.frame = CGRectMake(self.LabelOffice1.frame.origin.x,800, self.LabelOffice1.frame.size.width, self.LabelOffice1.frame.size.height)
                
                //Other Button
                self.OtherButton.frame = CGRectMake(self.OtherButton.frame.origin.x,990, self.OtherButton.frame.size.width, self.OtherButton.frame.size.height)
                
                //arrow blue other
                self.ArrowBlueOther.frame = CGRectMake(self.ArrowBlueOther.frame.origin.x,1020, self.ArrowBlueOther.frame.size.width, self.ArrowBlueOther.frame.size.height)
                
                //line Other
                self.LabelOther5.frame = CGRectMake(self.LabelOther5.frame.origin.x,1040, self.LabelOther5.frame.size.width, self.LabelOther5.frame.size.height)
                
                
                self.SaveButton.frame = CGRectMake(self.SaveButton.frame.origin.x,1070, self.SaveButton.frame.size.width, self.SaveButton.frame.size.height)
                
                
                
                
            }//finalizacion Iphone 6plus
        
        
        }//finalizacion del else de condiciones de office
        
    }//finalizacion del boton office
    
    // OTHER BUTTON ACTION
    
    @IBAction func OthButton(sender: UIButton) {
    
    
        
        if (self.AddressHome.hidden==false){
            
               self.ScrollView.contentSize = CGSizeMake(self.view.frame.size.width, 3000)
            self.ArrowBlueOther.image = UIImage (named: "arrow_blue_UP")
            self.ArrowBlue2.image = UIImage (named: "arrow_blue")
            self.SaveButton.backgroundColor = UIColor (red:0.686,green:0.686,blue:0.686,alpha:1)
            self.SaveButton.enabled = false
            self.CreditCardButton.enabled = false
            
            //mostrar elementos de Other
            self.OtherButton.hidden = false
            self.ArrowBlueOther.hidden = false
            self.AddressButtonOther.hidden = false
            self.CloseOther.hidden = false
            self.UnitedOther.hidden = false
            self.ZipcodeOther.hidden = false
            self.LabelOther2.hidden = false
            self.LabelOther3.hidden = false
            self.SpecialOther.hidden = false
            self.LabelOther4.hidden = false
            self.SaveButton.hidden = false
            self.LabelOther5.hidden = false
            self.LabelOther6.hidden = false
            self.LabelOther1.hidden = false
            self.EditButtonOther.hidden = false
            self.SaveButton.hidden = false
            
            //ocultar elementos de home
            self.HomeButton.hidden = false
            self.ArrowBlue2.hidden = false
            self.AddressHome.hidden = true
            self.CloseButton.hidden = true
            self.ZipcodeHome.hidden = true
            self.SpecialHome.hidden = true
            self.UnitedHome.hidden = true
            self.LabelHome1.hidden = false
            self.LabelHome2.hidden = true
            self.LabelHome3.hidden = true
            self.LabelHome4.hidden = true
            self.LabelHome5.hidden = true
            self.LabelHome6.hidden = true
            self.EditButtonHome.hidden = true
            
            //POSICIONAMIENTO DE LOS ELEMENTOS
            
            //iphone 4
            if (self.Window.frame.size.height <= 480 ){
                self.ScrollView.contentSize = CGSizeMake(self.view.frame.size.width, 1845)
                
                self.AddressButtonOther.frame = CGRectMake(self.AddressButtonOther.frame.origin.x,690, self.AddressOffice.frame.size.width, self.AddressButtonOther.frame.size.height)
                
                self.LabelOther1.frame = CGRectMake(self.LabelOther1.frame.origin.x,745, self.LabelOther1.frame.size.width, self.LabelOther1.frame.size.height)
                
                self.LabelOther2.frame = CGRectMake(self.LabelOther2.frame.origin.x,745, self.LabelOther2.frame.size.width, self.LabelOther2.frame.size.height)
                
                self.CloseOther.frame = CGRectMake(self.CloseOther.frame.origin.x,720, self.CloseOther.frame.size.width, self.CloseOther.frame.size.height)
                
                self.UnitedOther.frame = CGRectMake(self.UnitedOther.frame.origin.x,740, self.UnitedOther.frame.size.width, self.UnitedOther.frame.size.height)
                
                self.ZipcodeOther.frame = CGRectMake(self.ZipcodeOther.frame.origin.x,740, self.ZipcodeOther.frame.size.width, self.ZipcodeOther.frame.size.height)
                
                self.LabelOther3.frame = CGRectMake(self.LabelOther3.frame.origin.x,790, self.LabelOther3.frame.size.width, self.LabelOther3.frame.size.height)
                
                self.SpecialOther.frame = CGRectMake(self.SpecialOther.frame.origin.x,780, self.SpecialOther.frame.size.width, self.SpecialOther.frame.size.height)
                
                self.LabelOther4.frame = CGRectMake(self.LabelOther4.frame.origin.x,830, self.LabelOther4.frame.size.width, self.LabelOther4.frame.size.height)
                
                self.EditButtonOther.frame = CGRectMake(self.EditButtonOther.frame.origin.x,850, self.EditButtonOther.frame.size.width, self.EditButtonOther.frame.size.height)
                
                self.LabelOther6.frame = CGRectMake(self.LabelOther6.frame.origin.x,900, self.LabelOther6.frame.size.width, self.LabelOther6.frame.size.height)
                
                
                //traer boton de address
                self.OfficeButton.frame = CGRectMake(self.OfficeButton.frame.origin.x,600, self.OfficeButton.frame.size.width, self.OfficeButton.frame.size.height)
                
                //arrow blue office
                self.ArrowBlueOffice.frame = CGRectMake(self.ArrowBlueOffice.frame.origin.x,635, self.ArrowBlueOffice.frame.size.width, self.ArrowBlueOffice.frame.size.height)
                
                //line office
                self.LabelOffice1.frame = CGRectMake(self.LabelOffice1.frame.origin.x,650, self.LabelOffice1.frame.size.width, self.LabelOffice1.frame.size.height)
                
                //Other Button
                self.OtherButton.frame = CGRectMake(self.OtherButton.frame.origin.x,650, self.OtherButton.frame.size.width, self.OtherButton.frame.size.height)
                
                //arrow blue other
                self.ArrowBlueOther.frame = CGRectMake(self.ArrowBlueOther.frame.origin.x,680, self.ArrowBlueOther.frame.size.width, self.ArrowBlueOther.frame.size.height)
                
                //line Other
                self.LabelOther5.frame = CGRectMake(self.LabelOther5.frame.origin.x,700, self.LabelOther5.frame.size.width, self.LabelOther5.frame.size.height)
                
                
                self.SaveButton.frame = CGRectMake(self.SaveButton.frame.origin.x,930, self.SaveButton.frame.size.width, self.SaveButton.frame.size.height)
                
                
                
            }//finalizacion del iphone 4
                
                //iphone 5
            else if (self.Window.frame.size.height > 480 && self.Window.frame.size.height <= 568 ){
                self.ScrollView.contentSize = CGSizeMake(self.view.frame.size.width, 1965)
                
                self.AddressButtonOther.frame = CGRectMake(self.AddressButtonOther.frame.origin.x,670, self.AddressButtonOther.frame.size.width, self.AddressButtonOther.frame.size.height)
                
                self.LabelOther1.frame = CGRectMake(self.LabelOther1.frame.origin.x,720, self.LabelOther1.frame.size.width, self.LabelOther1.frame.size.height)
                
                self.LabelOther2.frame = CGRectMake(self.LabelOther2.frame.origin.x,720, self.LabelOther2.frame.size.width, self.LabelOther2.frame.size.height)
                
                self.CloseOther.frame = CGRectMake(self.CloseOther.frame.origin.x,695, self.CloseOther.frame.size.width, self.CloseOther.frame.size.height)
                
                self.UnitedOther.frame = CGRectMake(self.UnitedOther.frame.origin.x,710, self.UnitedOther.frame.size.width, self.UnitedOther.frame.size.height)
                
                self.ZipcodeOther.frame = CGRectMake(self.ZipcodeOther.frame.origin.x,710, self.ZipcodeOther.frame.size.width, self.ZipcodeOther.frame.size.height)
                
                self.LabelOther3.frame = CGRectMake(self.LabelOther3.frame.origin.x,765, self.LabelOther3.frame.size.width, self.LabelOther3.frame.size.height)
                
                self.SpecialOther.frame = CGRectMake(self.SpecialOther.frame.origin.x,750, self.SpecialOther.frame.size.width, self.SpecialOther.frame.size.height)
                
                self.LabelOther4.frame = CGRectMake(self.LabelOther4.frame.origin.x,800, self.LabelOther4.frame.size.width, self.LabelOther4.frame.size.height)
                
                self.EditButtonOther.frame = CGRectMake(self.EditButtonOther.frame.origin.x,820, self.EditButtonOther.frame.size.width, self.EditButtonOther.frame.size.height)
                
                self.LabelOther6.frame = CGRectMake(self.LabelOther6.frame.origin.x,870, self.LabelOther6.frame.size.width, self.LabelOther6.frame.size.height)
                
                
                //traer boton de address
                self.OfficeButton.frame = CGRectMake(self.OfficeButton.frame.origin.x,590, self.OfficeButton.frame.size.width, self.OfficeButton.frame.size.height)
                
                //arrow blue office
                self.ArrowBlueOffice.frame = CGRectMake(self.ArrowBlueOffice.frame.origin.x,620, self.ArrowBlueOffice.frame.size.width, self.ArrowBlueOffice.frame.size.height)
                
                //line office
                self.LabelOffice1.frame = CGRectMake(self.LabelOffice1.frame.origin.x,640, self.LabelOffice1.frame.size.width, self.LabelOffice1.frame.size.height)
                
                //Other Button
                self.OtherButton.frame = CGRectMake(self.OtherButton.frame.origin.x,630, self.OtherButton.frame.size.width, self.OtherButton.frame.size.height)
                
                //arrow blue other
                self.ArrowBlueOther.frame = CGRectMake(self.ArrowBlueOther.frame.origin.x,660, self.ArrowBlueOther.frame.size.width, self.ArrowBlueOther.frame.size.height)
                
                //line Other
                self.LabelOther5.frame = CGRectMake(self.LabelOther5.frame.origin.x,680, self.LabelOther5.frame.size.width, self.LabelOther5.frame.size.height)
                
                
                self.SaveButton.frame = CGRectMake(self.SaveButton.frame.origin.x,890, self.SaveButton.frame.size.width, self.SaveButton.frame.size.height)
                
                
                
            }//finalizacion iphone 5
                
                //iphone 6
            else if (self.Window.frame.size.height > 568 && self.Window.frame.size.height <= 667){
                self.ScrollView.contentSize = CGSizeMake(self.view.frame.size.width, 2205)
                
                
                self.AddressButtonOther.frame = CGRectMake(self.AddressButtonOther.frame.origin.x,730, self.AddressButtonOther.frame.size.width, self.AddressButtonOther.frame.size.height)
                
                self.LabelOther1.frame = CGRectMake(self.LabelOther1.frame.origin.x,780, self.LabelOther1.frame.size.width, self.LabelOther1.frame.size.height)
                
                self.LabelOther2.frame = CGRectMake(self.LabelOther2.frame.origin.x,780, self.LabelOther2.frame.size.width, self.LabelOther2.frame.size.height)
                
                self.CloseOther.frame = CGRectMake(self.CloseOther.frame.origin.x,755, self.CloseOther.frame.size.width, self.CloseOffice.frame.size.height)
                
                self.UnitedOther.frame = CGRectMake(self.UnitedOther.frame.origin.x,770, self.UnitedOther.frame.size.width, self.UnitedOther.frame.size.height)
                
                self.ZipcodeOther.frame = CGRectMake(self.ZipcodeOther.frame.origin.x,770, self.ZipcodeOther.frame.size.width, self.ZipcodeOther.frame.size.height)
                
                self.LabelOther3.frame = CGRectMake(self.LabelOther3.frame.origin.x,825, self.LabelOther3.frame.size.width, self.LabelOther3.frame.size.height)
                
                self.SpecialOther.frame = CGRectMake(self.SpecialOther.frame.origin.x,810, self.SpecialOther.frame.size.width, self.SpecialOffice.frame.size.height)
                
                self.LabelOther4.frame = CGRectMake(self.LabelOther4.frame.origin.x,860, self.LabelOther4.frame.size.width, self.LabelOther4.frame.size.height)
                
                self.EditButtonOther.frame = CGRectMake(self.EditButtonOther.frame.origin.x,880, self.EditButtonOther.frame.size.width, self.EditButtonOther.frame.size.height)
                
                self.LabelOther6.frame = CGRectMake(self.LabelOther6.frame.origin.x,930, self.LabelOther6.frame.size.width, self.LabelOther6.frame.size.height)
                
                
                //traer boton de address
                self.OfficeButton.frame = CGRectMake(self.OfficeButton.frame.origin.x,650, self.OfficeButton.frame.size.width, self.OfficeButton.frame.size.height)
                
                //arrow blue office
                self.ArrowBlueOffice.frame = CGRectMake(self.ArrowBlueOffice.frame.origin.x,680, self.ArrowBlueOffice.frame.size.width, self.ArrowBlueOffice.frame.size.height)
                
                //line office
                self.LabelOffice1.frame = CGRectMake(self.LabelOffice1.frame.origin.x,700, self.LabelOffice1.frame.size.width, self.LabelOffice1.frame.size.height)
                
                //Other Button
                self.OtherButton.frame = CGRectMake(self.OtherButton.frame.origin.x,690, self.OtherButton.frame.size.width, self.OtherButton.frame.size.height)
                
                //arrow blue other
                self.ArrowBlueOther.frame = CGRectMake(self.ArrowBlueOther.frame.origin.x,720, self.ArrowBlueOther.frame.size.width, self.ArrowBlueOther.frame.size.height)
                
                //line Other
                self.LabelOther5.frame = CGRectMake(self.LabelOther5.frame.origin.x,740, self.LabelOther5.frame.size.width, self.LabelOther5.frame.size.height)
                
                
                self.SaveButton.frame = CGRectMake(self.SaveButton.frame.origin.x,950, self.SaveButton.frame.size.width, self.SaveButton.frame.size.height)
                
            }//finalizacion del iphone 6
                
                //iphone 6 plus
            else if (self.Window.frame.size.height > 667 && self.Window.frame.size.height <= 736){
                self.ScrollView.contentSize = CGSizeMake(self.view.frame.size.width, 2450)
                
                self.AddressButtonOther.frame = CGRectMake(self.AddressButtonOther.frame.origin.x,840, self.AddressButtonOther.frame.size.width, self.AddressButtonOther.frame.size.height)
                
                self.LabelOther1.frame = CGRectMake(self.LabelOther1.frame.origin.x,890, self.LabelOther1.frame.size.width, self.LabelOther1.frame.size.height)
                
                self.LabelOther2.frame = CGRectMake(self.LabelOther2.frame.origin.x,890, self.LabelOther2.frame.size.width, self.LabelOther2.frame.size.height)
                
                self.CloseOther.frame = CGRectMake(self.CloseOther.frame.origin.x,860, self.CloseOther.frame.size.width, self.CloseOffice.frame.size.height)
                
                self.UnitedOther.frame = CGRectMake(self.UnitedOther.frame.origin.x,880, self.UnitedOther.frame.size.width, self.UnitedOther.frame.size.height)
                
                self.ZipcodeOther.frame = CGRectMake(self.ZipcodeOther.frame.origin.x,880, self.ZipcodeOther.frame.size.width, self.ZipcodeOther.frame.size.height)
                
                
                self.LabelOther3.frame = CGRectMake(self.LabelOther3.frame.origin.x,935, self.LabelOther3.frame.size.width, self.LabelOther3.frame.size.height)
                
                self.SpecialOther.frame = CGRectMake(self.SpecialOther.frame.origin.x,920, self.SpecialOther.frame.size.width, self.SpecialOffice.frame.size.height)
                
                self.LabelOther4.frame = CGRectMake(self.LabelOther4.frame.origin.x,970, self.LabelOther4.frame.size.width, self.LabelOther4.frame.size.height)
                
                self.EditButtonOther.frame = CGRectMake(self.EditButtonOther.frame.origin.x,990, self.EditButtonOther.frame.size.width, self.EditButtonOther.frame.size.height)
                
                self.LabelOther6.frame = CGRectMake(self.LabelOther6.frame.origin.x,1040, self.LabelOther6.frame.size.width, self.LabelOther6.frame.size.height)
                
                
                //traer boton de address
                self.OfficeButton.frame = CGRectMake(self.OfficeButton.frame.origin.x,750, self.OfficeButton.frame.size.width, self.OfficeButton.frame.size.height)
                
                //arrow blue office
                self.ArrowBlueOffice.frame = CGRectMake(self.ArrowBlueOffice.frame.origin.x,780, self.ArrowBlueOffice.frame.size.width, self.ArrowBlueOffice.frame.size.height)
                
                //line office
                self.LabelOffice1.frame = CGRectMake(self.LabelOffice1.frame.origin.x,800, self.LabelOffice1.frame.size.width, self.LabelOffice1.frame.size.height)
                
                //Other Button
                self.OtherButton.frame = CGRectMake(self.OtherButton.frame.origin.x,800, self.OtherButton.frame.size.width, self.OtherButton.frame.size.height)
                
                //arrow blue other
                self.ArrowBlueOther.frame = CGRectMake(self.ArrowBlueOther.frame.origin.x,830, self.ArrowBlueOther.frame.size.width, self.ArrowBlueOther.frame.size.height)
                
                //line Other
                self.LabelOther5.frame = CGRectMake(self.LabelOther5.frame.origin.x,850, self.LabelOther5.frame.size.width, self.LabelOther5.frame.size.height)
                
                
                self.SaveButton.frame = CGRectMake(self.SaveButton.frame.origin.x,1070, self.SaveButton.frame.size.width, self.SaveButton.frame.size.height)
                
                
                
                
            }//finalizacion Iphone 6plus
            
            

            
            
            
            
        
        
        }//finalizacion del homebutton false
        
        else if (self.AddressOffice.hidden==false){
            self.ScrollView.contentSize = CGSizeMake(self.view.frame.size.width, 3000)
            
            self.ArrowBlueOther.image = UIImage (named: "arrow_blue_UP")
            self.ArrowBlueOffice.image = UIImage (named: "arrow_blue")
            self.SaveButton.backgroundColor = UIColor (red:0.686,green:0.686,blue:0.686,alpha:1)
            self.SaveButton.enabled = false
            self.CreditCardButton.enabled = false
            
            //mostrar elementos de Other
            self.OtherButton.hidden = false
            self.ArrowBlueOther.hidden = false
            self.AddressButtonOther.hidden = false
            self.CloseOther.hidden = false
            self.UnitedOther.hidden = false
            self.ZipcodeOther.hidden = false
            self.LabelOther2.hidden = false
            self.LabelOther3.hidden = false
            self.SpecialOther.hidden = false
            self.LabelOther4.hidden = false
            self.SaveButton.hidden = false
            self.LabelOther5.hidden = false
            self.LabelOther6.hidden = false
            self.LabelOther1.hidden = false
            self.EditButtonOther.hidden = false
            self.SaveButton.hidden = false
            
            
            //ocultar elementos de office
            self.OfficeButton.hidden = false
            self.ArrowBlueOffice.hidden = false
            self.LabelOffice1.hidden = false
            self.AddressOffice.hidden = true
            self.CloseOffice.hidden = true
            self.LabelOffice2.hidden = true
            self.UnitedOffice.hidden = true
            self.ZipcodeOffice.hidden = true
            self.LabelOffice3.hidden = true
            self.LabelOffice4.hidden = true
            self.SpecialOffice.hidden = true
            self.LabelOffice6.hidden = true
            self.LabelOffice5.hidden = true
            self.EditButtonOffice.hidden = true
            //POSICIONAMIENTO DE LOS ELEMENTOS
            
            //iphone 4
            if (self.Window.frame.size.height <= 480 ){
                self.ScrollView.contentSize = CGSizeMake(self.view.frame.size.width, 1845)
                
                self.AddressButtonOther.frame = CGRectMake(self.AddressButtonOther.frame.origin.x,690, self.AddressOffice.frame.size.width, self.AddressButtonOther.frame.size.height)
                
                self.LabelOther1.frame = CGRectMake(self.LabelOther1.frame.origin.x,745, self.LabelOther1.frame.size.width, self.LabelOther1.frame.size.height)
                
                self.LabelOther2.frame = CGRectMake(self.LabelOther2.frame.origin.x,745, self.LabelOther2.frame.size.width, self.LabelOther2.frame.size.height)
                
                self.CloseOther.frame = CGRectMake(self.CloseOther.frame.origin.x,720, self.CloseOther.frame.size.width, self.CloseOther.frame.size.height)
                
                self.UnitedOther.frame = CGRectMake(self.UnitedOther.frame.origin.x,740, self.UnitedOther.frame.size.width, self.UnitedOther.frame.size.height)
                
                self.ZipcodeOther.frame = CGRectMake(self.ZipcodeOther.frame.origin.x,740, self.ZipcodeOther.frame.size.width, self.ZipcodeOther.frame.size.height)
                
                self.LabelOther3.frame = CGRectMake(self.LabelOther3.frame.origin.x,790, self.LabelOther3.frame.size.width, self.LabelOther3.frame.size.height)
                
                self.SpecialOther.frame = CGRectMake(self.SpecialOther.frame.origin.x,780, self.SpecialOther.frame.size.width, self.SpecialOther.frame.size.height)
                
                self.LabelOther4.frame = CGRectMake(self.LabelOther4.frame.origin.x,830, self.LabelOther4.frame.size.width, self.LabelOther4.frame.size.height)
                
                self.EditButtonOther.frame = CGRectMake(self.EditButtonOther.frame.origin.x,850, self.EditButtonOther.frame.size.width, self.EditButtonOther.frame.size.height)
                
                self.LabelOther6.frame = CGRectMake(self.LabelOther6.frame.origin.x,900, self.LabelOther6.frame.size.width, self.LabelOther6.frame.size.height)
                
                
                //traer boton de address
                self.OfficeButton.frame = CGRectMake(self.OfficeButton.frame.origin.x,600, self.OfficeButton.frame.size.width, self.OfficeButton.frame.size.height)
                
                //arrow blue office
                self.ArrowBlueOffice.frame = CGRectMake(self.ArrowBlueOffice.frame.origin.x,635, self.ArrowBlueOffice.frame.size.width, self.ArrowBlueOffice.frame.size.height)
                
                //line office
                self.LabelOffice1.frame = CGRectMake(self.LabelOffice1.frame.origin.x,650, self.LabelOffice1.frame.size.width, self.LabelOffice1.frame.size.height)
                
                //Other Button
                self.OtherButton.frame = CGRectMake(self.OtherButton.frame.origin.x,650, self.OtherButton.frame.size.width, self.OtherButton.frame.size.height)
                
                //arrow blue other
                self.ArrowBlueOther.frame = CGRectMake(self.ArrowBlueOther.frame.origin.x,680, self.ArrowBlueOther.frame.size.width, self.ArrowBlueOther.frame.size.height)
                
                //line Other
                self.LabelOther5.frame = CGRectMake(self.LabelOther5.frame.origin.x,700, self.LabelOther5.frame.size.width, self.LabelOther5.frame.size.height)
                
                
                self.SaveButton.frame = CGRectMake(self.SaveButton.frame.origin.x,930, self.SaveButton.frame.size.width, self.SaveButton.frame.size.height)
                
                
                
            }//finalizacion del iphone 4
                
                //iphone 5
            else if (self.Window.frame.size.height > 480 && self.Window.frame.size.height <= 568 ){
                self.ScrollView.contentSize = CGSizeMake(self.view.frame.size.width, 1965)
                
                self.AddressButtonOther.frame = CGRectMake(self.AddressButtonOther.frame.origin.x,670, self.AddressButtonOther.frame.size.width, self.AddressButtonOther.frame.size.height)
                
                self.LabelOther1.frame = CGRectMake(self.LabelOther1.frame.origin.x,720, self.LabelOther1.frame.size.width, self.LabelOther1.frame.size.height)
                
                self.LabelOther2.frame = CGRectMake(self.LabelOther2.frame.origin.x,720, self.LabelOther2.frame.size.width, self.LabelOther2.frame.size.height)
                
                self.CloseOther.frame = CGRectMake(self.CloseOther.frame.origin.x,695, self.CloseOther.frame.size.width, self.CloseOther.frame.size.height)
                
                self.UnitedOther.frame = CGRectMake(self.UnitedOther.frame.origin.x,710, self.UnitedOther.frame.size.width, self.UnitedOther.frame.size.height)
                
                self.ZipcodeOther.frame = CGRectMake(self.ZipcodeOther.frame.origin.x,710, self.ZipcodeOther.frame.size.width, self.ZipcodeOther.frame.size.height)
                
                self.LabelOther3.frame = CGRectMake(self.LabelOther3.frame.origin.x,765, self.LabelOther3.frame.size.width, self.LabelOther3.frame.size.height)
                
                self.SpecialOther.frame = CGRectMake(self.SpecialOther.frame.origin.x,750, self.SpecialOther.frame.size.width, self.SpecialOther.frame.size.height)
                
                self.LabelOther4.frame = CGRectMake(self.LabelOther4.frame.origin.x,800, self.LabelOther4.frame.size.width, self.LabelOther4.frame.size.height)
                
                self.EditButtonOther.frame = CGRectMake(self.EditButtonOther.frame.origin.x,820, self.EditButtonOther.frame.size.width, self.EditButtonOther.frame.size.height)
                
                self.LabelOther6.frame = CGRectMake(self.LabelOther6.frame.origin.x,870, self.LabelOther6.frame.size.width, self.LabelOther6.frame.size.height)
                
                
                //traer boton de address
                self.OfficeButton.frame = CGRectMake(self.OfficeButton.frame.origin.x,590, self.OfficeButton.frame.size.width, self.OfficeButton.frame.size.height)
                
                //arrow blue office
                self.ArrowBlueOffice.frame = CGRectMake(self.ArrowBlueOffice.frame.origin.x,620, self.ArrowBlueOffice.frame.size.width, self.ArrowBlueOffice.frame.size.height)
                
                //line office
                self.LabelOffice1.frame = CGRectMake(self.LabelOffice1.frame.origin.x,640, self.LabelOffice1.frame.size.width, self.LabelOffice1.frame.size.height)
                
                //Other Button
                self.OtherButton.frame = CGRectMake(self.OtherButton.frame.origin.x,630, self.OtherButton.frame.size.width, self.OtherButton.frame.size.height)
                
                //arrow blue other
                self.ArrowBlueOther.frame = CGRectMake(self.ArrowBlueOther.frame.origin.x,660, self.ArrowBlueOther.frame.size.width, self.ArrowBlueOther.frame.size.height)
                
                //line Other
                self.LabelOther5.frame = CGRectMake(self.LabelOther5.frame.origin.x,680, self.LabelOther5.frame.size.width, self.LabelOther5.frame.size.height)
                
                
                self.SaveButton.frame = CGRectMake(self.SaveButton.frame.origin.x,890, self.SaveButton.frame.size.width, self.SaveButton.frame.size.height)
                
                
                
            }//finalizacion iphone 5
                
                //iphone 6
            else if (self.Window.frame.size.height > 568 && self.Window.frame.size.height <= 667){
                self.ScrollView.contentSize = CGSizeMake(self.view.frame.size.width, 2205)
                
                
                self.AddressButtonOther.frame = CGRectMake(self.AddressButtonOther.frame.origin.x,730, self.AddressButtonOther.frame.size.width, self.AddressButtonOther.frame.size.height)
                
                self.LabelOther1.frame = CGRectMake(self.LabelOther1.frame.origin.x,780, self.LabelOther1.frame.size.width, self.LabelOther1.frame.size.height)
                
                self.LabelOther2.frame = CGRectMake(self.LabelOther2.frame.origin.x,780, self.LabelOther2.frame.size.width, self.LabelOther2.frame.size.height)
                
                self.CloseOther.frame = CGRectMake(self.CloseOther.frame.origin.x,755, self.CloseOther.frame.size.width, self.CloseOffice.frame.size.height)
                
                self.UnitedOther.frame = CGRectMake(self.UnitedOther.frame.origin.x,770, self.UnitedOther.frame.size.width, self.UnitedOther.frame.size.height)
                
                self.ZipcodeOther.frame = CGRectMake(self.ZipcodeOther.frame.origin.x,770, self.ZipcodeOther.frame.size.width, self.ZipcodeOther.frame.size.height)
                
                self.LabelOther3.frame = CGRectMake(self.LabelOther3.frame.origin.x,825, self.LabelOther3.frame.size.width, self.LabelOther3.frame.size.height)
                
                self.SpecialOther.frame = CGRectMake(self.SpecialOther.frame.origin.x,810, self.SpecialOther.frame.size.width, self.SpecialOffice.frame.size.height)
                
                self.LabelOther4.frame = CGRectMake(self.LabelOther4.frame.origin.x,860, self.LabelOther4.frame.size.width, self.LabelOther4.frame.size.height)
                
                self.EditButtonOther.frame = CGRectMake(self.EditButtonOther.frame.origin.x,880, self.EditButtonOther.frame.size.width, self.EditButtonOther.frame.size.height)
                
                self.LabelOther6.frame = CGRectMake(self.LabelOther6.frame.origin.x,930, self.LabelOther6.frame.size.width, self.LabelOther6.frame.size.height)
                
                
                //traer boton de address
                self.OfficeButton.frame = CGRectMake(self.OfficeButton.frame.origin.x,650, self.OfficeButton.frame.size.width, self.OfficeButton.frame.size.height)
                
                //arrow blue office
                self.ArrowBlueOffice.frame = CGRectMake(self.ArrowBlueOffice.frame.origin.x,680, self.ArrowBlueOffice.frame.size.width, self.ArrowBlueOffice.frame.size.height)
                
                //line office
                self.LabelOffice1.frame = CGRectMake(self.LabelOffice1.frame.origin.x,700, self.LabelOffice1.frame.size.width, self.LabelOffice1.frame.size.height)
                
                //Other Button
                self.OtherButton.frame = CGRectMake(self.OtherButton.frame.origin.x,690, self.OtherButton.frame.size.width, self.OtherButton.frame.size.height)
                
                //arrow blue other
                self.ArrowBlueOther.frame = CGRectMake(self.ArrowBlueOther.frame.origin.x,720, self.ArrowBlueOther.frame.size.width, self.ArrowBlueOther.frame.size.height)
                
                //line Other
                self.LabelOther5.frame = CGRectMake(self.LabelOther5.frame.origin.x,740, self.LabelOther5.frame.size.width, self.LabelOther5.frame.size.height)
                
                
                self.SaveButton.frame = CGRectMake(self.SaveButton.frame.origin.x,950, self.SaveButton.frame.size.width, self.SaveButton.frame.size.height)
                
            }//finalizacion del iphone 6
                
                //iphone 6 plus
            else if (self.Window.frame.size.height > 667 && self.Window.frame.size.height <= 736){
                self.ScrollView.contentSize = CGSizeMake(self.view.frame.size.width, 2450)
                
                self.AddressButtonOther.frame = CGRectMake(self.AddressButtonOther.frame.origin.x,840, self.AddressButtonOther.frame.size.width, self.AddressButtonOther.frame.size.height)
                
                self.LabelOther1.frame = CGRectMake(self.LabelOther1.frame.origin.x,890, self.LabelOther1.frame.size.width, self.LabelOther1.frame.size.height)
                
                self.LabelOther2.frame = CGRectMake(self.LabelOther2.frame.origin.x,890, self.LabelOther2.frame.size.width, self.LabelOther2.frame.size.height)
                
                self.CloseOther.frame = CGRectMake(self.CloseOther.frame.origin.x,860, self.CloseOther.frame.size.width, self.CloseOffice.frame.size.height)
                
                self.UnitedOther.frame = CGRectMake(self.UnitedOther.frame.origin.x,880, self.UnitedOther.frame.size.width, self.UnitedOther.frame.size.height)
                
                self.ZipcodeOther.frame = CGRectMake(self.ZipcodeOther.frame.origin.x,880, self.ZipcodeOther.frame.size.width, self.ZipcodeOther.frame.size.height)
                
                
                self.LabelOther3.frame = CGRectMake(self.LabelOther3.frame.origin.x,935, self.LabelOther3.frame.size.width, self.LabelOther3.frame.size.height)
                
                self.SpecialOther.frame = CGRectMake(self.SpecialOther.frame.origin.x,920, self.SpecialOther.frame.size.width, self.SpecialOffice.frame.size.height)
                
                self.LabelOther4.frame = CGRectMake(self.LabelOther4.frame.origin.x,970, self.LabelOther4.frame.size.width, self.LabelOther4.frame.size.height)
                
                self.EditButtonOther.frame = CGRectMake(self.EditButtonOther.frame.origin.x,990, self.EditButtonOther.frame.size.width, self.EditButtonOther.frame.size.height)
                
                self.LabelOther6.frame = CGRectMake(self.LabelOther6.frame.origin.x,1040, self.LabelOther6.frame.size.width, self.LabelOther6.frame.size.height)
                
                
                //traer boton de address
                self.OfficeButton.frame = CGRectMake(self.OfficeButton.frame.origin.x,750, self.OfficeButton.frame.size.width, self.OfficeButton.frame.size.height)
                
                //arrow blue office
                self.ArrowBlueOffice.frame = CGRectMake(self.ArrowBlueOffice.frame.origin.x,780, self.ArrowBlueOffice.frame.size.width, self.ArrowBlueOffice.frame.size.height)
                
                //line office
                self.LabelOffice1.frame = CGRectMake(self.LabelOffice1.frame.origin.x,800, self.LabelOffice1.frame.size.width, self.LabelOffice1.frame.size.height)
                
                //Other Button
                self.OtherButton.frame = CGRectMake(self.OtherButton.frame.origin.x,800, self.OtherButton.frame.size.width, self.OtherButton.frame.size.height)
                
                //arrow blue other
                self.ArrowBlueOther.frame = CGRectMake(self.ArrowBlueOther.frame.origin.x,830, self.ArrowBlueOther.frame.size.width, self.ArrowBlueOther.frame.size.height)
                
                //line Other
                self.LabelOther5.frame = CGRectMake(self.LabelOther5.frame.origin.x,850, self.LabelOther5.frame.size.width, self.LabelOther5.frame.size.height)
                
                
                self.SaveButton.frame = CGRectMake(self.SaveButton.frame.origin.x,1070, self.SaveButton.frame.size.width, self.SaveButton.frame.size.height)
                
                
                
                
            }//finalizacion Iphone 6plus
            
            

            
        
        
        }//finalizacion del office button false
        
        else if(self.AddressButtonOther.hidden==false){
            
            self.ArrowBlueOther.image = UIImage (named: "arrow_blue")
            self.CreditCardButton.enabled = true
            
            //ocultar elementos de Other
            self.OtherButton.hidden = false
            self.ArrowBlueOther.hidden = false
            self.AddressButtonOther.hidden = true
            self.CloseOther.hidden = true
            self.UnitedOther.hidden = true
            self.ZipcodeOther.hidden = true
            self.LabelOther2.hidden = true
            self.LabelOther3.hidden = true
            self.SpecialOther.hidden = true
            self.LabelOther4.hidden = true
            self.SaveButton.hidden = true
            self.LabelOther5.hidden = false
            self.LabelOther6.hidden = true
            self.LabelOther1.hidden = true
            self.EditButtonOther.hidden = true
            self.SaveButton.hidden = true
            
            if (self.Window.frame.size.height > 480 && self.Window.frame.size.height <= 568 ){
                self.ScrollView.contentSize = CGSizeMake(self.view.frame.size.width, 1750)
                
                //iphone 5
                
                //traer boton de address up
                self.HomeButton.frame = CGRectMake(self.HomeButton.frame.origin.x, 560, self.HomeButton.frame.size.width,self.HomeButton.frame.size.height)
                
                //traer flecha gris address up
                self.ArrowBlue2.frame = CGRectMake(self.ArrowBlue2.frame.origin.x, 580, self.ArrowBlue2.frame.size.width, self.ArrowBlue2.frame.size.height)
                
                
                //line blue up
                self.LabelHome1.frame = CGRectMake(self.LabelHome1.frame.origin.x,590, self.LabelHome1.frame.size.width, self.LabelHome1.frame.size.height)
                
                //office button
                self.OfficeButton.frame = CGRectMake(self.OfficeButton.frame.origin.x,590, self.OfficeButton.frame.size.width, self.OfficeButton.frame.size.height)
                
                //arrow blue office
                self.ArrowBlueOffice.frame = CGRectMake(self.ArrowBlueOffice.frame.origin.x,625, self.ArrowBlueOffice.frame.size.width, self.ArrowBlueOffice.frame.size.height)
                
                //line office
                self.LabelOffice1.frame = CGRectMake(self.LabelOffice1.frame.origin.x,635, self.LabelOffice1.frame.size.width, self.LabelOffice1.frame.size.height)
                //Other Button
                self.OtherButton.frame = CGRectMake(self.OtherButton.frame.origin.x,635, self.OtherButton.frame.size.width, self.OtherButton.frame.size.height)
                //arrow blue other
                self.ArrowBlueOther.frame = CGRectMake(self.ArrowBlueOther.frame.origin.x,670, self.ArrowBlueOther.frame.size.width, self.ArrowBlueOther.frame.size.height)
                //line Other
                self.LabelOther5.frame = CGRectMake(self.LabelOther5.frame.origin.x,680, self.LabelOther5.frame.size.width, self.LabelOther5.frame.size.height)
                
                //iphone 4
            }else if (self.Window.frame.size.height <= 480 ){
                self.ScrollView.contentSize = CGSizeMake(self.view.frame.size.width, 1600)
                
                //traer boton de address
                self.HomeButton.frame = CGRectMake(self.HomeButton.frame.origin.x, 570, self.HomeButton.frame.size.width, self.HomeButton.frame.size.height)
                
                //traer flecha gris de address
                self.ArrowBlue2.frame = CGRectMake(self.ArrowBlue2.frame.origin.x, 590, self.ArrowBlue2.frame.size.width, self.ArrowBlue2.frame.size.height)
                
                self.LabelHome1.frame = CGRectMake(self.LabelHome1.frame.origin.x,600, self.LabelHome1.frame.size.width, self.LabelHome1.frame.size.height)
                
                //office button
                self.OfficeButton.frame = CGRectMake(self.OfficeButton.frame.origin.x,605, self.OfficeButton.frame.size.width, self.OfficeButton.frame.size.height)
                
                //arrow blue office
                self.ArrowBlueOffice.frame = CGRectMake(self.ArrowBlueOffice.frame.origin.x,640, self.ArrowBlueOffice.frame.size.width, self.ArrowBlueOffice.frame.size.height)
                
                //line office
                self.LabelOffice1.frame = CGRectMake(self.LabelOffice1.frame.origin.x,650, self.LabelOffice1.frame.size.width, self.LabelOffice1.frame.size.height)
                
                //Other Button
                self.OtherButton.frame = CGRectMake(self.OtherButton.frame.origin.x,655, self.OtherButton.frame.size.width, self.OtherButton.frame.size.height)
                
                //arrow blue other
                self.ArrowBlueOther.frame = CGRectMake(self.ArrowBlueOther.frame.origin.x,690, self.ArrowBlueOther.frame.size.width, self.ArrowBlueOther.frame.size.height)
                
                //line Other
                self.LabelOther5.frame = CGRectMake(self.LabelOther5.frame.origin.x,700, self.LabelOther5.frame.size.width, self.LabelOther5.frame.size.height)
                
                
                
            }//finalizacion iphone 4
                
                //iphone 6
                
            else if (self.Window.frame.size.height > 568 && self.Window.frame.size.height <= 667){
                self.ScrollView.contentSize = CGSizeMake(self.view.frame.size.width, 2000)
                
                //traer boton de address
                self.HomeButton.frame = CGRectMake(self.HomeButton.frame.origin.x, 620, self.HomeButton.frame.size.width, self.HomeButton.frame.size.height)
                
                //traer flecha gris de address
                self.ArrowBlue2.frame = CGRectMake(self.ArrowBlue2.frame.origin.x,640 , self.ArrowBlue2.frame.size.width, self.ArrowBlue2.frame.size.height)
                
                self.LabelHome1.frame = CGRectMake(self.LabelHome1.frame.origin.x,650, self.LabelHome1.frame.size.width, self.LabelHome1.frame.size.height)
                
                
                //office button
                self.OfficeButton.frame = CGRectMake(self.OfficeButton.frame.origin.x,660, self.OfficeButton.frame.size.width, self.OfficeButton.frame.size.height)
                
                //arrow blue office
                self.ArrowBlueOffice.frame = CGRectMake(self.ArrowBlueOffice.frame.origin.x,690, self.ArrowBlueOffice.frame.size.width, self.ArrowBlueOffice.frame.size.height)
                
                //line office
                self.LabelOffice1.frame = CGRectMake(self.LabelOffice1.frame.origin.x,705, self.LabelOffice1.frame.size.width, self.LabelOffice1.frame.size.height)
                
                //Other Button
                self.OtherButton.frame = CGRectMake(self.OtherButton.frame.origin.x,710, self.OtherButton.frame.size.width, self.OtherButton.frame.size.height)
                
                //arrow blue other
                self.ArrowBlueOther.frame = CGRectMake(self.ArrowBlueOther.frame.origin.x,745, self.ArrowBlueOther.frame.size.width, self.ArrowBlueOther.frame.size.height)
                
                //line Other
                self.LabelOther5.frame = CGRectMake(self.LabelOther5.frame.origin.x,755, self.LabelOther5.frame.size.width, self.LabelOther5.frame.size.height)
                
                //save button
                self.SaveButton.frame = CGRectMake(self.SaveButton.frame.origin.x,890, self.SaveButton.frame.size.width, self.SaveButton.frame.size.height)
                
                
                
            }//iphone 6 plus
                
            else if (self.Window.frame.size.height > 667 && self.Window.frame.size.height <= 736){
                self.ScrollView.contentSize = CGSizeMake(self.view.frame.size.width, 2250)
                
                //traer boton de address
                self.HomeButton.frame = CGRectMake(self.HomeButton.frame.origin.x, 710, self.HomeButton.frame.size.width, self.HomeButton.frame.size.height)
                
                //traer flecha gris de address
                self.ArrowBlue2.frame = CGRectMake(self.ArrowBlue2.frame.origin.x,720 , self.ArrowBlue2.frame.size.width, self.ArrowBlue2.frame.size.height)
                
                self.LabelHome1.frame = CGRectMake(self.LabelHome1.frame.origin.x,740, self.LabelHome1.frame.size.width, self.LabelHome1.frame.size.height)
                
                
                //office button
                self.OfficeButton.frame = CGRectMake(self.OfficeButton.frame.origin.x,755, self.OfficeButton.frame.size.width, self.OfficeButton.frame.size.height)
                
                //arrow blue office
                self.ArrowBlueOffice.frame = CGRectMake(self.ArrowBlueOffice.frame.origin.x,790, self.ArrowBlueOffice.frame.size.width, self.ArrowBlueOffice.frame.size.height)
                
                //line office
                self.LabelOffice1.frame = CGRectMake(self.LabelOffice1.frame.origin.x,800, self.LabelOffice1.frame.size.width, self.LabelOffice1.frame.size.height)
                
                //Other Button
                self.OtherButton.frame = CGRectMake(self.OtherButton.frame.origin.x,815, self.OtherButton.frame.size.width, self.OtherButton.frame.size.height)
                
                //arrow blue other
                self.ArrowBlueOther.frame = CGRectMake(self.ArrowBlueOther.frame.origin.x,850, self.ArrowBlueOther.frame.size.width, self.ArrowBlueOther.frame.size.height)
                
                //line Other
                self.LabelOther5.frame = CGRectMake(self.LabelOther5.frame.origin.x,860, self.LabelOther5.frame.size.width, self.LabelOther5.frame.size.height)
                
                //save button
                self.SaveButton.frame = CGRectMake(self.SaveButton.frame.origin.x,990, self.SaveButton.frame.size.width, self.SaveButton.frame.size.height)
                
            }

        
        
        
        }//finalizacion del otherbutton false
        else{
            
            self.ScrollView.contentSize = CGSizeMake(self.view.frame.size.width, 3000)
            
            self.ArrowBlueOther.image = UIImage (named: "arrow_blue_UP")
           
            self.SaveButton.backgroundColor = UIColor (red:0.686,green:0.686,blue:0.686,alpha:1)
            self.SaveButton.enabled = false
            self.CreditCardButton.enabled = false
            self.CloseOther.enabled = false
            
            
            //mostrar elementos de Other
            self.OtherButton.hidden = false
            self.ArrowBlueOther.hidden = false
            self.AddressButtonOther.hidden = false
            self.CloseOther.hidden = false
            self.UnitedOther.hidden = false
            self.ZipcodeOther.hidden = false
            self.LabelOther2.hidden = false
            self.LabelOther3.hidden = false
            self.SpecialOther.hidden = false
            self.LabelOther4.hidden = false
            self.SaveButton.hidden = false
            self.LabelOther5.hidden = false
            self.LabelOther6.hidden = false
            self.LabelOther1.hidden = false
            self.EditButtonOther.hidden = false
            self.SaveButton.hidden = false
            
          
            
            //POSICIONAMIENTO DE LOS ELEMENTOS
            
            //iphone 4
            if (self.Window.frame.size.height <= 480 ){
                self.ScrollView.contentSize = CGSizeMake(self.view.frame.size.width, 1845)
                
                self.AddressButtonOther.frame = CGRectMake(self.AddressButtonOther.frame.origin.x,690, self.AddressOffice.frame.size.width, self.AddressButtonOther.frame.size.height)
                
                self.LabelOther1.frame = CGRectMake(self.LabelOther1.frame.origin.x,745, self.LabelOther1.frame.size.width, self.LabelOther1.frame.size.height)
                
                self.LabelOther2.frame = CGRectMake(self.LabelOther2.frame.origin.x,745, self.LabelOther2.frame.size.width, self.LabelOther2.frame.size.height)
                
                self.CloseOther.frame = CGRectMake(self.CloseOther.frame.origin.x,715, self.CloseOther.frame.size.width, self.CloseOther.frame.size.height)
                
                self.UnitedOther.frame = CGRectMake(self.UnitedOther.frame.origin.x,740, self.UnitedOther.frame.size.width, self.UnitedOther.frame.size.height)
                
                self.ZipcodeOther.frame = CGRectMake(self.ZipcodeOther.frame.origin.x,740, self.ZipcodeOther.frame.size.width, self.ZipcodeOther.frame.size.height)
                
                self.LabelOther3.frame = CGRectMake(self.LabelOther3.frame.origin.x,790, self.LabelOther3.frame.size.width, self.LabelOther3.frame.size.height)
                
                self.SpecialOther.frame = CGRectMake(self.SpecialOther.frame.origin.x,780, self.SpecialOther.frame.size.width, self.SpecialOther.frame.size.height)
                
                self.LabelOther4.frame = CGRectMake(self.LabelOther4.frame.origin.x,830, self.LabelOther4.frame.size.width, self.LabelOther4.frame.size.height)
                
                self.EditButtonOther.frame = CGRectMake(self.EditButtonOther.frame.origin.x,850, self.EditButtonOther.frame.size.width, self.EditButtonOther.frame.size.height)
                
                self.LabelOther6.frame = CGRectMake(self.LabelOther6.frame.origin.x,900, self.LabelOther6.frame.size.width, self.LabelOther6.frame.size.height)
                
                
                //traer boton de address
                self.OfficeButton.frame = CGRectMake(self.OfficeButton.frame.origin.x,600, self.OfficeButton.frame.size.width, self.OfficeButton.frame.size.height)
                
                //arrow blue office
                self.ArrowBlueOffice.frame = CGRectMake(self.ArrowBlueOffice.frame.origin.x,635, self.ArrowBlueOffice.frame.size.width, self.ArrowBlueOffice.frame.size.height)
                
                //line office
                self.LabelOffice1.frame = CGRectMake(self.LabelOffice1.frame.origin.x,650, self.LabelOffice1.frame.size.width, self.LabelOffice1.frame.size.height)
                
                //Other Button
                self.OtherButton.frame = CGRectMake(self.OtherButton.frame.origin.x,650, self.OtherButton.frame.size.width, self.OtherButton.frame.size.height)
                
                //arrow blue other
                self.ArrowBlueOther.frame = CGRectMake(self.ArrowBlueOther.frame.origin.x,680, self.ArrowBlueOther.frame.size.width, self.ArrowBlueOther.frame.size.height)
                
                //line Other
                self.LabelOther5.frame = CGRectMake(self.LabelOther5.frame.origin.x,700, self.LabelOther5.frame.size.width, self.LabelOther5.frame.size.height)
                
                
                self.SaveButton.frame = CGRectMake(self.SaveButton.frame.origin.x,930, self.SaveButton.frame.size.width, self.SaveButton.frame.size.height)
                
                
                
            }//finalizacion del iphone 4
                
                //iphone 5
            else if (self.Window.frame.size.height > 480 && self.Window.frame.size.height <= 568 ){
                self.ScrollView.contentSize = CGSizeMake(self.view.frame.size.width, 1965)
                
                self.AddressButtonOther.frame = CGRectMake(self.AddressButtonOther.frame.origin.x,670, self.AddressButtonOther.frame.size.width, self.AddressButtonOther.frame.size.height)
                
                self.LabelOther1.frame = CGRectMake(self.LabelOther1.frame.origin.x,720, self.LabelOther1.frame.size.width, self.LabelOther1.frame.size.height)
                
                self.LabelOther2.frame = CGRectMake(self.LabelOther2.frame.origin.x,720, self.LabelOther2.frame.size.width, self.LabelOther2.frame.size.height)
                
                self.CloseOther.frame = CGRectMake(self.CloseOther.frame.origin.x,690, self.CloseOther.frame.size.width, self.CloseOther.frame.size.height)
                
                self.UnitedOther.frame = CGRectMake(self.UnitedOther.frame.origin.x,710, self.UnitedOther.frame.size.width, self.UnitedOther.frame.size.height)
                
                self.ZipcodeOther.frame = CGRectMake(self.ZipcodeOther.frame.origin.x,710, self.ZipcodeOther.frame.size.width, self.ZipcodeOther.frame.size.height)
                
                self.LabelOther3.frame = CGRectMake(self.LabelOther3.frame.origin.x,765, self.LabelOther3.frame.size.width, self.LabelOther3.frame.size.height)
                
                self.SpecialOther.frame = CGRectMake(self.SpecialOther.frame.origin.x,750, self.SpecialOther.frame.size.width, self.SpecialOther.frame.size.height)
                
                self.LabelOther4.frame = CGRectMake(self.LabelOther4.frame.origin.x,800, self.LabelOther4.frame.size.width, self.LabelOther4.frame.size.height)
                
                self.EditButtonOther.frame = CGRectMake(self.EditButtonOther.frame.origin.x,820, self.EditButtonOther.frame.size.width, self.EditButtonOther.frame.size.height)
                
                self.LabelOther6.frame = CGRectMake(self.LabelOther6.frame.origin.x,870, self.LabelOther6.frame.size.width, self.LabelOther6.frame.size.height)
                
                
                //traer boton de address
                self.OfficeButton.frame = CGRectMake(self.OfficeButton.frame.origin.x,590, self.OfficeButton.frame.size.width, self.OfficeButton.frame.size.height)
                
                //arrow blue office
                self.ArrowBlueOffice.frame = CGRectMake(self.ArrowBlueOffice.frame.origin.x,620, self.ArrowBlueOffice.frame.size.width, self.ArrowBlueOffice.frame.size.height)
                
                //line office
                self.LabelOffice1.frame = CGRectMake(self.LabelOffice1.frame.origin.x,640, self.LabelOffice1.frame.size.width, self.LabelOffice1.frame.size.height)
                
                //Other Button
                self.OtherButton.frame = CGRectMake(self.OtherButton.frame.origin.x,630, self.OtherButton.frame.size.width, self.OtherButton.frame.size.height)
                
                //arrow blue other
                self.ArrowBlueOther.frame = CGRectMake(self.ArrowBlueOther.frame.origin.x,660, self.ArrowBlueOther.frame.size.width, self.ArrowBlueOther.frame.size.height)
                
                //line Other
                self.LabelOther5.frame = CGRectMake(self.LabelOther5.frame.origin.x,680, self.LabelOther5.frame.size.width, self.LabelOther5.frame.size.height)
                
                
                self.SaveButton.frame = CGRectMake(self.SaveButton.frame.origin.x,890, self.SaveButton.frame.size.width, self.SaveButton.frame.size.height)
                
                
                
            }//finalizacion iphone 5
                
                //iphone 6
            else if (self.Window.frame.size.height > 568 && self.Window.frame.size.height <= 667){
                self.ScrollView.contentSize = CGSizeMake(self.view.frame.size.width, 2205)
                
                
                self.AddressButtonOther.frame = CGRectMake(self.AddressButtonOther.frame.origin.x,730, self.AddressButtonOther.frame.size.width, self.AddressButtonOther.frame.size.height)
                
                self.LabelOther1.frame = CGRectMake(self.LabelOther1.frame.origin.x,780, self.LabelOther1.frame.size.width, self.LabelOther1.frame.size.height)
                
                self.LabelOther2.frame = CGRectMake(self.LabelOther2.frame.origin.x,780, self.LabelOther2.frame.size.width, self.LabelOther2.frame.size.height)
                
                self.CloseOther.frame = CGRectMake(self.CloseOther.frame.origin.x,750, self.CloseOther.frame.size.width, self.CloseOffice.frame.size.height)
                
                self.UnitedOther.frame = CGRectMake(self.UnitedOther.frame.origin.x,770, self.UnitedOther.frame.size.width, self.UnitedOther.frame.size.height)
                
                self.ZipcodeOther.frame = CGRectMake(self.ZipcodeOther.frame.origin.x,770, self.ZipcodeOther.frame.size.width, self.ZipcodeOther.frame.size.height)
                
                self.LabelOther3.frame = CGRectMake(self.LabelOther3.frame.origin.x,825, self.LabelOther3.frame.size.width, self.LabelOther3.frame.size.height)
                
                self.SpecialOther.frame = CGRectMake(self.SpecialOther.frame.origin.x,810, self.SpecialOther.frame.size.width, self.SpecialOffice.frame.size.height)
                
                self.LabelOther4.frame = CGRectMake(self.LabelOther4.frame.origin.x,860, self.LabelOther4.frame.size.width, self.LabelOther4.frame.size.height)
                
                self.EditButtonOther.frame = CGRectMake(self.EditButtonOther.frame.origin.x,880, self.EditButtonOther.frame.size.width, self.EditButtonOther.frame.size.height)
                
                self.LabelOther6.frame = CGRectMake(self.LabelOther6.frame.origin.x,930, self.LabelOther6.frame.size.width, self.LabelOther6.frame.size.height)
                
                
                //traer boton de address
                self.OfficeButton.frame = CGRectMake(self.OfficeButton.frame.origin.x,650, self.OfficeButton.frame.size.width, self.OfficeButton.frame.size.height)
                
                //arrow blue office
                self.ArrowBlueOffice.frame = CGRectMake(self.ArrowBlueOffice.frame.origin.x,680, self.ArrowBlueOffice.frame.size.width, self.ArrowBlueOffice.frame.size.height)
                
                //line office
                self.LabelOffice1.frame = CGRectMake(self.LabelOffice1.frame.origin.x,700, self.LabelOffice1.frame.size.width, self.LabelOffice1.frame.size.height)
                
                //Other Button
                self.OtherButton.frame = CGRectMake(self.OtherButton.frame.origin.x,690, self.OtherButton.frame.size.width, self.OtherButton.frame.size.height)
                
                //arrow blue other
                self.ArrowBlueOther.frame = CGRectMake(self.ArrowBlueOther.frame.origin.x,720, self.ArrowBlueOther.frame.size.width, self.ArrowBlueOther.frame.size.height)
                
                //line Other
                self.LabelOther5.frame = CGRectMake(self.LabelOther5.frame.origin.x,740, self.LabelOther5.frame.size.width, self.LabelOther5.frame.size.height)
                
                
                self.SaveButton.frame = CGRectMake(self.SaveButton.frame.origin.x,950, self.SaveButton.frame.size.width, self.SaveButton.frame.size.height)
                
            }//finalizacion del iphone 6
                
                //iphone 6 plus
            else if (self.Window.frame.size.height > 667 && self.Window.frame.size.height <= 736){
                self.ScrollView.contentSize = CGSizeMake(self.view.frame.size.width, 2450)
                
                  self.AddressButtonOther.frame = CGRectMake(self.AddressButtonOther.frame.origin.x,840, self.AddressButtonOther.frame.size.width, self.AddressButtonOther.frame.size.height)
                
            self.LabelOther1.frame = CGRectMake(self.LabelOther1.frame.origin.x,890, self.LabelOther1.frame.size.width, self.LabelOther1.frame.size.height)
                
                    self.LabelOther2.frame = CGRectMake(self.LabelOther2.frame.origin.x,890, self.LabelOther2.frame.size.width, self.LabelOther2.frame.size.height)
                
                self.CloseOther.frame = CGRectMake(self.CloseOther.frame.origin.x,860, self.CloseOther.frame.size.width, self.CloseOffice.frame.size.height)
                
                self.UnitedOther.frame = CGRectMake(self.UnitedOther.frame.origin.x,880, self.UnitedOther.frame.size.width, self.UnitedOther.frame.size.height)
                
                self.ZipcodeOther.frame = CGRectMake(self.ZipcodeOther.frame.origin.x,880, self.ZipcodeOther.frame.size.width, self.ZipcodeOther.frame.size.height)
                
                
                self.LabelOther3.frame = CGRectMake(self.LabelOther3.frame.origin.x,935, self.LabelOther3.frame.size.width, self.LabelOther3.frame.size.height)
                
           self.SpecialOther.frame = CGRectMake(self.SpecialOther.frame.origin.x,920, self.SpecialOther.frame.size.width, self.SpecialOffice.frame.size.height)
                
              self.LabelOther4.frame = CGRectMake(self.LabelOther4.frame.origin.x,970, self.LabelOther4.frame.size.width, self.LabelOther4.frame.size.height)
                
                 self.EditButtonOther.frame = CGRectMake(self.EditButtonOther.frame.origin.x,990, self.EditButtonOther.frame.size.width, self.EditButtonOther.frame.size.height)
                
               self.LabelOther6.frame = CGRectMake(self.LabelOther6.frame.origin.x,1040, self.LabelOther6.frame.size.width, self.LabelOther6.frame.size.height)
                
                
                //traer boton de address
                self.OfficeButton.frame = CGRectMake(self.OfficeButton.frame.origin.x,750, self.OfficeButton.frame.size.width, self.OfficeButton.frame.size.height)
                
                //arrow blue office
                self.ArrowBlueOffice.frame = CGRectMake(self.ArrowBlueOffice.frame.origin.x,780, self.ArrowBlueOffice.frame.size.width, self.ArrowBlueOffice.frame.size.height)
                
                //line office
                self.LabelOffice1.frame = CGRectMake(self.LabelOffice1.frame.origin.x,800, self.LabelOffice1.frame.size.width, self.LabelOffice1.frame.size.height)
                
                //Other Button
                self.OtherButton.frame = CGRectMake(self.OtherButton.frame.origin.x,800, self.OtherButton.frame.size.width, self.OtherButton.frame.size.height)
                
                //arrow blue other
                self.ArrowBlueOther.frame = CGRectMake(self.ArrowBlueOther.frame.origin.x,830, self.ArrowBlueOther.frame.size.width, self.ArrowBlueOther.frame.size.height)
                
                //line Other
                self.LabelOther5.frame = CGRectMake(self.LabelOther5.frame.origin.x,850, self.LabelOther5.frame.size.width, self.LabelOther5.frame.size.height)
                
                
                self.SaveButton.frame = CGRectMake(self.SaveButton.frame.origin.x,1070, self.SaveButton.frame.size.width, self.SaveButton.frame.size.height)
                
                
                
                
            }//finalizacion Iphone 6plus
            
             }//finalizacion del other abierto
        
           }//finalizacion del boton other 
            
        
        
        
       
        
        
  

   }//finalizacion del view controller





