//
//  MessageComposeView.swift
//  Pushup Tracker
//
//  Created by Steve Liddle on 10/27/21.
//

import SwiftUI
import MessageUI

// See https://stackoverflow.com/a/65485462/270486
struct MessageComposeView: UIViewControllerRepresentable {
    typealias CompletionHandler = (_ messageSent: Bool) -> Void

    let recipients: [String]?
    let body: String?
    let completion: CompletionHandler?

    func makeUIViewController(context: Context) -> UIViewController {
        guard MFMessageComposeViewController.canSendText() else {
            return UIHostingController(rootView: messagesUnavailableView)
        }

        let controller = MFMessageComposeViewController()

        controller.messageComposeDelegate = context.coordinator
        controller.recipients = recipients
        controller.body = body

        return controller
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        // Nothing for us to update -- ignore.
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(completion: completion)
    }

    class Coordinator: NSObject, MFMessageComposeViewControllerDelegate {
        private let completion: CompletionHandler?

        init(completion: CompletionHandler?) {
            self.completion = completion
        }

        func messageComposeViewController(
            _ controller: MFMessageComposeViewController,
            didFinishWith result: MessageComposeResult
        ) {
            controller.dismiss(animated: true, completion: nil)
            completion?(result == .sent)
        }
    }

    var messagesUnavailableView: some View {
        VStack {
            Image(systemName: "xmark.octagon")
                .font(.system(size: 64))
                .foregroundColor(.red)
            Text("Text messages unavailable")
                .font(.system(size: 24))
        }
    }
}

struct MessageComposeView_Previews: PreviewProvider {
    static var previews: some View {
        MessageComposeView(
            recipients: ["801-555-1212"],
            body: "I've completed 300 push-ups",
            completion: nil
        )
    }
}
