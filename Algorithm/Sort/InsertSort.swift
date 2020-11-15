//
//  InsertSort.swift
//  Algorithm
//
//  Created by Kang,junyoung on 2020/10/17.
//

import Foundation

extension Array {
    mutating func insertionSort2(by comparer: (Element, Element) -> Bool) {
        insertionSort2(0, count, by: comparer)
    }

    private mutating func insertionSort2(_ begin:Int, _ end: Int, by comparer: (Element, Element) -> Bool) {

        for i in begin..<end {
            for j in stride(from: i, to: 0, by: -1) {
                if !comparer(self[j],self[j-1]) {
                    break
                }
                self.swapAt(j, j-1)
            }
        }
    }
}
class InsertSort : Sort
{
    func insertSort(arr : inout [Int], start : Int, end : Int)
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
    
    func Sort(arr: inout [Int], start: Int, end: Int) {
        insertSort(arr: &arr, start: start, end: end)
    }

    
    func verifySort(arr: inout [Int]) -> Bool {
        var isCollect : Bool = true
        for i in stride(from: 1, to: arr.count, by: 1)
        {
            if ( arr[i-1] > arr[i])
            {
                isCollect = false
                break
            }
        }
        return isCollect
    }
}

//extension Array
//{
//    mutating func insertionSort(by comparer: (Element, Element) -> Bool) {
//        insertionSort(0, count, by: comparer)
//    }
//
//    private mutating func insertionSort(_ begin:Int, _ end:Int, by compaere: (Element, Element) -> Bool ){
//
//    }
//}

