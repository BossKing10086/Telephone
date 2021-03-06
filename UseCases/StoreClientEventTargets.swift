//
//  StoreClientEventTargets.swift
//  Telephone
//
//  Copyright (c) 2008-2016 Alexey Kuznetsov
//  Copyright (c) 2016 64 Characters
//
//  Telephone is free software: you can redistribute it and/or modify
//  it under the terms of the GNU General Public License as published by
//  the Free Software Foundation, either version 3 of the License, or
//  (at your option) any later version.
//
//  Telephone is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.
//

public class StoreClientEventTargets {
    public var count: Int {
        return targets.count
    }

    public subscript(index: Int) -> StoreClientEventTarget? {
        get {
            return targets[index]
        }
    }

    private var targets: [StoreClientEventTarget] = []

    public init() {}

    public func addTarget(target: StoreClientEventTarget) {
        targets.append(target)
    }

    public func removeTarget(target: StoreClientEventTarget) {
        if let index = targets.indexOf({ $0 === target }) {
            targets.removeAtIndex(index)
        }
    }
}

extension StoreClientEventTargets: StoreClientEventTarget {
    public func storeClient(storeClient: StoreClient, didFetchProducts products: [Product]) {
        targets.forEach { $0.storeClient(storeClient, didFetchProducts: products) }
    }

    public func storeClient(storeClient: StoreClient, didFailFetchingProductsWithError error: String) {
        targets.forEach { $0.storeClient(storeClient, didFailFetchingProductsWithError: error) }
    }
}
