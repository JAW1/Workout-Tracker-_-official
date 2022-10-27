//
//  EditableText.swift
//  Pushup Tracker
//
//  Created by Steve Liddle on 10/28/21.
//

import SwiftUI

extension TextAlignment {
    var alignment: Alignment {
        self == .leading ? .leading : .trailing
    }
}

struct EditableText: View {
    var text: String = ""
    var isEditing: Bool
    var textAlignment: TextAlignment
    var onChanged: (String) -> Void

    @State private var editableText: String = ""

    var body: some View {
        ZStack(alignment: textAlignment.alignment) {
            TextField(text, text: $editableText, onEditingChanged: { began in
                callOnChangedIfChanged()
            })
                .multilineTextAlignment(textAlignment)
                .opacity(isEditing ? 1 : 0)
                .disabled(!isEditing)

            if !isEditing {
                Text(text)
                    .multilineTextAlignment(textAlignment)
                    .onAppear {
                        // any time we move from editable to non-editable
                        // we want to report any changes that happened to the text
                        // while were editable
                        // (i.e. we never "abandon" changes)
                        callOnChangedIfChanged()
                    }
            }
        }
        .onAppear { editableText = text }
    }

    func callOnChangedIfChanged() {
        if editableText != text {
            onChanged(editableText)
        }
    }
}
