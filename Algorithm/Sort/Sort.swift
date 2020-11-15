//
//  Sort.swift
//  Algorithm
//
//  Created by Kang,junyoung on 2020/10/17.
//

import Foundation

protocol Sort
{
    func Sort(arr : inout [Int], start : Int, end : Int)
    func verifySort(arr : inout [Int])->Bool
}
