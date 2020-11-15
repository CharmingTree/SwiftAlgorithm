//
//  RadixSort.swift
//  Algorithm
//
//  Created by Kang,junyoung on 2020/10/25.
//

import Foundation

class RadixSort : Sort
{
    func getMaxlength(arr : inout [Int]) -> Int {
        var maxlength = 0;
        for i in stride(from: 0, to: arr.count, by: 1)
        {
            var length = (arr[i] == 0) ? 1 : Int(log10(Double(arr[i])))+1;
            
            if (maxlength < length) {
                maxlength = length
            }
        }
        return maxlength;
    }
    
    func RadixSort(arr : inout [Int])
    {
        var maxsize = getMaxlength(arr: &arr);
        var bucket : Array<Array<Int>> = Array<Array<Int>>();
        var powed = 1;
        var index = 0;
        
        for i in 0 ..< 10 {
            bucket.append(Array<Int>());
        }
        
        for i in stride(from: 1, through: maxsize, by: 1) {
            for j in 0 ..< arr.count {
                var element = Int(arr[j]/powed) % 10;
                bucket[element].append(arr[j]);
            }
            for k in 0 ..< 10 {
                while !bucket[k].isEmpty {
                    arr[index] = Int(bucket[k][0])
                    bucket[k].remove(at: 0)
                    index += 1
                }
            }
            index = 0;
            powed *= 10;
        }
        
        
    }
    
    func Sort(arr: inout [Int], start: Int, end: Int) {
        RadixSort(arr: &arr)
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
