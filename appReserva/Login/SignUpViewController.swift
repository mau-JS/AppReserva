//
//  SignUpViewController.swift
//  appReserva
//
//  Created by Mauricio Juárez on 29/09/22.
//

import UIKit
import FirebaseCore
import FirebaseAuth
import FirebaseAnalytics
import FirebaseFirestore
import TransitionButton

class SignUpViewController: UIViewController {
    let button = TransitionButton(frame: CGRect(x:0 ,y:-100,width: 250,height: 50))
    
    @IBOutlet var nombreTextField: UITextField!
    
    @IBOutlet var apellidosTextField: UITextField!
    
    @IBOutlet var emailTextField: UITextField!
    
    @IBOutlet var passwordtextField: UITextField!
    

    
    
    @IBOutlet var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        button.center = view.center
        button.backgroundColor =  UIColor.init(red: 204/255, green: 0/255, blue: 204/255, alpha: 0.5)
        button.layer.cornerRadius = 25.0
        button.tintColor = UIColor.white
        button.layer.shadowOpacity = 0.5
        button.layer.shadowRadius = 1.5
        button.layer.cornerRadius = 12
        button.setTitle("Continue", for: .normal)
        setUpElements()
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        button.spinnerColor = .white
        view.addSubview(button)
    }
    
    
    func setUpElements(){
        // Para ocultar el botón de error
        errorLabel.alpha = 0
        //Para dar formato a los text field y botones
        Utilities.styleTextField(nombreTextField)
        Utilities.styleTextField(apellidosTextField)
        Utilities.styleTextField(emailTextField)
        Utilities.styleTextField(passwordtextField)
        
    }
    //Checando campos y validando información
    func validateFields() -> String? {
        
        //Checando que todos los campos estén llenos y removiendo espacios
        if nombreTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || apellidosTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            passwordtextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""
        {
            return "Por favor llena todos los campos."
        }
        //Checando que la contraseña es segura.
        let verifyPassword = passwordtextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if FormUtilities.isPasswordValid(verifyPassword) == false{
            //La contraseña no es segura
            return "La contraseña debe tener al menos 8 caracteres, un caracter especial y un número."
        }
        
        return nil
    }
    @objc func didTapButton(){
        //Validar campos y crear usuarios
        button.startAnimation()
        let error = validateFields()
       
        if error != nil{
            //Hay un problema con los campos
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.button.stopAnimation(animationStyle: .shake, revertAfterDelay: 1) {
                    self.showError(error!)
                        self.errorLabel.alpha = 1
                }
            }
            showError(error!)
        }
        else{
            //Crear usuario
            //Transicionar a pantalla de inicio
            //Asegurarse de que no haya espacios primero
            let firstName = nombreTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let lastName = apellidosTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordtextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            Auth.auth().createUser(withEmail: email, password: password){(result, err) in
                //Checar errores
                if err != nil{
                    //Hubo un error al crear el usuario
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        self.button.stopAnimation(animationStyle: .shake, revertAfterDelay: 1) {
                            self.showError("Error creando el usuario, ya existe una cuenta asociada al correo proporcionado.")
                                self.errorLabel.alpha = 1
                        }
                    }
                }
//--------------------- Aquí es donde agregamos los nombres a la base de datos.-------------------------
                else{
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        self.button.stopAnimation(animationStyle: .normal, revertAfterDelay: 1) {
                            let db = Firestore.firestore()
                            //Result contiene el id del usuario
                            //result!.user.uid tiene el id del usuario
                            
                            db.collection("users").document(result!.user.uid).setData(["first_name": firstName,"last_name": lastName]) { (error) in
                                if error != nil{
                                    self.showError("Error guardando la información del usuario")
                                }
                            }
                            let myWebView = self.storyboard!.instantiateViewController(withIdentifier: "MainView") as! MainViewController
                            //Aquí configuramos como deseamos que se presente la pantalla
                            myWebView.modalPresentationStyle = .fullScreen
                            self.present(myWebView, animated: true, completion: nil)
                        }
                    }
                    //El usuario fue creado satisfactoriamente, ahora guardar el nombre y apellido
                    //Creando el objeto donde llamaremos todas las funciones de la base de datos
                    //Transición a página de inicio
                    
                    
                } //Aquí corta el código
                
            }
        }
    }
    
    func showError(_ message: String){
        errorLabel.text = message
        errorLabel.alpha = 1
    }
}
