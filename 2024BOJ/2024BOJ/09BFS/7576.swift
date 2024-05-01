//
//  7576.swift
//  2024BOJ
//
//  Created by 김유빈 on 4/29/24.
//  [토마토] https://www.acmicpc.net/problem/7576

// 효율적인 큐 짜기
struct Queue {
    private var queue: [[Int]?] = []
    private var head = 0
    
    public var count: Int {
        return queue.count
    }
    
    public mutating func enqueue(_ x: Int, _ y: Int) {
        queue.append([x, y])
    }
    
    public mutating func dequeue() -> [Int]? {
        guard head < queue.count, let first = queue[head] else { return nil }
        queue[head] = nil
        head += 1
        
        return first
    }
    
    func isEmpty() -> Bool {
        queue.isEmpty
    }
    
//    var isEmpty: Bool {
//        queue.isEmpty
//    }
}


func _7576() {
    let nm: [Int] = readLine()!.split(separator: " ").map{ Int(String($0))! }
    let (width, height) = (nm[0], nm[1])
    
    var graph: [[Int]] = []
    for _ in 0..<height {
        graph.append(readLine()!.split(separator: " ").map{ Int(String($0))! })
    }
    var result = 1 // 토마토 익는 최소 일수
    
    let dx = [1, 0, -1, 0]
    let dy = [0, 1, 0, -1]
    
    var queue = Queue()
    
    var isDone = true
    
    /*
     어케 푸냐
     1. 이중 for문 돌면서 1인 지점 찾기 -> 큐에 저저ㅏㅇ
     2. 큐에 있는 애들 돌면서 상하좌우 이동쓰
     3. 마지막 graph에 0 있는지 확인하고 있으면 -1 출력, 아니면 최대값 출력.
    */
    
    // 이중 for문 돌면서 1인 지점 찾기 -> 큐에 저저ㅏㅇ
    for i in 0..<height {
        for j in 0..<width {
            if graph[i][j] == 1 {
                queue.enqueue(i, j)
            }
        }
    }
        
    // 큐에 있는 애들 돌면서 상하좌우 이동쓰
    while !queue.isEmpty() {
        guard let first = queue.dequeue() else { break }
        let x = first[0]
        let y = first[1]
        
        for i in 0..<4 {
            let nx = x + dx[i]
            let ny = y + dy[i]
            
            // 그래프 벗어나면 넘어가 !
            if nx >= height || nx < 0 || ny >= width || ny < 0 {
                continue
            }
            
            // -1이면 넘어가기
            if graph[nx][ny] == -1 {
                continue
            }
            
            // 0이면 안 익은 토매토 -> 현재 위치 값 + 1 이 맞나? 뭐 암튼 일단
            if graph[nx][ny] == 0 {
                graph[nx][ny] = graph[x][y] + 1
                queue.enqueue(nx, ny)
                result = max(result, graph[nx][ny])
            }
        }
    }
    
    // 상자에 덜 익은 토매토 있으면 -1 출력
    for i in 0..<height {
        for j in 0..<width {
            if graph[i][j] == 0 {
                isDone = false
            }
        }
    }

    // graph에서 최대값 뽑기
    // 2차원 배열에서 어케 뽑니 ?
    // flatMap : O(m + n)
//    result = (graph.flatMap{ $0 }.max() ?? 0) - 1
//    print(result)
    
    // 답 출력
    if isDone {
        print(result - 1)
    } else {
        print(-1)
    }
}
