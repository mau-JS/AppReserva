//
//  thirdTabViewController.swift
//  appReserva
//
//  Created by Mauricio Juárez on 19/10/22.
//

import UIKit
import Photos
import PhotosUI
import FirebaseCore
import FirebaseAuth
import FirebaseDatabase
import FirebaseFirestore
import FirebaseAnalytics
import ViewAnimator

class thirdTabViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let imageNames = Array(1...7).map {"exteriores\($0)"}
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 2
        layout.minimumInteritemSpacing = 4
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .systemBackground
//        collectionView.backgroundColor = UIColor.init(red: 204/255, green: 0/255, blue: 204/255, alpha: 0.1)
        collectionView.register(ImageCollectionViewCell3.self, forCellWithReuseIdentifier: ImageCollectionViewCell3.identifier)
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
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCollectionViewCell3.identifier, for: indexPath) as? ImageCollectionViewCell3 else{
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
            //MARK: - Acciones a realizar acorde al índice del objeto
            if indexPath.row == 0 {
                let open = UIAction(
                    title: "Entrada",
                    subtitle: "Aquí es donde mostramos una de las mejores pruebas",
                    image: UIImage(systemName: "photo.tv"),
                    identifier: nil,
                    discoverabilityTitle: nil,
                    attributes: .destructive,
                    state: .off){ _ in
                    print("tapped open")
                }
                return UIMenu(title: "Laboratorio de Ciberseguridad", image: nil, identifier: nil, options: UIMenu.Options.displayInline, children: [open])
            }
            else{
                let open = UIAction(
                    title: "Salida",
                    subtitle: "Aquí es donde mostramos una de las mejores pruebas",
                    image: UIImage(systemName: "photo.tv"),
                    identifier: nil,
                    discoverabilityTitle: nil,
                    attributes: .destructive,
                    state: .off){ _ in
                    print("tapped open")
                }
                return UIMenu(title: "Laboratorio de Ciberseguridad", image: nil, identifier: nil, options: UIMenu.Options.displayInline, children: [open])            }
            
            
            
            
            
        }
        return config
    }
}

class ImageCollectionViewCell3: UICollectionViewCell{
    static let identifier = "ImageCollectionViewCell3"
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
    //MARK: - Aquí editamos cada una de las fotos
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.layer.cornerRadius = 12
        imageView.frame = contentView.bounds
        
//        imageView.layer.borderWidth = 2
//        imageView.layer.borderColor = .init(red: 244, green: 0, blue: 244, alpha: 0.1)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
    }
}
