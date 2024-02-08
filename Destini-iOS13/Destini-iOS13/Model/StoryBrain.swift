//
//  StoryBrain.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

struct StoryBrain {
    let stories = [
        Story(
            text: "Your car has blown a tire on a winding road in the middle of nowhere with no cell phone reception. You decide to hitchhike. A rusty pickup truck rumbles to a stop next to you. A man with a wide-brimmed hat and soulless   eyes opens the passenger door for you and says: 'Need a ride, boy?'",
            choice1: "I'll hop in. Thanks for the help!",
            choice2: "Well, I don't have many options. Better ask him if he's a murderer.",
            destination: ""),
        //o destination esta com uma string vazia pois sao as choices que decidiram qual destino as perguntas vao seguir, se e 1 ou 2
        
        Story(
            text: "As you begin to drive, the stranger starts talking about his relationship with his mother. He gets angrier and angrier   by the minute. He asks you to open the glove box. Inside you find a bloody knife, two severed fingers, and a cassette tape   of Elton John. He  eaches for the glove box.",
            choice1: "I love Elton John! Hand him the cassette tape.",
            choice2: "It’s him or me. Take the knife and stab him.",
            destination: "destiny 1"),
        
        Story(
            text: "He nods slowly, unphased by the question.",
            choice1: "At least he's honest. I'll climb in.",
            choice2: "Wait, I know how to change a tire.",
            destination: "destiny 2"),
        
        Story(text: "You bond with the murderer while crooning verses of 'Can you feel the love tonight'. He drops you off at the next   town. Before you go he asks you if you know any good places to dump bodies. You reply: 'Try the pier.'",
              choice1: "I know you know what happened",
              choice2: "I know you know what happened",
              destination: "destiny 1"),
        
        Story(text: "You bond with the murderer while crooning verses of 'Can you feel the love tonight'. He drops you off at the next   town. Before you go he asks you if you know any good places to dump bodies. You reply: 'Try the pier.'",
              choice1: "I know you know what happened",
              choice2: "I know you know what happened",
              destination: "destiny 2"),
        
        Story(
            text: "As you smash through the guardrail and careen towards the jagged rocks below you reflect on the dubious wisdom of   stabbing someone while they are driving a car you are in.",
            choice1: "I know you know what happened",
            choice2: "I know you know what happened",
            destination: "destiny 1"),
        
        Story(text: "What? Such a cop-out! Did you know accidental traffic accidents are the second leading cause of accidental death for most adult age groups?",
              choice1: "Maybe alive",
              choice2: "Maybe alive",
              destination: "destiny 2"),
    ]
    
    var storyNumber = 0
    
    func sendTextDestination() -> Story {
        return stories[storyNumber]
    }
    
    func sendTextChoice1() -> Story {
        return stories[storyNumber]
    }
    
    func sendTextChoice2() -> Story {
        return stories[storyNumber]
    }
    
    mutating func changeDestiny(_ madedChoice: String) {
     //esse if e para identificar a primeira escolha e dar a direcao por qual escolhas o usuario vai seguir
        if storyNumber == 0 || madedChoice == stories[storyNumber].choice1 {
            storyNumber += 1
            print(storyNumber)
        } else if storyNumber == 0 || madedChoice == stories[storyNumber].choice2 {
            storyNumber += 2
        }
    }
    
    mutating func changeText(_ madedChoice: String) {
    /*esse if e para continuar pela historia apos a primeira escolha do usuario, porem ele tambem zera o
     contador storynumber caso este passe de um numero maior que o array, pois daria um erro de out of index*/
        if storyNumber + 1 < stories.count {
            if storyNumber != 0 || madedChoice == stories[storyNumber].choice1 {
                storyNumber += 1
            } else {
                storyNumber += 2
            }
        } else {
            storyNumber = 0 
        }
    }
}


