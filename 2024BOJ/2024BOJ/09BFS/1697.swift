//
//  1697.swift
//  2024BOJ
//
//  Created by 김유빈 on 5/5/24.

//  [숨바꼭질] https://www.acmicpc.net/problem/1697
//  solve

func _1697() {
    let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
    let (n, k) = (input[0], input[1])
    
    var queue = [Int]()
    var visited = [Bool](repeating: false, count: 100001)
    var depth = [Int](repeating: 0, count: 100001)
    
    // 숨바꼭질 레쭈고
    /*
     1초 뒤 : x - 1 / x + 1 / x * 2
     
     현재 위치에서 이동할 수 있는 지점 전부 큐에 넣기.
     next 지점이 이미 방문했던 적이 있는지 판단. 방문했으면 넘어가.
     방문한 적 없으면 depth[node] + 1 해서 거리 계산하기.
     그리고 next가 0 ~ 100000 범위 안에 해당하는지도 판단하기.
     next가 k가 되면 빠져 나오기 ! ! ! 잡았으니까.
     */
    
    queue.append(n)
    
    while !queue.isEmpty {
        let node = queue.removeFirst()
        var next = 0
        
        if node == k { break }
        
        // for문 3번 돌면서 이동해주기
        for i in 0..<3 {
            if i == 0 {
                next = node + 1
            } else if i == 1 {
                next = node - 1
            } else if i == 2 {
                next = node * 2
            }
            
            if next < 0 || next > 100000 { continue }

            if !visited[next] {
                queue.append(next)
                visited[next] = true
                depth[next] = depth[node] + 1
            }
        }
    }
    
    print(depth[k])
}
