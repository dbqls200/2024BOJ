//
//  SampleTest.swift
//  2024BOJ
//
//  Created by 김유빈 on 2/6/25.

//  sampleTest
//  250206 solve

/*
 #input
 Hyundai-Motor-Group
 
 #output
 HMG
 */

func sampleTest() {
    // 1. 입력 받기
    let fullName = readLine()!
    var isAvailable = true
    var result = ""

    // 2. 로직
    /*
    1. 약자로 뽑아낼 수 있는 구간 파악하기
    - 제일 처음
    - 대시 다음에 등장하는 문자

    2. 약자로 뽑아낼 수 있는 문자인지 불값으로 판단
    */
    for str in fullName {
        if isAvailable == true {
            result.append(str)
            isAvailable = false
        }
            
        if str == "-" {
            isAvailable = true
        }
    }

    // 3. 출력하기
    print(result)
}
