//
//  ViewController.swift
//  CardSliderView
//
//  Created by Ripon sk on 07/10/22.
//

import UIKit
import CardSlider
struct Item:CardSliderItem{
    
    var image: UIImage
    
    var rating: Int?
    
    var title: String
    
    var subtitle: String?
    
    var description: String?
    init(image: UIImage, rating: Int? = nil, title: String, subtitle: String? = nil, description: String? = nil) {
        self.image = image
        self.rating = rating
        self.title = title
        self.subtitle = subtitle
        self.description = description
    }
    
}
class ViewController: UIViewController {
var arritem = [Item]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 1...8{
            arritem.append(Item(image: UIImage(named: "n\(i)")!, title: "nature\(i)"))

        }
        // Do any additional setup after loading the view.
    }

    @IBAction func sliderview(_ sender: Any) {
        let vc = CardSliderViewController.with(dataSource: self)
        vc.dataSource = self
        vc.title = "welcome"
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
       
    }
    
}

extension ViewController:CardSliderDataSource{
    func item(for index: Int) -> CardSlider.CardSliderItem {
        return arritem[index]
    }
    
    func numberOfItems() -> Int {
        arritem.count
    }
    
}
