//
//  SampleLogView.swift
//  SampleSwiftUI3
//
//  Created by yusaku maki on 2023/10/05.
//

import SwiftUI
import OSLog

let logger = Logger(subsystem: "SampleLog", category: "sample")

struct SampleLogView: View {
    var body: some View {
        List {
            Button(action: {
                logger.notice("notice")
            }, label: {
                Text("notice")
            })
            Button(action: {
                logger.debug("debug")
            }, label: {
                Text("debug")
            })
            Button(action: {
                logger.trace("trace")
            }, label: {
                Text("trace")
            })
            Button(action: {
                logger.log("log")
            }, label: {
                Text("log")
            })
            Button(action: {
                logger.info("info")
            }, label: {
                Text("info")
            })
            Button(action: {
                logger.warning("warning")
            }, label: {
                Text("warning")
            })
            Button(action: {
                logger.error("error")
            }, label: {
                Text("error")
            })
            Button(action: {
                logger.fault("fault")
            }, label: {
                Text("fault")
            })
            Button(action: {
                logger.critical("critical")
            }, label: {
                Text("critical")
            })
        }
    }
}

#Preview {
    SampleLogView()
}
