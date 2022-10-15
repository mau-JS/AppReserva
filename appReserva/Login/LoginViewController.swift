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
import FirebaseFirestore

class LoginViewController: UIViewController {
    @IBOutlet var olvidasteButton: UIButton!
    @IBOutlet var eMailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var LoginButton: UIButton!
    @IBOutlet var errorLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
       setUpElements()
        olvidasteButton.layer.borderWidth = 0
        olvidasteButton.tintColor = UIColor.init(red: 204/255, green: 0/255, blue: 204/255, alpha: 0.5)
        olvidasteButton.setTitle("¿Olvidaste tu contraseña?", for: .normal)
    }
    
    func setUpElements(){
        errorLabel.alpha = 0
        Utilities.styleHollowButton(olvidasteButton)
        Utilities.styleTextField(eMailTextField)
        Utilities.styleTextField(passwordTextField)
        Utilities.styleFilledButton(LoginButton)
    }
    

    @IBAction func presionaLogin(_ sender: Any) {
        //Removiendo espacios
        let email = eMailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        //Login con usuario
        Auth.auth().signIn(withEmail: email, password: password){(result, error) in
            if error != nil{
                //Hay un error
                self.errorLabel.text = error!.localizedDescription
                self.errorLabel.alpha = 1
            }
            else{
                let user = Auth.auth().currentUser
                
                if ((user!.isEmailVerified) == true){
                    print("Tu correo ya está verificado")
                    self.performSegue(withIdentifier: "main", sender: self)                }
                else{
                    
                    
                    user!.sendEmailVerification(){(error) in
                        guard error != nil else{
                            print("Verificación enviada")
                            return
                        }
                    }
                }
                // Moverse a través de segue condicional
                //Obteniendo userID
                
                //guard let userID = Auth.auth().currentUser?.uid else { return }
                
               // self.performSegue(withIdentifier: "main", sender: nil)
                /*let mainTabBarController = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.MainTabBarController) as? MainTabBarController
                self.view.window?.rootViewController = mainTabBarController
                self.view.window?.makeKeyAndVisible()*/
                
                
            }
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //Enviando UID a los demás controllers
        
           /*  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            let barViewControllers = segue.destination as! UITabBarController
            let destinationViewController = barViewControllers.viewControllers![0] as! ViewControllerB
            destinationViewController.containsData = Data
        }*/
        
            if let destination = segue.destination as? MainTabBarController {
                //Enviando el ID para realizar operaciones de usuario
                destination.modalPresentationStyle = .fullScreen
                destination.idUsuario = Auth.auth().currentUser!.uid
                
//                let db = Firestore.firestore()
//                
//                let docRef = db.collection("users").document(Usuario.id)
//
//                       docRef.getDocument(source: .cache) { (document, error) in
//                           if let document = document {
//                               let property = document.get("fondoUsuario")
//                               destination.fondoUsuario = property as! String
//                               Usuario.fondo = property as! String
//                               //print(property!)
//                           } else {
//                               print("No existe el fondo asignado")
//                               destination.fondoUsuario = ""
//                           }
//                       }
                
                
            }
        
    }
}
