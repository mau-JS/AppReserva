//
//  ReservaMenuController.swift
//  appReserva
//
//  Created by Mauricio Juárez on 11/10/22.
//

import UIKit

class ReservaMenuController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        UILabel.appearance().substituteFontName = Usuario.fondo
        UITextView.appearance().substituteFontName = Usuario.fondo
        UITextField.appearance().substituteFontName = Usuario.fondo
    }
}
