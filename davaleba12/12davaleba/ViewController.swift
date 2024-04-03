//
//  ViewController.swift
//  12davaleba
//
//  Created by Nini Bardavelidze on 03.04.24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var Switch: UISwitch!
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var firstText: UITextField!
    @IBOutlet weak var secondText: UITextField!
    @IBOutlet weak var Button: UIButton!
    @IBOutlet weak var answer: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    @IBAction func actionOfSwitch(_ sender: Any) {
        if Switch.isOn {
                    mainLabel.text = "უდიდესი საერთო გამყოფი"
                } else {
                    mainLabel.text = "უმცირესი საერთო ჯერადი"
                }
    }
    
    @IBAction func actionOfButton(_ sender: Any) {
        guard let first = Int(firstText.text ?? ""),
                      let second = Int(secondText.text ?? "") else {
                    return
                }
                
                if Switch.isOn {
                    let result2 = usg(first, second)
                    answer.text = "\(result2)"
                } else if !Switch.isOn {
                    let result = usj(first, second)
                    answer.text = "\(result)"
                }
    }
    func usj(_ usj1: Int, _ usj2: Int) -> Int {
          return (usj1 * usj2) / usg(usj1, usj2)
      }
      
      func usg(_ number1: Int, _ number2: Int) -> Int {
          var firstNumber = number1
          var secondNumber = number2
          while secondNumber != 0 {
              let temp = secondNumber
              secondNumber = firstNumber % secondNumber
              firstNumber = temp
          }
          return firstNumber
      }
  }


