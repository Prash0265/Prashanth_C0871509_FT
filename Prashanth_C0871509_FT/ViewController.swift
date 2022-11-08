//
//  ViewController.swift
//  Prashanth_C0871509_FT
//
//  Created by Others on 2022-11-07.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var CorrectIncorrect: UIImageView!
    @IBOutlet weak var randomNumber: UILabel!
    @IBOutlet weak var Even: UILabel!
    @IBOutlet weak var Odd: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupEvenLabelTap()
        self.setupOddLabelTap()
        self.setRandomvalue()
    }
    private func setRandomvalue(){
        
        let randomInt = Int.random(in: 1..<100)
        randomNumber.text = "\(randomInt)"
    }
    
    func isEven(_ n: Int) -> Bool {
        if n%2 == 0{
            return true
        }
        else
        {
            return false
        }
    }
    
    func setupEvenLabelTap() {
        
        let labelTap = UITapGestureRecognizer(target: self, action: #selector(self.EvenLabelTapped(_:)))
        self.Even.isUserInteractionEnabled = true
        self.Even.addGestureRecognizer(labelTap)
        
        
    }
    func setupOddLabelTap() {

        let labelTap = UITapGestureRecognizer(target: self, action: #selector(self.OddLabelTapped(_:)))
        self.Odd.isUserInteractionEnabled = true
        self.Odd.addGestureRecognizer(labelTap)

    }
    
    @objc func EvenLabelTapped(_ sender: UITapGestureRecognizer) {
      let currentNumber = Int(randomNumber.text!)
      if isEven(currentNumber!){
           CorrectIncorrect.image = UIImage(named: "Correct")
          setRandomvalue()
          let infoAlert = UIAlertController(title: "Result", message: "Correct answer", preferredStyle: .alert)
          infoAlert.addAction(UIAlertAction(title: "Play again!", style: .default, handler: nil))
          infoAlert.addAction(UIAlertAction(title: "Show progress", style: .default, handler: {_ in self.displayHomeVC()}))
          self.present(infoAlert, animated: true)
      }else{
          CorrectIncorrect.image = UIImage(named: "InCorrect")
          setRandomvalue()
          let infoAlert = UIAlertController(title: "Result", message: "Incorrect answer", preferredStyle: .alert)
          infoAlert.addAction(UIAlertAction(title: "Play again!", style: .default, handler: nil))
          infoAlert.addAction(UIAlertAction(title: "Show progress", style: .default, handler: {_ in self.displayHomeVC()}))
          self.present(infoAlert, animated: true)

          
      }

        }
    @objc func OddLabelTapped(_ sender: UITapGestureRecognizer) {
        
        let currentNumber = Int(randomNumber.text!)
        if isEven(currentNumber!){
            CorrectIncorrect.image = UIImage(named: "InCorrect")
            setRandomvalue()
            let infoAlert = UIAlertController(title: "Result", message: "Incorrect answer", preferredStyle: .alert)
            infoAlert.addAction(UIAlertAction(title: "Play again!", style: .default, handler: nil))
            infoAlert.addAction(UIAlertAction(title: "Show progress", style: .default, handler: {_ in self.displayHomeVC()}))
            self.present(infoAlert, animated: true)
        }else{
            CorrectIncorrect.image = UIImage(named: "Correct")
            setRandomvalue()
            let infoAlert = UIAlertController(title: "Result", message: "Correct answer", preferredStyle: .alert)
            infoAlert.addAction(UIAlertAction(title: "Play again!", style: .default, handler: nil))
            infoAlert.addAction(UIAlertAction(title: "Show progress", style: .default, handler: {_ in self.displayHomeVC()}))
            self.present(infoAlert, animated: true)
        }
        
    }
    
    func displayHomeVC(){
            let mainSB : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let homeVC = mainSB.instantiateViewController(withIdentifier: "HomeTVScene")
            navigationController?.pushViewController(homeVC, animated: true)
        }
    
    }
    


