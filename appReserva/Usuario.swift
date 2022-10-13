//
//  user.swift
//  appReserva
//
//  Created by Mauricio Juárez on 30/09/22.
//
import Foundation
import FirebaseFirestore
import FirebaseCore
import FirebaseAnalytics
import FirebaseAuth
struct Usuario{
    static var id: String = "Not Set"
    //Aquí guardamos una variable de tipo Font Descriptor
    static var fondo: String = ""
    func aplicarFondo(){
            //MARK: - Asignando el fondo a aplicar
            UILabel.appearance().substituteFontName = Usuario.fondo
            UITextView.appearance().substituteFontName = Usuario.fondo
            UITextField.appearance().substituteFontName = Usuario.fondo
    }
}
