//
//  LoginViewController.swift
//  appReserva
//
//  Created by Mauricio Juárez on 29/09/22.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet var eMail: UITextField!
    @IBOutlet var login: UIButton!
    @IBOutlet var Contrasena: UITextField!
    @IBOutlet var errorLabel: UILabel!
   
    override func viewDidLoad() {
        super.viewDidLoad()
       setUpElements()
    }
    
    func setUpElements(){
        errorLabel.alpha = 0
        Utilities.styleTextField(eMail)
        Utilities.styleTextField(Contrasena)
        Utilities.styleFilledButton(login)
    }
    
    @IBAction func presionaLogin(_ sender: Any) {
    }
}
