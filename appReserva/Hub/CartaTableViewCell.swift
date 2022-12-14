//
//  CartaTableViewCell.swift
//  appReserva
//
//  Created by Mauricio Juárez on 05/10/22.
//

import UIKit

class CartaTableViewCell: UITableViewCell {
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var cardView: UIView!
    @IBOutlet var pictureView: UIImageView!
    @IBOutlet var cartaView: UIView!
    //Configuración de celda
    func configure(picture: UIImage, title: String){
        pictureView.backgroundColor = .clear
        pictureView.layer.cornerRadius = 12
        titleLabel.font = UIFont.boldSystemFont(ofSize: 25.0)
        pictureView.image = picture
        titleLabel.text = title
        //Edición de las tarjetas
        cardView.layer.shadowColor = UIColor.black.cgColor
        cardView.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        cardView.layer.shadowOpacity = 1.0
        cardView.layer.masksToBounds = false
        cardView.layer.cornerRadius = 10
        
        
    }
}
