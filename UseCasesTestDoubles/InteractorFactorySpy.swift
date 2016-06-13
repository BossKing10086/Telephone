//
//  InteractorFactorySpy.swift
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

public class InteractorFactorySpy {
    public private(set) var invokedSoundIO = PresentationSoundIO(input: "", output: "", ringtoneOutput: "")
    public private(set) var invokedRingtoneSoundName = ""

    private var userDefaultsSoundIOLoad: ThrowingInteractor!
    private var userDefaultsSoundIOSave: Interactor!
    private var userDefaultsRingtoneSoundNameSave: Interactor!

    public init() {}

    public func stubWithUserDefaultsSoundIOLoad(interactor: ThrowingInteractor) {
        userDefaultsSoundIOLoad = interactor
    }

    public func stubWithUserDefaultsSoundIOSave(interactor: Interactor) {
        userDefaultsSoundIOSave = interactor
    }

    public func stubWithUserDefaultsRingtoneSoundNameSave(interactor: Interactor) {
        userDefaultsRingtoneSoundNameSave = interactor
    }
}

extension InteractorFactorySpy: InteractorFactory {
    public func createUserDefaultsSoundIOLoadInteractor(output output: UserDefaultsSoundIOLoadInteractorOutput) -> ThrowingInteractor {
        return userDefaultsSoundIOLoad
    }

    public func createUserDefaultsSoundIOSaveInteractor(soundIO soundIO: PresentationSoundIO) -> Interactor {
        invokedSoundIO = soundIO
        return userDefaultsSoundIOSave
    }

    public func createUserDefaultsRingtoneSoundNameSaveInteractor(name name: String) -> Interactor {
        invokedRingtoneSoundName = name
        return userDefaultsRingtoneSoundNameSave
    }
}
