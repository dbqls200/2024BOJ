//
//  17478.swift
//  2024BOJ
//
//  Created by 김유빈 on 5/30/24.
//

func _17478() {
    let n = Int(readLine()!)!
    var i = 0
    
    print("어느 한 컴퓨터공학과 학생이 유명한 교수님을 찾아가 물었다.")

    recursion(n: n, i: &i)
}

private func recursion(n: Int, i: inout Int) {
    let dash = String(repeating: "____", count: i)
    
    print("\(dash)\"재귀함수가 뭔가요?\"")
    
    if i == n {
        print("\(dash)\"재귀함수는 자기 자신을 호출하는 함수라네\"")
        print("\(dash)라고 답변하였지.")
        
        return
    } else {
        print("\(dash)\"잘 들어보게. 옛날옛날 한 산 꼭대기에 이세상 모든 지식을 통달한 선인이 있었어.")
        print("\(dash)마을 사람들은 모두 그 선인에게 수많은 질문을 했고, 모두 지혜롭게 대답해 주었지.")
        print("\(dash)그의 답은 대부분 옳았다고 하네. 그런데 어느 날, 그 선인에게 한 선비가 찾아와서 물었어.\"")
    }
    
    i += 1
    recursion(n: n, i: &i)
    
    i -= 1
    print(String(repeating: "____", count: i), terminator: "")
    print("라고 답변하였지.")
}
