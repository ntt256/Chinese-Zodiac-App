//
//  ViewController.swift
//  PP-ChineseZodiac
//
//  Created by Tay Yeu on 3/25/25.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var birthdateLabel: UILabel!
    @IBOutlet weak var birthdatePicker: UIDatePicker!
    @IBOutlet weak var goButton: UIButton!

    var zodiacLogic = ZodiacLogic()
    var zodiacSign: String?
    let dateFormatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        zodiacLogic.delegate = self
    }

    //when the user presses on the 'go' button
    @IBAction func goButton(_ sender: UIButton) {
        dateFormatter.dateFormat = "yyyy" //we only want the year
        
        sender.alpha = 0.5
        Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false) { timer in
            self.goButton.alpha = 1
        }
        
        let year = dateFormatter.string(from: birthdatePicker.date)
        zodiacLogic.calculateBirthYear(userBirthYear: Int(year) ?? 0)
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult"{
            let destinationViewController = segue.destination as! ResultViewController
            destinationViewController.zodiacSign = zodiacSign            
        }
    }
        
}

//MARK: - ZodiacDelegate
extension ViewController: ZodiacDelegate{ //if found an animal successfully
    func updateZodiacSign(_ animal: String) {
        zodiacSign = animal
    }
    
    func didFailWithError(error: any Error) { //if an error occured like user entered invalid birth year
        print(error)
    }
}

