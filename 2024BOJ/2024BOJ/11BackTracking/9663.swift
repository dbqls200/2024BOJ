//
//  9663.swift
//  2024BOJ
//
//  Created by 김유빈 on 7/3/24.

//  [N-Queen] https://www.acmicpc.net/problem/9663
//

func _9663() {
    // 입력
    let n = Int(readLine()!)!
    
    /*
     N x N 칸 위에 퀸 N개 두기
     칸 위에 퀸 N개를 두는 방법 찾기.
     서로 공격할 수 없게 둬야 함.
     */
    
    var cnt = 0
    
    // 갯수 정하기. 40말고.
    var isUsed1 = [Bool](repeating: false, count: 40)
    var isUsed2 = [Bool](repeating: false, count: 40)
    var isUsed3 = [Bool](repeating: false, count: 40)
    
    func back(k: Int) {
        if k == n {
            cnt += 1
            
            return
        }
        
        for i in 0..<n {
            if isUsed1[i] || isUsed2[i + k] || isUsed3[k - i + n - 1] {
                continue
            }
            
            isUsed1[i] = true
            isUsed2[i + k] = true
            isUsed3[k - i + n - 1] = true
            
            back(k: k + 1)
            
            isUsed1[i] = false
            isUsed2[i + k] = false
            isUsed3[k - i + n - 1] = false
        }
    }
    
    back(k: 0)
    
    print(cnt)
}
