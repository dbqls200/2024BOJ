//
//  1475.swift
//  2024BOJ
//
//  Created by 김유빈 on 4/3/24.
//

import Foundation

/*
 1. 필요한 숫자 카운팅해서 배열에 넣기
 2. 배열 max 값 찍기
 
 !! 6이랑 9는 어케 하지
 조건문 넣어줘야 할 거 같은디
 6이랑 9 중에 max 값 체크하고 큰 값 - 작은 값 하면 안 되나 ?
 -> (6 개수 + 9 개수 + 1) / 2로 계산해주면 필요한 6과 9 개수 나옴.
 */

func _1475() {
    let input = String(readLine()!)
    var result = Array(repeating: 0, count: 10)
    
    for s in input {
        result[Int(String(s))!] += 1
    }
    
    result[6] = (result[6] + result[9] + 1) / 2
    result[9] = result[6]
    
    print(result.max()!)
}

