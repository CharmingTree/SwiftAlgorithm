//
//  BubbleSort.swift
//  Algorithm
//
//  Created by Kang,junyoung on 2020/10/17.
//

import Foundation

class BubbleSort : Sort
{
    private func bubbleSort(arr : inout [Int], start : Int, end : Int)
    {
        for i in stride(from: end-1, to:start, by:-1)
        {
            for j in stride(from: start, to:i, by:+1)
            {
                if (arr[j] > arr[j+1])
                {
                    arr.swapAt(j, j+1)
                }
            }
        }
    }
    
    public func Sort(arr: inout [Int], start: Int, end: Int) {
        bubbleSort(arr: &arr, start: start, end: end)
    }
    
    func verifySort(arr: inout [Int]) -> Bool {
        return true
    }
    
}
