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
    var aula: String
    var tipo: String
    var description: String
    var horarioInicio: String
    var horarioFinal: String
    

    init(id: String, aula: String, tipo: String, description: String, horarioInicio: String, horarioFinal: String){
        self.id = id
        self.aula = aula
        self.tipo = tipo
        self.description = description
        self.horarioInicio = horarioInicio
        self.horarioFinal = horarioFinal
    }
    
    init (json: [String: Any]){
        self.id = json ["id"] as? String ?? ""
        self.aula = json["aula"] as? String ?? ""
        self.tipo = json["tipo"] as? String ?? ""
        self.description = json["description"] as? String ?? ""
        self.horarioInicio = json["horarioInicio"] as? String ?? ""
        self.horarioFinal = json["horarioFinal"] as? String ?? ""
    }
    
}
