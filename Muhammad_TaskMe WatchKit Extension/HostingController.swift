//
//  HostingController.swift
//  Muhammad_TaskMe WatchKit Extension
//
//  Created by MUS on 2020-12-11.
//

import WatchKit
import Foundation
import SwiftUI

class HostingController: WKHostingController<AnyView> {
    override var body: AnyView {
        return AnyView(ContentView().environmentObject(TaskViewModel()))
    }
}
