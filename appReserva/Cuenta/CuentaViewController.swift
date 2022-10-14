//
//  CuentaViewController.swift
//  appReserva
//
//  Created by Mauricio Juárez on 19/09/22.
//

import UIKit
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth
import FirebaseAnalytics

class CuentaViewController: UIViewController {
    let db = Firestore.firestore()
    
    @IBOutlet var tituloGeneralLabel: UILabel!
    
    //Variables de campo Nombre
    @IBOutlet var tituloPlantillaLabel: UILabel!
    @IBOutlet var nombreTextField: UITextField!
    @IBOutlet var editarButton: UIButton!
    
    //Variables de campo apellido
    @IBOutlet var tituloApellidoLabel: UILabel!
    @IBOutlet var apellidoTextField: UITextField!
    @IBOutlet var editarButtonApellido: UIButton!
    
    //Variables de campo correo electrónico
    
    @IBOutlet var tituloCorreoLabel: UILabel!
    @IBOutlet var correoTextField: UITextField!
    @IBOutlet var editarButtonCorreo: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Extrayendo correo del usuario
        let user = Auth.auth().currentUser
        if let user = user {
          let email = user.email
            //print(email ?? "")
            self.correoTextField.attributedPlaceholder = NSAttributedString(string: email!)
        }
        
        
        tituloGeneralLabel.text = "Menú de Cuenta"
        self.tituloGeneralLabel.font = UIFont.boldSystemFont(ofSize: 28.0)
        //Con esto cambiamos la contraseña del usuario
//        Auth.auth().currentUser?.updatePassword(to: "hola1234567!") { error in
//          // ...
//        }
        apellidoTextField.isUserInteractionEnabled = false
        nombreTextField.isUserInteractionEnabled = false
        correoTextField.isUserInteractionEnabled = false
        
        let docRef = db.collection("users").document(Usuario.id)

               docRef.getDocument(source: .cache) { (document, error) in
                   if let document = document {
                       let property = document.get("first_name")
                                           //print(property!)
                       
                       self.nombreTextField.attributedPlaceholder = NSAttributedString(string: property as! String)
                   } else {
                       print("No es posible asignar nombre")
                   }
               }
        
        let docRef2 = db.collection("users").document(Usuario.id)

               docRef2.getDocument(source: .cache) { (document, error) in
                   if let document = document {
                       let propertyApellido = document.get("last_name")
                       
                       
                       self.apellidoTextField.attributedPlaceholder = NSAttributedString(string: propertyApellido as! String)
                   } else {
                       print("No es posible asignar apellido")
                   }
               }
        
        
        
        //MARK: - Configurando para Apellidos
        self.tituloApellidoLabel.text = "Apellido"
        self.tituloApellidoLabel.font = UIFont.boldSystemFont(ofSize: 24.0)
        editarButtonApellido.setTitle("Editar", for: .normal)
        editarButtonApellido.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20.0)
        editarButtonApellido.setImage(UIImage(systemName: "pencil"), for: .normal)
        
        //MARK: - Configurando para Nombre
        self.tituloPlantillaLabel.text = "Nombre"
        self.tituloPlantillaLabel.font = UIFont.boldSystemFont(ofSize: 24.0)
        editarButton.setTitle("Editar", for: .normal)
        editarButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20.0)
        editarButton.setImage(UIImage(systemName: "pencil"), for: .normal)
        
        //MARK: - Configurando para correo electrónico
        self.tituloCorreoLabel.text = "Correo Electrónico"
        self.tituloCorreoLabel.font = UIFont.boldSystemFont(ofSize: 24.0)
        editarButtonCorreo.setTitle("Editar", for: .normal)
        editarButtonCorreo.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20.0)
        editarButtonCorreo.setImage(UIImage(systemName: "pencil"), for: .normal)
        
        //MARK: - Aquí extraemos el nombre del usuario
        
        
        
        
//       nombreTextField.attributedPlaceholder = NSAttributedString(string: "yourPlaceholderText")
        
        
//        UILabel.appearance().substituteFontName = Usuario.fondo
//        UITextView.appearance().substituteFontName = Usuario.fondo
//        UITextField.appearance().substituteFontName = Usuario.fondo
    }
    

    
    @IBAction func presionaBoton(_ sender: Any) {
        nombreTextField.isUserInteractionEnabled.toggle()
        if nombreTextField.isUserInteractionEnabled == true{
            editarButton.setTitle("Guardar", for: .normal)
        }
        
        else{
            //Aquí guardamos la información del usuario
            editarButton.setTitle("Editar", for: .normal)
            let name: String = nombreTextField.text!
            //print(name)
            if name == ""{
                print("nombre Vacio")
            }
            else{
                //Aquí limpiamos de espacios el text field
                let nombreActual = (nombreTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines))!
                db.collection("users").document(Usuario.id).setData(["first_name": nombreActual],merge: true)
               print(nombreActual)
            }
        }
    }
    
    @IBAction func presionaBotonApellido(_ sender: Any) {
        apellidoTextField.isUserInteractionEnabled.toggle()
        if apellidoTextField.isUserInteractionEnabled == true{
            editarButtonApellido.setTitle("Guardar", for: .normal)
        }
        
        else{
            //Aquí guardamos la información del usuario
            editarButtonApellido.setTitle("Editar", for: .normal)
            let apellido: String = nombreTextField.text!
            //print(name)
            if apellido == ""{
                print("nombre Vacio")
            }
            else{
                //Aquí limpiamos de espacios el text field
                let apellidoActual = (apellidoTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines))!
                db.collection("users").document(Usuario.id).setData(["last_name": apellidoActual],merge: true)
               print(apellidoActual)
            }
        }
    }
    
    @IBAction func presionaBotonCorreo(_ sender: Any) {
        correoTextField.isUserInteractionEnabled.toggle()
        if correoTextField.isUserInteractionEnabled == true{
            editarButtonCorreo.setTitle("Guardar", for: .normal)
        }
        
        else{
            //Aquí guardamos la información del usuario
            editarButtonCorreo.setTitle("Editar", for: .normal)
            let correo: String = correoTextField.text!
            //print(name)
            if correo == ""{
                print("nombre Vacio")
            }
            else{
                //Aquí limpiamos de espacios el text field
                let credential = EmailAuthProvider.credential(withEmail: "example@email.com", password: "myPassword")
                
                
                
                let correoActual = (correoTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines))!
                
                Auth.auth().currentUser?.updateEmail(to: correoActual) { error in
                    if let error = error{
                        print(error.localizedDescription)
                    }
                    else{
                        print("Cambio de correo satisfactorio")
                    }
                }
               print(correoActual)
            }
        }
        
    }
}
