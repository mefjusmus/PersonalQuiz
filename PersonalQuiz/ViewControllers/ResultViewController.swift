//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 06.10.2022.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet var emojiLabel: UILabel!
    @IBOutlet var animalLabel: UILabel!
    
    var answers: [Answer]!

    override func viewDidLoad() {
        super.viewDidLoad()
        getAnimal()
        navigationItem.hidesBackButton = true
    }
    
    private func getAnimal() {
        var animals: [Animal] = []
        
        for answer in answers {
            animals.append(answer.animal)
        }
        
        for index1 in 1 ..< animals.count {
            let index2 = index1 - 1
            if animals[index1] == animals[index2] {
                let animal = animals[index1]
                emojiLabel.text = "Вы - \(animal.rawValue)"
                animalLabel.text = animal.definition
            }
        }
    }

    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        navigationController?.dismiss(animated: true)
    }
    
}
