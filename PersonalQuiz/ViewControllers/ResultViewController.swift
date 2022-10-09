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
        identifyAnimal()
        navigationItem.hidesBackButton = true
    }
    
    private func identifyAnimal() {
        
        let animal: Animal!
        var animals: [Animal] = []
        var animalsDuplicates: [Animal] = []
        
        answers.forEach({ animals.append($0.animal) })
        
        for index1 in 0 ..< animals.count {
            for index2 in index1 + 1 ..< animals.count {
                if animals[index2] == animals[index1] {
                    animalsDuplicates.append(animals[index2])
                }
            }
        }
        
        animalsDuplicates.sort { $0.rawValue > $1.rawValue }
        animal = animalsDuplicates.first
        
        emojiLabel.text = "Вы - \(animal.rawValue)"
        animalLabel.text = animal.definition
    }

    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        navigationController?.dismiss(animated: true)
    }
    
}
