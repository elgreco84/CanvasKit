//
//  CKICalendarEventTests.swift
//  CanvasKit
//
//  Created by Nathan Lambson on 7/16/14.
//  Copyright (c) 2014 Instructure. All rights reserved.
//

import XCTest

class CKICalendarEventTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testJSONModelConversion() {
        let calendarEventDictionary = Helpers.loadJSONFixture("calendar_event") as NSDictionary
        var calendarEvent = CKICalendarEvent(fromJSONDictionary: calendarEventDictionary)
        XCTAssertEqual(calendarEvent.id!, "1194491", "Calendar Event id was not parsed correctly")
        XCTAssertEqual(calendarEvent.title!, "Testing", "Calendar Event title was not parsed correctly")

        let formatter = ISO8601DateFormatter()
        formatter.includeTime = true
        var date = formatter.dateFromString("2013-09-18T00:00:00-06:00")
        XCTAssertEqual(calendarEvent.startAt!, date, "Calendar Event startAt was not parsed correctly")
        XCTAssertEqual(calendarEvent.endAt!, date, "Calendar Event endAt was not parsed correctly")
        XCTAssertEqual(calendarEvent.description!, "Secret Meeting of Super Persons", "Calendar Event description was not parsed correctly")
        XCTAssertEqual(calendarEvent.locationName!, "The Bat Cave", "Calendar Event locationName was not parsed correctly")
        XCTAssertEqual(calendarEvent.locationAddress!, "300 E Super Cool Dr", "Calendar Event locationAddress was not parsed correctly")
        XCTAssertEqual(calendarEvent.contextCode!, "user_4621806", "Calendar Event contextCode was not parsed correctly")
        XCTAssertEqual(calendarEvent.workflowState!, "active", "Calendar Event workflowState was not parsed correctly")
        XCTAssertFalse(calendarEvent.hidden, "Calendar Event hidden was not parsed correctly")
        XCTAssertEqual(calendarEvent.parentEventID!, "1", "Calendar Event parentEventID was not parsed correctly")
        XCTAssertEqual(calendarEvent.childEventsCount, 0, "Calendar Event childEventsCount was not parsed correctly")

        var url = NSURL.URLWithString("https://mobiledev.instructure.com/api/v1/calendar_events/1194491")
        XCTAssertEqual(calendarEvent.url!, url, "Calendar Event url was not parsed correctly")
        
        url = NSURL.URLWithString("https://mobiledev.instructure.com/calendar?event_id=1194491&include_contexts=user_4621806#7b2273686f77223a2267726f75705f757365725f34363231383036227d")
        XCTAssertEqual(calendarEvent.htmlURL!, url, "Calendar Event htmlURL was not parsed correctly")
        
        url = NSURL.URLWithString("https://example.com/api/v1/appointment_groups/543")
        XCTAssertEqual(calendarEvent.appointmentGroupURL!, url,"Calendar Event appointmentGroupURL was not parsed correctly")
        
        formatter.includeTime = false
        date = formatter.dateFromString("2013-09-18")
        XCTAssertEqual(calendarEvent.allDayDate!, date, "Calendar Event allDayDate was not parsed correctly")
        
        XCTAssert(calendarEvent.allDay, "Calendar Event allDay was not parsed correctly")

        formatter.includeTime = true
        date = formatter.dateFromString("2013-09-18T08:57:31-06:00")
        XCTAssertEqual(calendarEvent.createdAt!, date, "Calendar Event createdAt was not parsed correctly")
        XCTAssertEqual(calendarEvent.updatedAt!, date, "Calendar Event updatedAt was not parsed correctly")

        XCTAssertFalse(calendarEvent.reserved, "Calendar Event reserved was not parsed correctly")

        XCTAssertEqual(calendarEvent.appointmentGroupID!, "987","Calendar Event appointmentGroupID was not parsed correctly")

        XCTAssertFalse(calendarEvent.ownReservation, "Calendar Event ownReservation was not parsed correctly")
        
        XCTAssertEqual(calendarEvent.path!, "/api/v1/calendar_events/1194491", "Calendar Event path was not parsed correctly")
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }

}
