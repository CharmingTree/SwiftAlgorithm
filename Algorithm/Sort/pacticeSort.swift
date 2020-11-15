//
//  pacticeSort.swift
//  Algorithm
//
//  Created by Kang,junyoung on 2020/11/15.
//

import Foundation

class PracticeSort : Sort
{
    var sorted : [Int] = [];
    
    init() {
        sorted = [];
    }
    init(length : Int) {
        for t in 0..<length
        {
            sorted.append(0);
        }
    }
    
    func merge(arr : inout [Int], west : Int, middle : Int, east : Int)
    {
        var i = west;
        var j = middle+1;
        var k = west;
        
        while(i <= middle && j <= east)
        {
            if (arr[i] <= arr[j])
            {
                sorted[k] = arr[i]
                i += 1
            }
            else
            {
                sorted[k] = arr[j]
                j += 1
            }
            k += 1
        }
        
        if (i > middle)
        {
            for t in j...east
            {
                sorted[k] = arr[t]
                k+=1
            }
        }
        else
        {
            for t in i...middle
            {
                sorted[k] = arr[t]
                k+=1
            }
        }
        
        for t in west...east
        {
            arr[t] = sorted[t]
        }
    }
    
    func mergeSort(arr : inout [Int], west : Int, east : Int){
        if (west < east)
        {
            var middle = (west+east) / 2
            mergeSort(arr: &arr, west: west, east: middle)
            mergeSort(arr: &arr, west: middle+1, east: east)
            merge(arr: &arr, west: west, middle: middle, east: east)
        }
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
    
    func partition(arr : inout [Int], start : Int, end : Int) -> Int
    {
        var left = start;
        var right = end;
        var pivot = end;
        
        while (left < right)
        {
            while (arr[pivot] > arr[left] && left < right)
            {
                left+=1
            }
            while (arr[pivot] <= arr[right] && left < right)
            {
                right-=1
            }
            
            if (left < right) {
                arr.swapAt(left, right)
            }
        }
        
        arr.swapAt(pivot, right)
        
        return right;
    }
    
    func quickSort(arr : inout [Int], start : Int, end : Int)
    {
        if (start < end)
        {
            var pivot = partition(arr: &arr, start: start, end: end)
            quickSort(arr: &arr, start: start, end: pivot-1)
            quickSort(arr: &arr, start: pivot+1, end: end)
        }
    }
    

    
    func MaxHeapify(arr : inout [Int], root : Int)
    {
        if (arr.count <= root) { return };
        var child1 = root * 2 + 1
        var child2 = root * 2 + 2
        
        MaxHeapify(arr: &arr, root: child1)
        MaxHeapify(arr: &arr, root: child2)
        
        if (arr.count <= child2)
        {
            if (arr.count <= child1)
            {
                return
            }
            else
            {
                if (arr[root] < arr[child1])
                {
                    arr.swapAt(child1, root);
                }
                return;
            }
         
        }
        
        var large = child1;
        
        if (arr[child1] < arr[child2])
        {
            large = child2;
        }
        
        if (arr[root] < arr[large])
        {
            arr.swapAt(root, large)
            heapSort(arr: &arr, root: large, len: arr.count)
            return
        }
    }
    
    func heapSort(arr : inout [Int], root : Int, len : Int)
    {
        var child1 = root * 2 + 1
        var child2 = root * 2 + 2
        
        if (len <= child2)
        {
            if (len <= child1)
            {
                return
            }
            else
            {
                if (arr[root] < arr[child1])
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
        
        if (arr[root] < arr[child2])
        {
            arr.swapAt(root, child2)
            heapSort(arr: &arr, root: child2, len: len)
        }
        return
    }
    
    func MaxHeapSort(arr: inout [Int], start : Int, end : Int){
        
        MaxHeapify(arr: &arr, root: 0)
        for i in stride(from: end, to: start, by: -1) {
            arr.swapAt(0, i)
            heapSort(arr: &arr, root: 0, len: i)
        }
    }
    
    func getMaxLength(arr : inout [Int]) -> Int
    {
        var maxlength = 0;
        
        for i in 0 ..< arr.count
        {
            var cur = arr[i] == 0 ? 1 : Int(log10(Double(arr[i])))+1;
            if (maxlength < cur)
            {
                maxlength = cur;
            }
        }
        return maxlength;
    }
    
    func radixSort(arr : inout [Int])
    {
        var maxLength = getMaxLength(arr: &arr);
        var po = 1;
        var index = 0;
        
        var bucket : Array<Array<Int>> = Array<Array<Int>>();
        
        for i in 0 ..< 10
        {
            bucket.append(Array<Int>())
        }
        
        for i in 0 ..< maxLength
        {
            for j in 0 ..< arr.count
            {
                var position = Int(arr[j] / po) % 10;
                bucket[position].append(arr[j]);
            }
            
            for j in 0 ..< 10
            {
                while(!bucket[j].isEmpty)
                {
                    arr[index] = Int(bucket[j][0]);
                    bucket[j].remove(at: 0)
                    
                    index+=1
                }
            }
            
            po *= 10
            index = 0
        }
    }
    
    func Sort(arr: inout [Int], start: Int, end: Int) {
        //mergeSort(arr: &arr, west: start, east: end-1)
//        quickSort(arr: &arr, start: start, end: end-1)
//        MaxHeapSort(arr: &arr, start: 0, end: end-1)
        radixSort(arr: &arr)
    }
}


