//
//  181886.swift
//  2024BOJ
//
//  Created by 김유빈 on 3/18/25.
//

//  181886 5명씩 https://school.programmers.co.kr/learn/courses/30/lessons/181886
//  250318 solve

func _181886(_ names:[String]) -> [String] {
    return names.enumerated().compactMap { index, name in
        index.isMultiple(of: 5) ? name : nil
    }
}

/*
 isMultiple(of:) 함수에 대해 새로 알았다!
 
 isMultiple(of:)
 숫자가 특정 값의 배수인지 확인하는 메서드.
 반환값은 Bool 타입.
 
 기존에는 나머지 연산자 사용해서 배수 판별했는데, isMultiple(of:) 함수만의 장점도 많다.
 1. 가독성 굿
 3. 나머지 연산자보다 안전하고 직관적
 2. 오버플로우 방지 -> Int.min % -1 하면, 런타임 오류 발생하는데 isMultiple(of:)는 안전하게 동작
 */
