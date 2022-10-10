//
//  secondTabViewController.swift
//  appReserva
//
//  Created by Mauricio Juárez on 09/10/22.
//

import UIKit
import iCarousel
class secondTabViewController: UIViewController, iCarouselDataSource{
    let myCarousel: iCarousel = {
        let view = iCarousel()
        view.type = .linear
        return view
    }()
    @IBOutlet var volverButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(myCarousel)
        myCarousel.dataSource = self
        //myCarousel.autoscroll = -0.5
        myCarousel.frame = CGRect(x: 0, y: 200, width: view.frame.size.width, height: 400)
    }
    func numberOfItems(in carousel: iCarousel) -> Int {
        return 4
    }
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 300))
        //view.backgroundColor = .red
        let imageView = UIImageView(frame: view.bounds)
        view.addSubview(imageView)
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "labIoT\(index + 1)")
        return view
    }
    @IBAction func presionaboton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}

