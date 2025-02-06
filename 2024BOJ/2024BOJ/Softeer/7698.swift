//
//  File.swift
//  2024BOJ
//
//  Created by 김유빈 on 2/6/25.

//  [한양대 HCPC 2023] 7698 개표 https://softeer.ai/practice/7698
//  250206 solve

func softeer_7698() {
    // 1. 입력받기
    let t = Int(readLine()!)!
    var input: [Int] = []

    for _ in 0..<t {
        let temp = Int(readLine()!)!
        input.append(temp)
    }
    
    var result = ""

    // 2. 로직
    /*
    1)반복문 돌기
    2)규칙 찾기
    5번째마다 +로 바뀌니,
    받은 표를 5로 나눈 값 * "++++ "
    받은 표를 5로 나눈 나머지 * "|"
    */

    for cnt in input {
        result = ""
        
        let plus = cnt / 5
        let bar = cnt % 5

        result.append(String(repeating: "++++ ", count: plus))
        result.append(String(repeating: "|", count: bar))
        
        // 3. 출력하기
        print(result)
    }
}
