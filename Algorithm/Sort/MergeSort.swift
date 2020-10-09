//
//  MergeSort.swift
//  Algorithm
//
//  Created by Kang,junyoung on 2020/10/09.
//

import Foundation

class MergeSort {
    
    var level : Int = 0
    var sorted : [Int] = []
    
    func initSortedArr ( size : Int) {
        for i in 0..<size {
            sorted.append(0)
        }
        print("sorted size : \(sorted.count)")
    }
    
    func merge(arr : inout [Int], west : Int, middle : Int, east : Int) {
        
        var i = west
        var j = middle+1
        var k = west
        
        while (i <= middle && j <= east) {
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
        
        if ( i > middle) {
            for t in j...east {
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
        
        for t in west...east {
            arr[t] = sorted[t]
        }
        
        print("level : \(level), west : \(west), middle : \(middle), east : \(east), arr = \(arr)");
        level += 1
    }
    
    func mergeSort(arr : inout [Int], west : Int, east : Int) {
        if (west < east) {
            var middle = (west+east)/2
            mergeSort(arr: &arr, west: west, east: middle)
            mergeSort(arr: &arr, west: middle+1, east: east)
            merge(arr: &arr, west: west, middle: middle, east: east)
        }
    }
}
