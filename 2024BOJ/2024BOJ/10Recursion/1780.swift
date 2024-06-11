//
//  1780.swift
//  2024BOJ
//
//  Created by 김유빈 on 6/4/24.

//  [종이의 개수] https://www.acmicpc.net/problem/1780
//  solve

func _1780() {
    let n = Int(readLine()!)!
    var graph: [[Int]] = []
    
    var result = [0, 0, 0] // -1, 0, 1
    
    for _ in 0..<n {
        graph.append(readLine()!.split(separator: " ").map{ Int(String($0))! })
    }
        
    // 9개로 잘라서 보는 걸 반복하믄 될 거 같은디.

    func recursion(y: Int, x: Int, n: Int) {
        /*
         1. 일단 전체 돌면서 -1, 0, 1 갯수 세기
            1. 만약, 한 숫자에 n*n만큼 카운팅 됐다. == 전부 같은 숫자로 되어 있다. == 하나의 종이로 본다.
            2. 그게 아니라면 Go Recursion.
                1. 3등분으로 쪼개서 보내주기.
         */
        var temp = [0, 0, 0]
        
        for y in y..<y + n {
            for x in x..<x + n {
                if graph[y][x] == -1 {
                    temp[0] += 1
                } else if graph[y][x] == 0 {
                    temp[1] += 1
                } else {
                    temp[2] += 1
                }
            }
        }
        
        for i in 0..<3 {
            if temp[i] == n * n {
                result[i] += 1
                return
            }
        }
        
        recursion(y: y, x: x, n: n / 3)
        recursion(y: y, x: x + n / 3, n: n / 3)
        recursion(y: y, x: x + 2 * n / 3, n: n / 3)
        
        recursion(y: y + n / 3, x: x, n: n / 3)
        recursion(y: y + n / 3, x: x + n / 3, n: n / 3)
        recursion(y: y + n / 3, x: x + n / 3 * 2, n: n / 3)
        
        recursion(y: y + n / 3 * 2, x: x, n: n / 3)
        recursion(y: y + n / 3 * 2, x: x + n / 3, n: n / 3)
        recursion(y: y + n / 3 * 2, x: x + n / 3 * 2, n: n / 3)
        
    }
    
    recursion(y: 0, x: 0, n: n)
    
    result.forEach { ans in
        print(ans)
    }
}
