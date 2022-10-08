//
//  Carta2TableViewCell.swift
//  appReserva
//
//  Created by Mauricio Juárez on 07/10/22.
//

import UIKit

class Carta2TableViewCell: UITableViewCell {
    
    static let identifier = "MyTableViewCell"
    
    @IBOutlet var myLabel: UILabel!
    @IBOutlet var myImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
