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

