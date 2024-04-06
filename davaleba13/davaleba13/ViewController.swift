//
//  ViewController.swift
//  davaleba13
//
//  Created by Nini Bardavelidze on 05.04.24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var coffeeName: UILabel!
    @IBOutlet weak var ingridients: UITextField!
    @IBOutlet weak var rating: UILabel!
    @IBOutlet weak var peopleRating: UITextField!
    @IBOutlet weak var favorites: UIImageView!
    @IBOutlet weak var discriptiontext: UITextView!
    @IBOutlet weak var discriptionLabel: UILabel!
    @IBOutlet weak var smallSize: UIButton!
    @IBOutlet weak var sizeLabel: UILabel!
    @IBOutlet weak var mediumSize: UIButton!
    @IBOutlet weak var bigSize: UIButton!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var buyButton: UIButton!
    @IBOutlet weak var star: UIImageView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        image.layer.cornerRadius = 20
        image.clipsToBounds = true
        
    }
}
