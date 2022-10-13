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
    @IBOutlet var tituloPlantillaLabel: UILabel!
    @IBOutlet var nombreTextField: UITextField!
    @IBOutlet var buttonLabel: UILabel!
    @IBOutlet var editarButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let docRef = db.collection("users").document(Usuario.id)

               docRef.getDocument(source: .cache) { (document, error) in
                   if let document = document {
                       let property = document.get("first_name")
                       print(property!)
                       self.nombreTextField.attributedPlaceholder = NSAttributedString(string: property as! String)
                   } else {
                       print("No es posible asignar nombre")
                   }
               }
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
        // Do any additional setup after loading the view.
    }
    

    
    @IBAction func presionaBoton(_ sender: Any) {
    }
    

}
