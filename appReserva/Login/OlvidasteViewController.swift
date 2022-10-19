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
import TransitionButton

class OlvidasteViewController: UIViewController {
    let button = TransitionButton(frame: CGRect(x:0 ,y:-100,width: 250,height: 50))
    @IBOutlet var tituloLabel: UILabel!
    @IBOutlet var emailTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpElements()
        button.center = view.center
        button.backgroundColor =  UIColor.init(red: 204/255, green: 0/255, blue: 204/255, alpha: 0.5)
        button.layer.cornerRadius = 25.0
        button.tintColor = UIColor.white
        button.layer.shadowOpacity = 0.5
        button.layer.shadowRadius = 1.5
        button.layer.cornerRadius = 12
        button.setTitle("Restablecer Contraseña", for: .normal)
        setUpElements()
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        button.spinnerColor = .white
        view.addSubview(button)
    }
    
    func setUpElements(){
        //Utilities.styleHollowButton(olvidasteButton)
        Utilities.styleTextField(emailTextField)
        //Utilities.styleTextField(passwordTextField)
      
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @objc func didTapButton(){
        button.startAnimation()
        let auth = Auth.auth()
        Auth.auth().languageCode = "es"
        auth.sendPasswordReset(withEmail: emailTextField.text!) { (error) in
            if let error = error{
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                           self.button.stopAnimation(animationStyle: .shake, revertAfterDelay: 1) {
                               let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
                               
                               alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
                               NSLog("The \"OK\" alert occured.")
                               }))
                               self.present(alert, animated: true, completion: nil)
                           }
                       }
                
            }
            else{
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    self.button.stopAnimation(animationStyle: .normal, revertAfterDelay: 1) {
                               let alert = UIAlertController(title: "Correcto", message: "Se ha enviado un correo electrónico a tu cuenta.", preferredStyle: .alert)
                               alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
                               NSLog("The \"OK\" alert occured.")
                               }))
                               self.present(alert, animated: true, completion: nil)
                           }
                       }
              
            }
        }
    }
 
}
