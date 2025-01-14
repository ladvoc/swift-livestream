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

import SwiftUI
import LiveKit
import LiveKitComponents

@available(iOS 18.0, macOS 15.0, *)
fileprivate struct PreviewRoomContext: PreviewModifier {
    
   static func makeSharedContext() async throws -> RoomContext {
       RoomContext()
   }
   
   func body(content: Content, context: RoomContext) -> some View {
       RoomScope(room: context.room) {
           content
               .environmentObject(context)
               .environmentObject(context.room.localParticipant as Participant)
       }
   }
}

@available(iOS 18.0, macOS 15.0, *)
extension PreviewTrait where T == Preview.ViewTraits {
    
    /// Supplies a ``RoomContext`` and ``LiveKit/Room`` to a preview’s view hierarchy.
    static var roomContext: PreviewTrait<T> {
        modifier(PreviewRoomContext())
    }
}
