/*
 * Copyright 2025 LiveKit
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import SwiftUI

struct StreamEventsListView: View {
    @EnvironmentObject var roomCtx: RoomContext

    var body: some View {
        ScrollViewReader { proxy in
            ScrollView {
                Spacer()
                    .frame(height: 50)
                LazyVStack(spacing: 12) {
                    ForEach(roomCtx.events) { entry in
                        StreamEventTileView(entry: entry)
                            .frame(maxWidth: .infinity)
                            .padding(.horizontal, 10)
                    }
                    .onChange(of: roomCtx.events.count) { _ in
                        withAnimation {
                            if let lastId = roomCtx.events.last?.id {
                                proxy.scrollTo(lastId)
                            }
                        }
                    }
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

@available(iOS 18.0, macOS 15.0, *)
#Preview(traits: .roomContext) {
    StreamEventsListView()
}
