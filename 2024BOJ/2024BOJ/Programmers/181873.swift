//
//  181873.swift
//  2024BOJ
//
//  Created by 김유빈 on 3/17/25.
//

//  181873 특정한 문자를 대문자로 바꾸기 https://school.programmers.co.kr/learn/courses/30/lessons/181873?language=swift
//  250317 solve

func solution(_ my_string:String, _ alp:String) -> String {
    return my_string.replacingOccurrences(of: alp, with: alp.uppercased())
}
