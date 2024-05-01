//
//  1926.swift
//  2024BOJ
//
//  Created by 김유빈 on 4/23/24.
//  [그림] https://www.acmicpc.net/submit/1926/77547938


func _1926() {
    var nm: [Int] = readLine()!.split(separator: " ").map{ Int(String($0))! }
    var (height, width) = (nm[0], nm[1])
    
    var graph: [[Int]] = []
    var visited: [[Bool]] = .init(repeating: .init(repeating: false, count: width), count: height)
    
    for _ in 0..<height {
        graph.append(readLine()!.split(separator: " ").map{ Int(String($0))! })
    }
    
    var queue: [[Int]] = []
    
    // 상하좌우 이동
    let dx = [1, 0, -1, 0]
    let dy = [0, 1, 0, -1]
    
    // result
    var cnt = 0 // 그림 수
    var mx = 0 // 그림 최댓값
    
    for i in 0..<height {
        for j in 0..<width {
            
            // 그림 없거나 이미 방문했으면, 넘어가!
            if graph[i][j] == 0 || visited[i][j] { continue }
            
            // 그림 개수 추가
            cnt += 1
            
            // 방문 표시
            visited[i][j] = true
            
            // 큐에 현재 위치 추가
            queue.append([i, j])
            
            // 그림 넓이 체킹 시작
            var area = 0
            
            // 큐에 있다는 건 연결되어 있다는 뜻이겠쥐
            // 그래서 큐에 값이 있을 동안 while문 돌면서 그림 넓이 체킹
            while !queue.isEmpty {
                
                // 넓이 체크
                area += 1
                
                // 큐에 있는 다음 좌표 꺼내오기
                var next = queue.removeFirst()
                
                // 상하좌우 이동하면서 확인하기
                for k in 0..<4 {
                    var nx = next[0] + dx[k]
                    var ny = next[1] + dy[k]
                    
                    // 그래프 벗어나면 넘어가!
                    if nx < 0 || nx >= height || ny < 0 || ny >= width { continue }
                    
                    // 이미 방문했거나 그림이 아니면 넘어가!
                    if visited[nx][ny] || graph[nx][ny] != 1 { continue }
                    
                    // 방문 표시
                    visited[nx][ny] = true
                    
                    // 큐에 현재 위치 추가
                    queue.append([nx, ny])
                }
            }
            
            // 지금까지 젤 넓은 그림 넓이랑 현재 체킹한 그림 넓이 중에 max 값 찾기
            mx = max(mx, area)
        }
    }
    
    print(cnt)
    print(mx)
    
}
