//
//  StoreUseCaseFactorySpy.swift
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

import UseCases

public class StoreUseCaseFactorySpy {
    private var fetchUseCase: UseCase!

    public init() {}

    public func stub(withProductsFetchUseCase useCase: UseCase) {
        self.fetchUseCase = useCase
    }
}

extension StoreUseCaseFactorySpy: StoreUseCaseFactory {
    public func createProductsFetchUseCase(output output: ProductsFetchUseCaseOutput) -> UseCase {
        return fetchUseCase
    }
}
