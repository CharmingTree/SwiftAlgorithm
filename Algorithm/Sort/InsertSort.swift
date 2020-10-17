//
//  InsertSort.swift
//  Algorithm
//
//  Created by Kang,junyoung on 2020/10/17.
//

import Foundation

class InsertSort
{
    func Sort(arr : inout [Int], start : Int, end : Int)
    {
        var pos : Int
        for i in start+1..<end {
            pos = i
            while ( pos > start && arr[pos-1] >= arr[pos]) {
                arr.swapAt(pos-1, pos)
                pos -= 1
            }
        }
        
    }
}
