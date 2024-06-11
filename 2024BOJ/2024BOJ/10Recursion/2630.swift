//
//  2630.swift
//  2024BOJ
//
//  Created by 김유빈 on 6/12/24.

//  [색종이 만들기] https://www.acmicpc.net/problem/2630

func _2630() {
    let n = Int(readLine()!)!
    
    var result = [0, 0]
    var graph: [[Int]] = []
    
    for _ in 0..<n {
        graph.append(readLine()!.split(separator: " ").map{ Int(String($0))! })
    }
    
    /*
     1780 종이의 개수 문제랑 비섯하네.
     얘는 3등분 말고 2등분하기.
     
     1. 일단 0과 1 갯수를 센다.
        1. 한 숫자의 카운팅이 n*n이라면 == 전부 같은 수로 구성 == 하나의 종이로 인식.
        2. 아니라면 Go Recursion
            1. 2등분으로 쪼개서 돌리기
     
     */
    
    func recursion(y: Int, x: Int, n: Int) {
        var temp = [0, 0]
        
        for y in y..<y+n {
            for x in x..<x+n {
                if graph[y][x] == 0 {
                    temp[0] += 1
                } else {
                    temp[1] += 1
                }
            }
        }
        
        for i in 0..<2 {
            if temp[i] == n * n {
                result[i] += 1
                return
            }
        }
        
        recursion(y: y, x: x, n: n / 2)
        recursion(y: y, x: x + n / 2, n: n / 2)
        
        recursion(y: y + n / 2, x: x, n: n / 2)
        recursion(y: y + n / 2, x: x + n / 2, n: n / 2)


    }
    
    recursion(y: 0, x: 0, n: n)
    
    // 출력
    // 하얀색 = 0
    // 파란색 = 1
    result.forEach{ print($0) }
}


