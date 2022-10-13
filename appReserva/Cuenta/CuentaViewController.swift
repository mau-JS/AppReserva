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
    
    //Variables de campo Nombre
    @IBOutlet var tituloPlantillaLabel: UILabel!
    @IBOutlet var nombreTextField: UITextField!
    @IBOutlet var editarButton: UIButton!
    
    //Variables de campo apellido
    @IBOutlet var tituloApellidoLabel: UILabel!
    @IBOutlet var apellidoTextField: UITextField!
    @IBOutlet var editarButtonApellido: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        apellidoTextField.isUserInteractionEnabled = false
        nombreTextField.isUserInteractionEnabled = false
        
        var nombreTemporal: String = ""
        var apellidoTemporal: String = ""
        
        
        
        let docRef = db.collection("users").document(Usuario.id)

               docRef.getDocument(source: .cache) { (document, error) in
                   if let document = document {
                       let property = document.get("first_name")
                       nombreTemporal = property as! String                       //print(property!)
                       
                       self.nombreTextField.attributedPlaceholder = NSAttributedString(string: property as! String)
                   } else {
                       print("No es posible asignar nombre")
                   }
               }
        
        let docRef2 = db.collection("users").document(Usuario.id)

               docRef2.getDocument(source: .cache) { (document, error) in
                   if let document = document {
                       let propertyApellido = document.get("last_name")
                       apellidoTemporal = propertyApellido as! String
                       
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
        
        self.tituloPlantillaLabel.text = "Nombre"
        self.tituloPlantillaLabel.font = UIFont.boldSystemFont(ofSize: 24.0)
        editarButton.setTitle("Editar", for: .normal)
        editarButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20.0)
        editarButton.setImage(UIImage(systemName: "pencil"), for: .normal)
        
        //MARK: - Aquí extramoes el nombre del usuario
        
        
        
        
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
    
}
