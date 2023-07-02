//
//  Extensions.swift
//  Recipes
//
//  Created by Christian Sohns on 7/2/23.
//

import Foundation

extension Sequence {
    public func filter(maxItems limit: Int, where isIncluded: (Iterator.Element) -> Bool) -> [Iterator.Element] {
        var result : [Iterator.Element] = []
        result.reserveCapacity(limit)
        var count = 0
        var it = makeIterator()

        // While limit not reached and there are more elements ...
        while count < limit, let element = it.next() {
            if isIncluded(element) {
                result.append(element)
                count += 1
            }
        }
        return result
    }
}
