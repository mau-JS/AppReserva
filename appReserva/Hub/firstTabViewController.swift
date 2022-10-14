//
//  firstTabViewController.swift
//  appReserva
//
//  Created by Mauricio Juárez on 05/10/22.
//

import UIKit
import Photos
import PhotosUI
import FirebaseCore
import FirebaseAuth
import FirebaseDatabase
import FirebaseFirestore
import FirebaseAnalytics



class firstTabViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    @IBOutlet var botonSalida: UIButton!
    
    let imageNames = Array(1...6).map {"image\($0)"}
    
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .systemBackground
        collectionView.register(ImageCollectionViewCell.self, forCellWithReuseIdentifier: ImageCollectionViewCell.identifier)
        return collectionView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
      
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = view.bounds
    }
    
   
    
    
    
    
   

    
    @IBAction func presionaBoton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageNames.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCollectionViewCell.identifier, for: indexPath) as? ImageCollectionViewCell else{
            fatalError()
        }
        cell.imageView.image = UIImage(named: imageNames[indexPath.row])
        return cell
    }
    
}

class ImageCollectionViewCell: UICollectionViewCell{
    static let identifier = "ImageCollectionViewCell"
    let imageView: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    override init (frame: CGRect){
        super.init(frame: frame)
        contentView.addSubview(imageView)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = contentView.bounds
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
    }
}


