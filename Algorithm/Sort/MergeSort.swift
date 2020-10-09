//
//  MergeSort.swift
//  Algorithm
//
//  Created by Kang,junyoung on 2020/10/09.
//

import Foundation

class MergeSort {
    
    var sorted : [Int] = []
    
    func initSortedArr ( size : Int) {
        for i in 0..<size {
            sorted.append(0)
        }
        print("sorted size : \(sorted.count)")
    }
    
    func merge( arr : inout [Int], m : Int, middle : Int, n : Int){
        var i = m
        var j = middle + 1
        var k = m
        
        while ( i <= middle && j <= n) {
            if (arr[i] <= arr[j]) {
                sorted[k] = arr[i]
                i += 1
            }
            else {
                sorted[k] = arr[j]
                j += 1
            }
            k += 1
        }
        
        if (i > middle) {
            for t in j...n {
                sorted[k] = arr[t]
                k += 1
            }
        }
        else {
            for t in i...middle {
                sorted[k] = arr[t]
                k += 1
            }
        }
        
        for t in m...n {
            arr[t] = sorted[t]
        }
    }
    
    func mergeSort( arr : inout [Int], m : Int, n : Int) {
        if (m<n) {
            var middle = (m+n)/2
            mergeSort(arr: &arr, m: m, n: middle)
            mergeSort(arr: &arr, m: middle+1, n: n)
            merge(arr: &arr, m: m, middle: middle, n: n)
        }
    }
}
