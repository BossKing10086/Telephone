//
//  DefaultRingtonePlaybackUseCaseTests.swift
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
import UseCasesTestDoubles
import XCTest

class DefaultRingtonePlaybackUseCaseTests: XCTestCase {
    private var ringtone: RingtoneSpy!
    private var factory: RingtoneFactorySpy!
    private var sut: RingtonePlaybackUseCase!

    override func setUp() {
        super.setUp()
        ringtone = RingtoneSpy()
        factory = RingtoneFactorySpy()
        factory.stubWith(ringtone)
        sut = DefaultRingtonePlaybackUseCase(factory: factory)
    }

    func testStartsPlayingRingtone() {
        try! sut.start()

        XCTAssertTrue(ringtone.didCallStartPlaying)
    }

    func testStopsPlayingRingtone() {
        try! sut.start()
        sut.stop()

        XCTAssertTrue(ringtone.didCallStopPlaying)
    }

    func testPlayingFlagIsTrueOnStartPlaying() {
        try! sut.start()

        XCTAssertTrue(sut.playing)
    }

    func testPlayingFlagIsFalseOnStopPlaying() {
        try! sut.start()
        sut.stop()

        XCTAssertFalse(sut.playing)
    }

    func testInterval() {
        try! sut.start()

        XCTAssertEqual(factory.invokedInterval, DefaultRingtonePlaybackUseCase.interval)
    }

    func testDoesNotCreateRingtoneIfAlreadyExists() {
        try! sut.start()
        try! sut.start()

        XCTAssertEqual(factory.createRingtoneCallCount, 1)
    }

    func testStopsPlayingRingtoneOnceOnTwoConsecutiveCallsTostop() {
        try! sut.start()
        sut.stop()
        sut.stop()

        XCTAssertEqual(ringtone.stopPlayingCallCount, 1)
    }
}
