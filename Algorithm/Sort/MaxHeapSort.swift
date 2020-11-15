//
//  MaxHeapSort.swift
//  Algorithm
//
//  Created by Kang,junyoung on 2020/10/17.
//

import Foundation

class MaxHeapSort : Sort
{
    func maxheapifyrec(arr : inout [Int], root : Int)
    {
        if ( root >= arr.count) { return }
        
        var child1 = root * 2 + 1
        var child2 = root * 2 + 2
        
        maxheapifyrec(arr: &arr, root: child1)
        maxheapifyrec(arr: &arr, root: child2)
        
        if (child2 >= arr.count) {
            if (child1 >= arr.count) { return }
            
            if (arr[child1] > arr[root])
            {
                arr.swapAt(root, child1)
            }
            return
        }
        //Find largest child
        var large = child1
        if (arr[child2] > arr[child1])
        {
            large = child2
        }
        
        //Swap with largest child
        
        if (arr[large] > arr[root])
        {
            arr.swapAt(root, large)
            percdwn(arr: &arr, root: large, len: arr.count)
            return
        }
    }
    func percdwn(arr : inout [Int], root : Int, len : Int)
    {
        var child1 = root * 2 + 1
        var child2 = root * 2 + 2
        
        if (child2 >= len)
        {
            if (child1 >= len) { return }
            else
            {
                if (arr[child1] > arr[root])
                {
                    arr.swapAt(root, child1)
                }
                return
            }
        }
        
        if (arr[child1] > arr[child2])
        {
            swap(&child1, &child2)
        }
        
        if (arr[child2] > arr[root])
        {
            arr.swapAt(root, child2)
            percdwn(arr: &arr, root: child2, len: len)
        }
        
    }
    
    func Sort(arr: inout [Int], start: Int, end: Int)
    {
        maxheapifyrec(arr: &arr, root: 0)
        for i in stride(from: arr.count-1, to: start, by: -1)
        {
            arr.swapAt(0, i)
            percdwn(arr: &arr, root: 0, len: i)
        }
    }
    func verifySort(arr: inout [Int]) -> Bool {
        return true
    }
}
