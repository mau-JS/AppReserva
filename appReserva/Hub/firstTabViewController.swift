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
        layout.minimumLineSpacing = 2
        layout.minimumInteritemSpacing = 2
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
    //Función para cambiar el tamaño de las fotos
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (view.frame.self.size.width/2) - 4, height: (view.frame.self.size.width/2) - 4)
    }
    //Agregando efectos a las imágenes
    func collectionView(_ collectionView: UICollectionView, contextMenuConfigurationForItemAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {
        let config = UIContextMenuConfiguration(identifier: nil, previewProvider: nil) { _ in
            //Acciones a realizar
            
            let favorite = UIAction(
                title: "Favorite",
                subtitle: "Esta es una descripción",
                image: UIImage(systemName: "star"),
                identifier: nil,
                discoverabilityTitle: nil,
                attributes: .destructive,
                state: .off){ _ in
                print("tapped open")
            }
            
            let search = UIAction(
                title: "Search",
                subtitle: "Esta es una descripción",
                image: UIImage(systemName: "magnifyingglass"),
                identifier: nil,
                discoverabilityTitle: nil,
                attributes: .destructive,
                state: .off){ _ in
                print("tapped open")
            }
            let open = UIAction(
                title: "Abrir",
                subtitle: "Esta es una descripción",
                image: UIImage(systemName: "photo.tv"),
                identifier: nil,
                discoverabilityTitle: nil,
                attributes: .destructive,
                state: .off){ _ in
                print("tapped open")
            }
            
            
            
            return UIMenu(title: "Acciones", image: nil, identifier: nil, options: UIMenu.Options.displayInline, children: [open,favorite, search])
        }
        return config
    }
}

class ImageCollectionViewCell: UICollectionViewCell{
    static let identifier = "ImageCollectionViewCell"
    let imageView: UIImageView = {
       let imageView = UIImageView()
        //Ajusta a los bordes
        imageView.clipsToBounds = true
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


