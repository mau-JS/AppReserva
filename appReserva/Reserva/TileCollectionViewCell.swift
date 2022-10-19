//
//  TileCollectionViewCell.swift
//  appReserva
//
//  Created by Mauricio Juárez on 18/10/22.
//

import UIKit

struct TileCollectionViewCellViewModel{
    let name: String
    let backgroundColor: UIColor
}

class TileCollectionViewCell: UICollectionViewCell {
    static let identifier = "TileCollectionViewCell"
    private let label: UILabel = {
       let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20, weight: .medium)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        return label
    }()
    override init(frame: CGRect){
        super.init(frame: frame)
        contentView.addSubview(label)
        contentView.layer.cornerRadius = 20
        contentView.layer.borderWidth = 4
        contentView.layer.borderColor = UIColor.quaternaryLabel.cgColor
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = contentView.bounds
    }
    
    func configure(with viewModel: TileCollectionViewCellViewModel){
        contentView.backgroundColor = viewModel.backgroundColor
        label.text = viewModel.name
    }
}
