//
//  2577.swift
//  2024BOJ
//
//  Created by 김유빈 on 4/3/24.
//

impimport Foundation

/*
 1. line 단위로 값 받기
 2. 입력 받은 숫자 곱하기
 3. 각 숫자마다 개수 세기
 4. 화면에 찍기
 */


// 첫 번째 방법. 숫자에 해당하는 인덱스로 접근해서 배열에 개수 저장
func _2577() {
    let A = Int(readLine()!)!
    let B = Int(readLine()!)!
    let C = Int(readLine()!)!

    let multi = String(A * B * C)

    var result = Array(repeating: 0, count: 10)

    for i in multi {
        result[Int(String(i))!] += 1
    }

//    for i in result {
//        print(i)
//    }
    
    print(result.map({ String($0) }).joined(separator: "\n"))
}


// 두 번째 방법. 10으로 나눈 나머지로 숫자 개수 세기
func _2577_2() {
    let A = Int(readLine()!)!
    let B = Int(readLine()!)!
    let C = Int(readLine()!)!

    var multi = A * B * C

    var result = Array(repeating: 0, count: 10)
    
    while (multi > 0) {
        result[multi % 10] += 1
        multi = multi / 10
    }

    print(result.map({ String($0) }).joined(separator: "\n"))
}
