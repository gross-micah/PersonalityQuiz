//
//  QuestionViewController.swift
//  PersonalityQuiz
//
//  Created by Micah Grossman on 5/16/18.
//  Copyright © 2018 Micah Grossman. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
	
	@IBOutlet weak var questionLabel: UILabel!
	
	@IBOutlet weak var singleStackView: UIStackView!
	@IBOutlet weak var singleButton1: UIButton!
	@IBOutlet weak var singleButton2: UIButton!
	@IBOutlet weak var singleButton3: UIButton!
	@IBOutlet weak var singleButton4: UIButton!
	
	@IBOutlet weak var multipleStackView: UIStackView!
	@IBOutlet weak var multiLabel1: UILabel!
	@IBOutlet weak var multiLabel2: UILabel!
	@IBOutlet weak var multiLabel3: UILabel!
	@IBOutlet weak var multiLabel4: UILabel!
	
	@IBOutlet weak var rangedStackView: UIStackView!
	@IBOutlet weak var rangedLabel1: UILabel!
	@IBOutlet weak var rangedLabel2: UILabel!
	
	@IBOutlet weak var questionProgressView: UIProgressView!
	
	var questionIndex = 0
	
	var questions: [Question] = [
		Question(text: "Which food do you like the most?",
				 type: .single,
				 answers:[
					Answer(text: "Dumplings", type: .dog),
					Answer(text: "Seafood", type: .cat),
					Answer(text: "Vegetarian", type: .rabbit),
					Answer(text: "Tofu", type: .turtle)
			]),
		Question(text: "Which activities do you like to do?",
				 type: .multiple,
				 answers: [
					Answer(text: "Sleeping", type: .cat),
					Answer(text: "Swimming", type: .turtle),
					Answer(text: "Hopping", type: .rabbit),
					Answer(text: "Eating", type: .dog)
			]),
		Question(text: "How much do you enjoy car rides?",
				 type: .ranged,
				 answers: [
					Answer(text: "Don't you dare put me in one", type: .cat),
					Answer(text: "I get anxious, but remain optimistic", type: .rabbit),
					Answer(text: "They don't bother me at all", type: .turtle),
					Answer(text: "Oh boy, oh boy, oh boy!", type: .dog)
			])
	]
	
    override func viewDidLoad() {
        super.viewDidLoad()

		updateUI()
    }

	func updateUI() {
		singleStackView.isHidden = true
		multipleStackView.isHidden = true
		rangedStackView.isHidden = true
		
		let currentQuestion = questions[questionIndex]
		let currentAnswers = currentQuestion.answers
		let totalProgress = Float(questionIndex) / Float(questions.count)
		
		navigationItem.title = "Question #\(questionIndex+1)"
		questionLabel.text = currentQuestion.text
		questionProgressView.setProgress(totalProgress, animated: true)
		
		switch currentQuestion.type {
		case .single:
			updateSingleStack(using: currentAnswers)
		case .multiple:
			updateMultipleStack(using: currentAnswers)
		case .ranged:
			updateRangedStack(using: currentAnswers)
		}
	}
	
	func updateSingleStack(using answers: [Answer]) {
		singleStackView.isHidden = false
		singleButton1.setTitle(answers[0].text, for: .normal)
		singleButton2.setTitle(answers[1].text, for: .normal)
		singleButton3.setTitle(answers[2].text, for: .normal)
		singleButton4.setTitle(answers[3].text, for: .normal)
	}
	
	func updateMultipleStack(using answers: [Answer]) {
		multipleStackView.isHidden = false
		multiLabel1.text = answers[0].text
		multiLabel2.text = answers[1].text
		multiLabel3.text = answers[2].text
		multiLabel4.text = answers[3].text
	}
	
	func updateRangedStack(using answers: [Answer]) {
		rangedStackView.isHidden = false
		rangedLabel1.text = answers.first?.text
		rangedLabel2.text = answers.last?.text
	}
	
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
