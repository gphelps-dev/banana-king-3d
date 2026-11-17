import SwiftUI
import WebKit

/// Banana King 3D for Mac: the same game as ../../index.html in its own window, played with the keyboard.
/// Everything is bundled inside the app, so it works with no internet connection.
@main
struct BananaKingMacApp: App {
    var body: some Scene {
        WindowGroup {
            GameView()
                .frame(minWidth: 800, minHeight: 500)
                .background(Color(red: 27 / 255, green: 16 / 255, blue: 51 / 255))
        }
        .defaultSize(width: 1280, height: 800)
        .commands { CommandGroup(replacing: .newItem) {} }   // one game window, no "New Window"
    }
}

/// A web view that takes keyboard focus, so W/A/S/D, the arrow keys, Space and V reach the game.
final class GameWebView: WKWebView {
    override var acceptsFirstResponder: Bool { true }
}

struct GameView: NSViewRepresentable {
    func makeCoordinator() -> Coordinator { Coordinator() }

    func makeNSView(context: Context) -> WKWebView {
        let config = WKWebViewConfiguration()
        config.mediaTypesRequiringUserActionForPlayback = []

        let web = GameWebView(frame: .zero, configuration: config)
        web.navigationDelegate = context.coordinator
        web.allowsMagnification = false
        web.underPageBackgroundColor = NSColor(red: 27 / 255, green: 16 / 255, blue: 51 / 255, alpha: 1)
        #if DEBUG
        if #available(macOS 13.3, *) { web.isInspectable = true }
        #endif

        if let page = Bundle.main.url(forResource: "index", withExtension: "html"),
           let resources = Bundle.main.resourceURL {
            web.loadFileURL(page, allowingReadAccessTo: resources)
        }
        return web
    }

    func updateNSView(_ web: WKWebView, context: Context) {}

    final class Coordinator: NSObject, WKNavigationDelegate {
        /// The game only ever shows its own bundled files: no web browsing and no links out of the app.
        func webView(_ webView: WKWebView, decidePolicyFor action: WKNavigationAction,
                     decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
            let resources = Bundle.main.resourceURL?.standardizedFileURL.path ?? "/nonexistent"
            let inBundle = action.request.url.map { $0.isFileURL && $0.standardizedFileURL.path.hasPrefix(resources) } ?? false
            decisionHandler(inBundle ? .allow : .cancel)
        }

        /// Give the game the keyboard as soon as it loads.
        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            webView.window?.makeFirstResponder(webView)
        }
    }
}
