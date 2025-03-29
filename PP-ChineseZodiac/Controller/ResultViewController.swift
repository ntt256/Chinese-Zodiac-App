//
//  ResultViewController.swift
//  PP-ChineseZodiac
//
//  Created by Tay Yeu on 3/28/25.
//

import UIKit

class ResultViewController: UIViewController {
    @IBOutlet weak var zodiacImageView: UIImageView!
    @IBOutlet weak var zodiacLabel: UILabel!
    
    var zodiacSign: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        zodiacLabel.text = zodiacSign ?? ""
        zodiacImageView.image = UIImage(named: zodiacSign?.lowercased() ?? "")
        zodiacImageView.layer.cornerRadius = 10
    }

    @IBAction func okButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
