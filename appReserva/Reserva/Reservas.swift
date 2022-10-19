//
//  emoji.swift
//  appReserva
//
//  Created by Mauricio Juárez on 23/09/22.
//

import Foundation
import FirebaseFirestore
import FirebaseCore
import FirebaseAnalytics
import FirebaseAuth
struct Reservas {
    
    var id: String
    var nombreRecurso: String
    var tipo: String
    var ubicacion: String
    var horarioInicio: String
    var horarioFinal: String
    

    init(id: String, nombreRecurso: String, tipo: String, ubicacion: String, horarioInicio: String, horarioFinal: String){
        self.id = id
        self.nombreRecurso = nombreRecurso
        self.tipo = tipo
        self.ubicacion = ubicacion
        self.horarioInicio = horarioInicio
        self.horarioFinal = horarioFinal
    }
    
    init (json: [String: Any]){
        self.id = json ["id"] as? String ?? ""
        self.nombreRecurso = json["nombreRecurso"] as? String ?? ""
        self.tipo = json["tipo"] as? String ?? ""
        self.ubicacion = json["ubicacion"] as? String ?? ""
        self.horarioInicio = json["horarioInicio"] as? String ?? ""
        self.horarioFinal = json["horarioFinal"] as? String ?? ""
    }
    
    
}

