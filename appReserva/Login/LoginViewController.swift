//
//  LoginViewController.swift
//  appReserva
//
//  Created by Mauricio Juárez on 29/09/22.
//

import UIKit
import FirebaseAuth
import FirebaseCore
import FirebaseAnalytics

class LoginViewController: UIViewController {
    
    @IBOutlet var eMailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var LoginButton: UIButton!
    @IBOutlet var errorLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
       setUpElements()
    }
    
    func setUpElements(){
        errorLabel.alpha = 0
        Utilities.styleTextField(eMailTextField)
        Utilities.styleTextField(passwordTextField)
        Utilities.styleFilledButton(LoginButton)
    }
    
    @IBAction func presionaLogin(_ sender: Any) {
        //Validar campos
        
        //Limpiando espacios de los text fields y asumiendo que todos los campos son válidos
        let email = eMailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        //Login al usuario
        Auth.auth().signIn(withEmail: email, password: password){(result, error) in
            if error != nil{
                //No se pudo iniciar sesión. Desplegando tipo de error
                self.errorLabel.text = error!.localizedDescription
                self.errorLabel.alpha = 1
            }
            else{
                let homeViewController =
                self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeViewcontroller) as? HomeViewController
                self.view.window?.rootViewController = homeViewController
                self.view.window?.makeKeyAndVisible()
            }
            
        }
        
    }
}
