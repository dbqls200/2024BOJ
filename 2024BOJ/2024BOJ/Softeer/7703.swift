//
//  7703.swift
//  2024BOJ
//
//  Created by 김유빈 on 2/7/25.

//  [Softeer] 7703 [한양대 HCPC 2023] X marks the Spot https://softeer.ai/practice/7703
//  [BOJ] 30877 X marks the Spot https://www.acmicpc.net/problem/30877
//  250207 solve

import Foundation

/*
 #input
 8
 Exit A1in
 Axis A0on
 Exam Star
 WKXM XHHV
 maxB pyht
 XBut Club
 ATax Keep
 ifXY doC2
 
 #output
 10THHCPC
*/

func softeer7703() {
    // 1. 입력받기
    let n = Int(readLine()!)!
    var input = [String]()

    var result = ""

    var xSpot: String.Index
    
    // 2. 로직
    /*
    앞 단어에서 x, X가 있는 인덱스 파악하기
    인덱스에 해당하는 글자를 뒷 단어에서 찾기
    (소문자 -> 대문자)
    */

    for _ in 0..<n {
        let temp = readLine()!.split(separator: " ")
        let (s, p) = (temp[0], temp[1])
        
        for (index, char) in s.enumerated() {
            if char == "x" || char == "X" {
                xSpot = p.index(p.startIndex, offsetBy: index)
                result.append(p[xSpot].uppercased())
                break
            }
        }
    }

    // 3. 출력하기
    print(result)
}
