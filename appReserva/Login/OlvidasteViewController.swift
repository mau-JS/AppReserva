//
//  OlvidasteViewController.swift
//  appReserva
//
//  Created by Mauricio Juárez on 15/10/22.
//

import UIKit
import FirebaseCore
import FirebaseAuth
import FirebaseAnalytics
import FirebaseDatabase

class OlvidasteViewController: UIViewController {
    
    @IBOutlet var tituloLabel: UILabel!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var enviarButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpElements()
    }
    
    func setUpElements(){
        //Utilities.styleHollowButton(olvidasteButton)
        Utilities.styleTextField(emailTextField)
        //Utilities.styleTextField(passwordTextField)
        Utilities.styleFilledButton(enviarButton)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func presionaEnviarButton(_ sender: Any) {
        let auth = Auth.auth()
        Auth.auth().languageCode = "es"
        auth.sendPasswordReset(withEmail: emailTextField.text!) { (error) in
            if let error = error{
                let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
                NSLog("The \"OK\" alert occured.")
                }))
                self.present(alert, animated: true, completion: nil)
            }
            else{
                let alert = UIAlertController(title: "Correcto", message: "Se ha enviado un correo electrónico a tu cuenta", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
                NSLog("The \"OK\" alert occured.")
                }))
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
}
