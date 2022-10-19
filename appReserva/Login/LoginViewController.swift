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
import TransitionButton

class LoginViewController: UIViewController {
    let button = TransitionButton(frame: CGRect(x:0,y:0,width: 250,height: 50))
    @IBOutlet var olvidasteButton: UIButton!
    @IBOutlet var eMailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    @IBOutlet var errorLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
       setUpElements()
        olvidasteButton.layer.borderWidth = 0
        olvidasteButton.tintColor = UIColor.init(red: 204/255, green: 0/255, blue: 204/255, alpha: 0.5)
        olvidasteButton.setTitle("¿Olvidaste tu contraseña?", for: .normal)
        button.center = view.center
        button.backgroundColor =  UIColor.init(red: 204/255, green: 0/255, blue: 204/255, alpha: 0.5)
        button.layer.cornerRadius = 25.0
        button.tintColor = UIColor.white
        button.layer.shadowOpacity = 0.5
        button.layer.shadowRadius = 1.5
        button.layer.cornerRadius = 12
        button.setTitle("Ingresar", for: .normal)
        
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        button.spinnerColor = .white
        view.addSubview(button)
    }
    @objc func didTapButton(){
        button.startAnimation()
        let email = eMailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        //Login con usuario
        Auth.auth().signIn(withEmail: email, password: password){(result, error) in
            if error != nil{
                //Hay un error
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    self.button.stopAnimation(animationStyle: .shake, revertAfterDelay: 1) {
                            self.errorLabel.text = error!.localizedDescription
                            self.errorLabel.alpha = 1
                    }
                }
                
            }
            else{
                
                let user = Auth.auth().currentUser

                if ((user!.isEmailVerified) == true){
                    print("Tu correo ya está verificado")
                    //Aquí va la animación del botón
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        self.button.stopAnimation(animationStyle: .normal, revertAfterDelay: 1) {
                            Usuario.id = Auth.auth().currentUser!.uid
                            let myWebView = self.storyboard!.instantiateViewController(withIdentifier: "main") as! MainTabBarController
                            //Aquí configuramos como deseamos que se presente la pantalla
                            
                            myWebView.modalPresentationStyle = .fullScreen
                            self.present(myWebView, animated: true, completion: nil)
                            
//                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            
//                            }
                        }
                    }
                   // self.performSegue(withIdentifier: "main", sender: self)
            
                }
                else{
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        self.button.stopAnimation(animationStyle: .shake, revertAfterDelay: 1) {
                            user!.sendEmailVerification(){(error) in
                                guard error != nil else{
                                    print("Estoy aquí")
                                    let alert = UIAlertController(title: "Verifica la cuenta", message: "Se ha enviado un correo electrónico a tu cuenta para que te verifiques.", preferredStyle: .alert)
                                    alert.addAction(UIAlertAction(title: NSLocalizedString("Aceptar", comment: "Default action"), style: .default, handler: { _ in
                                    NSLog("The \"Aceptar\" alert occured.")
                                    }))
                                    self.present(alert, animated: true, completion: nil)
                                    return
                                }
                            }
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
    func setUpElements(){
        errorLabel.alpha = 0
        Utilities.styleHollowButton(olvidasteButton)
        Utilities.styleTextField(eMailTextField)
        Utilities.styleTextField(passwordTextField)
        
    }
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//            if let destination = segue.destination as? MainTabBarController {
//                //Enviando el ID para realizar operaciones de usuario
//                destination.modalPresentationStyle = .fullScreen
//                destination.idUsuario = Auth.auth().currentUser!.uid
//            }
//
//    }
}
