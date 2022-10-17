//
//  MainTabBarController.swift
//  appReserva
//
//  Created by Mauricio Juárez on 29/09/22.
//

import UIKit
import FirebaseFirestore
import FirebaseAuth
import FirebaseAnalytics
class MainTabBarController: UITabBarController {
    //Recibiendo información desde pantalla de inicio
    var cadena: String = ""
    //var idUsuario: String = "Hola logré imprimir"
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //UILabel.appearance().substituteFontName = Usuario.fondo
        //UITextView.appearance().substituteFontName = Usuario.fondo
        //UITextField.appearance().substituteFontName = Usuario.fondo
        
        self.tabBar.tintColor = UIColor.init(red: 204/255, green: 0/255, blue: 204/255, alpha: 0.5)
        //print(idUsuario)
        //Usuario.id = idUsuario
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.hidesBackButton = true
    }
}
