//
//  ReservaTableViewCell.swift
//  appReserva
//
//  Created by Mauricio Juárez on 25/09/22.
//

import UIKit

class ReservaTableViewCell: UITableViewCell {
    //Outlet de cada una de las etiquetas
    @IBOutlet var AulaLabel: UILabel!
    @IBOutlet var DescripcionLabel: UILabel!
    @IBOutlet var HorarioLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    // En esta función, tenemos los valores a imprimir en cada celda
    func update(with reserva: Reservas){
        AulaLabel.text = reserva.nombreRecurso
        DescripcionLabel.text = "tipo: " + reserva.tipo + "     " + "Ubicación: " + reserva.ubicacion
        HorarioLabel.text = "Inicio: " + reserva.horarioInicio + "      Termina el: " + reserva.horarioFinal
        //HorarioLabel.text = "Inicio: " + String(reserva.dia) + "/" + String(reserva.mes) + "/" + String(reserva.anio) + "    Final: " + String(reserva.diaFinal) + "/" + String(reserva.mesFinal) + "/" + String(reserva.anioFinal)
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
