//
//  TileCollectionViewCell.swift
//  appReserva
//
//  Created by Mauricio Juárez on 18/10/22.
//

import UIKit

class TileCollectionViewCell: UICollectionViewCell {
    static let identifier = "TileCollectionViewCell"
    
    override init(frame: CGRect){
        super.init(frame: frame)
        contentView.backgroundColor = .systemBlue
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
}
