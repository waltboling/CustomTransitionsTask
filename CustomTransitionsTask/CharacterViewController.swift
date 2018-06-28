//
//  ModalViewController.swift
//  CustomTransitionsTask
//
//  Created by Jon Boling on 6/27/18.
//  Copyright © 2018 Walt Boling. All rights reserved.
//

import UIKit

class CharacterViewController: UIViewController {

    @IBOutlet weak var characterImageView: UIImageView!
    @IBOutlet weak var characterName: UILabel!
    
    var image: UIImage?
    var passedCharacterName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

            }
    
    override func viewWillAppear(_ animated: Bool) {
        if let viewImage = image {
            layoutCharacterImages()
            characterImageView.contentMode = UIViewContentMode.scaleAspectFill //why is the image not filling the screen?
            characterImageView.image = viewImage
            self.characterName.text = passedCharacterName
        }
    }
    
    func layoutCharacterImages() {
        characterImageView.layoutIfNeeded()
        characterImageView.subviews.first?.contentMode = .scaleAspectFill
    }
    
    @IBAction func dismissWasTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
