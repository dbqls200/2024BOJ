//
//  181844.swift
//  2024BOJ
//
//  Created by 김유빈 on 3/20/25.
//

//  181844 배열의 원소 삭제하기 https://school.programmers.co.kr/learn/courses/30/lessons/181844?language=swift
//  250320 solve

func _181844(_ arr:[Int], _ delete_list:[Int]) -> [Int] {
    return arr.filter { !delete_list.contains($0) }
}
