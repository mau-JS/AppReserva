//
//  firstTabViewController.swift
//  appReserva
//
//  Created by Mauricio Juárez on 05/10/22.
//

import UIKit
import FirebaseCore
import FirebaseAuth
import FirebaseDatabase
import FirebaseFirestore
import FirebaseAnalytics



class firstTabViewController: UIViewController {
    @IBOutlet var botonSalida: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UILabel.appearance().substituteFontName = Usuario.fondo // USE YOUR FONT NAME INSTEAD
        UITextView.appearance().substituteFontName = Usuario.fondo // USE YOUR FONT NAME INSTEAD
        UITextField.appearance().substituteFontName = Usuario.fondo
        // Do any additional setup after loading the view.
    }
    

    
    @IBAction func presionaBoton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
