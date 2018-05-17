//
//  QuestionViewController.swift
//  PersonalityQuiz
//
//  Created by Micah Grossman on 5/16/18.
//  Copyright © 2018 Micah Grossman. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {

	@IBOutlet weak var singleStackView: UIStackView!
	@IBOutlet weak var multipleStackView: UIStackView!
	@IBOutlet weak var rangedStackView: UIStackView!
	
    override func viewDidLoad() {
        super.viewDidLoad()

		updateUI()
    }

	func updateUI() {
		singleStackView.isHidden = true
		multipleStackView.isHidden = true
		rangedStackView.isHidden = true
		
		navigationItem.title = "Question #\(questionIndex+1)"
		
		let currentQuestion = questions[questionIndex]
		
		switch currentQuestion.type {
		case .single:
			singleStackView.isHidden = false
		case .multiple:
			multipleStackView.isHidden = false
		case .ranged:
			rangedStackView.isHidden = false
		}
	}
	
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	var questionIndex = 0

}
