//
//  2447.swift
//  2024BOJ
//
//  Created by 김유빈 on 6/23/24.

//  [별 찍기 - 10] https://www.acmicpc.net/problem/2447
//  solve

func _2447() {
    let n = Int(readLine()!)!
    var result = ""

    func recursion(i: Int, j: Int, n: Int) {
        //        if n == 3 {
        //            for y in y..<y + n {
        //                for x in x..<x + n {
        //                    if x % 3 == 1 && y % 3 == 1 {
        //                        print(" ", terminator: "")
        //                        continue
        //                    } else {
        //                        print("*", terminator: "")
        //                    }
        //                }
        //                print()
        //            }
        //
        //            return
        //        }
        //
        //        recursion(y: y, x: x, n: n / 3)
        //        recursion(y: y, x: x + n / 3, n: n / 3)
        //        recursion(y: y, x: x + n / 3 * 2, n: n / 3)
        //
        //        recursion(y: y + n / 3, x: x, n: n / 3)
        //        recursion(y: y + n / 3, x: x + n / 3, n: n / 3)
        //        recursion(y: y + n / 3, x: x + n / 3 * 2, n: n / 3)
        //
        //        recursion(y: y + n / 3 * 2, x: x, n: n / 3)
        //        recursion(y: y + n / 3 * 2, x: x + n / 3, n: n / 3)
        //        recursion(y: y + n / 3 * 2, x: x + n / 3 * 2, n: n / 3)
        //
        //     }
        //
        //    recursion(y: 0, x: 0, n: n)
                
        if (i / n) % 3 == 1 && (j / n) % 3 == 1 {
            result += " "
        } else {
            if n / 3 == 0 {
                result += "*"
            } else {
                recursion(i: i, j: j, n: n / 3)
            }
        }
    }
    
    for i in 0..<n {
        for j in 0..<n {
            recursion(i: i, j: j, n: n)
        }
        result += "\n"
    }
    
    print(result)

}
