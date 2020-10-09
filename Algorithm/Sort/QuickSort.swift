//
//  QuickSort.swift
//  Algorithm
//
//  Created by Kang,junyoung on 2020/10/10.
//

import Foundation

class QuickSort {
    

    private func partion(arr : inout [Int], start : Int, end : Int) -> Int {
        var left = start
        var right = end
        var pivot = right
        
        while (left<right) {
            while (arr[pivot] > arr[left] && left < right) {
                left += 1
            }
            while (arr[pivot] <= arr[right] && left < right) {
                right -= 1
            }
            if (left < right) {
                arr.swapAt(left, right)
            }
        }
        arr.swapAt(right, pivot)
        return right;
    }
    
    func quickSort(arr : inout [Int], start : Int, end : Int) {
        var left = start
        var right = end
        var pivot : Int
        if (left < right) {
            print("current left : \(start), current right : \(end), current pivot : \(right)")
            pivot = partion(arr: &arr, start: left, end: right)
            
            print("left side - start : \(left), end : \(pivot-1), pivot : \(pivot-1), arr : \(arr)")
            quickSort(arr: &arr, start: left, end: pivot-1)
            print("right side - start : \(pivot+1), end : \(right), pivot : \(right), arr : \(arr)")
            quickSort(arr: &arr, start: pivot+1, end: right)
        }
    }
}


