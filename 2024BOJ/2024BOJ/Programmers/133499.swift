//
//  133499.swift
//  2024BOJ
//
//  Created by 김유빈 on 3/21/25.

//  133499 덧칠하기 https://school.programmers.co.kr/learn/courses/30/lessons/133499
//  250321 solve

func _161989(_ babbling:[String]) -> Int {
    let possibleWords = ["aya", "ye", "woo", "ma"]
    var tempArr: [String] = []
    
    var result = 0
    
    /*
     1. 네 가지 발음과 네 가지 발음을 조합해서 만든 단어만 가능
     2. 연속해서 같은 발음 안 됨
     */
    
    for word in babbling {
        tempArr.append(word.replacingOccurrences(of: possibleWords[0], with: "1")
            .replacingOccurrences(of: possibleWords[1], with: "2")
            .replacingOccurrences(of: possibleWords[2], with: "3")
            .replacingOccurrences(of: possibleWords[3], with: "4"))
    }
    
    
    for word in tempArr {
        if let isPossible = Int(word) {
            if !word.contains("11") && !word.contains("22") 
                && !word.contains("33") && !word.contains("44") {
                result += 1
            }
        }
    }
    
    return result
}
