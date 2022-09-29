//
//  formUtilities.swift
//  appReserva
//
//  Created by Mauricio Juárez on 29/09/22.
//

import Foundation
class FormUtilities{
    static func isPasswordValid(_ password : String) -> Bool {
        //Aplicando una expresión regular para que la contraseña sea segura
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
        return passwordTest.evaluate(with: password)
    }}
