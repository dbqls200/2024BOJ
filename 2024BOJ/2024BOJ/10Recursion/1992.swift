//
//  1992.swift
//  2024BOJ
//
//  Created by 김유빈 on 6/12/24.

//  [쿼드트리] https://www.acmicpc.net/problem/1992
//  solve

func _1992() {
    let n = Int(readLine()!)!
    var graph: [[Int]] = []
    
    var result = ""
    
    for _ in 0..<n {
        // 띄어쓰기 없는 정수 입력 받기
        graph.append(readLine()!.map{ Int(String($0))! })
    }

    /*
     4등분하기.
     */
    
    func recursion(y: Int, x: Int, n: Int) {
        var temp = [0, 0]
        var tmp = ""
        
        /*
         0과 1 갯수 카운팅
            둘 중 한 숫자 카운팅이 n*n이면 answer에 한 번 추가하고 넘어가기
            아니면, go recursion
         
         괄호는 recursion 시작할 때 열어주고 끝날 때 닫아주기
         */
        
        for y in y..<y+n {
            for x in x..<x+n {
                if graph[y][x] == 0 {
                    tmp += String(0)
                    temp[0] += 1
                } else {
                    tmp += String(1)
                    temp[1] += 1
                }
            }
        }
        
        for i in 0..<temp.count {
            if temp[i] == n * n {
                result += String(i)
                return
            }
        }
        
        result += "("
        
        recursion(y: y, x: x, n: n / 2)
        recursion(y: y, x: x + n / 2, n: n / 2)
        
        recursion(y: y + n / 2, x: x, n: n / 2)
        recursion(y: y + n / 2, x: x + n / 2, n: n / 2)
        
        result += ")"
    }

    recursion(y: 0, x: 0, n: n)
    
    print(result)
}

/*
8
11110000
11110000
00011100
00011100
11110000
11110000
11110011
11110011
-
((110(0101))(0010)1(0001))
*/
