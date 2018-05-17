//
//  QuestionData.swift
//  PersonalityQuiz
//
//  Created by Micah Grossman on 5/16/18.
//  Copyright © 2018 Micah Grossman. All rights reserved.
//

import Foundation

struct Question {
	var text: String
	var type: ResponseType
	var answers: [Answer]
}

struct Answer {
	var text: String
	var type: AnimalType
}

enum ResponseType {
	case single, multiple, ranged
}

enum AnimalType: Character {
	case dog = "🐶", cat = "🐱", rabbit = "🐰", turtle = "🐢"
	
	var definition: String {
		switch self {
		case .dog:
			return "You are the top of the social pyramid. All other species bow before you."
		case .cat:
			return "Usually sleeping, often abbrasive, your continued existence is questionable."
		case .rabbit:
			return "You're one goofball of happiness and energy."
		case .turtle:
			return "You let life come to you, on your time table."
		}
	}
}

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
