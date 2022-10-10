//
//  firstTabViewController.swift
//  appReserva
//
//  Created by Mauricio Juárez on 05/10/22.
//

import UIKit
import iCarousel


class firstTabViewController: UIViewController, iCarouselDataSource {
    
    let myCarousel: iCarousel = {
        let view = iCarousel()
        view.type = .linear
        return view
    }()
    @IBOutlet var regresoHub: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(myCarousel)
        myCarousel.dataSource = self
        //myCarousel.autoscroll = -0.5
        myCarousel.frame = CGRect(x: 0, y: 200, width: view.frame.size.width, height: 400)
        
    }
    func numberOfItems(in carousel: iCarousel) -> Int {
        return 5
    }
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 300))
        //view.backgroundColor = .red
        let imageView = UIImageView(frame: view.bounds)
        view.addSubview(imageView)
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "labCiberseguridad\(index + 1)")
        return view
    }
    @IBAction func presionaRegresoHub(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
