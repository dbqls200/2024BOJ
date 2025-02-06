//
//  9498.swift
//  2024BOJ
//
//  Created by 김유빈 on 2/7/25.

//  [Softeer] 9498 Yeah, but How? https://softeer.ai/practice/9498
//  [BOJ] 30884 Yeah, but How? https://www.acmicpc.net/problem/30884
//  250207 solve

/*
 #input
 (()())
 
 #output
 ((1)+(1))
 */

import Foundation // 필수. replacingOccurrences 메서드 사용하려면 필요함.

func softeer9498() {
    // 1. 입력받기
    let input = String(readLine()!)
    var result = ""

    // 2. 로직
    /*
    이미 올바른 괄호가 입력으로 들어오니 체크할 필요 x
    가능한 수식 아무거나 출력하면 되니 규칙 찾기

    1. () 사이에 1 넣기
    2. )( 사이에 + 넣기

    어떻게 구현할 것인가 ..
    ()인 부분을 (1)로 대체 ?
    )(인 부분을 )+(로 대체 ?
    */

    result = input.replacingOccurrences(of: "()", with: "(1)")
    result = result.replacingOccurrences(of: ")(", with: ")+(")
    
    // 3. 출력하기
    print(result)
}
