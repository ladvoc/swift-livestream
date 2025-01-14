/*
 * Copyright 2024 LiveKit
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

import LiveKit
import SwiftUI

struct ReactionsBarView: View {
    @EnvironmentObject var roomCtx: RoomContext
    @EnvironmentObject var room: Room

    var body: some View {
        HStack(alignment: .center, spacing: 30) {
            Button(action: {
                roomCtx.sendReaction(string: "🔥")
            }, label: {
                Text("🔥")
            })
            Button(action: {
                roomCtx.sendReaction(string: "👏")
            }, label: {
                Text("👏")
            })
            Button(action: {
                roomCtx.sendReaction(string: "🤣")
            }, label: {
                Text("🤣")
            })
            Button(action: {
                roomCtx.sendReaction(string: "❤️")
            }, label: {
                Text("❤️")
            })
            Button(action: {
                roomCtx.sendReaction(string: "🎉")
            }, label: {
                Text("🎉")
            })
        }
        .padding(.vertical, 15)
        .padding(.horizontal, 10)
    }
}

@available(iOS 18.0, macOS 15.0, *)
#Preview(traits: .roomContext) {
    ReactionsBarView()
}
