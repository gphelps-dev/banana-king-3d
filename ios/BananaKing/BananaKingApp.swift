import AVFoundation
import SwiftUI
import WebKit

/// Banana King 3D for iPad and iPhone: the same game as ../index.html, shown full screen in a web view.
/// Everything is bundled inside the app, so it works with no internet connection.
@main
struct BananaKingApp: App {
    init() {
        // Game sounds mix with any music that is playing and follow the silent switch.
        try? AVAudioSession.sharedInstance().setCategory(.ambient)
    }

    var body: some Scene {
        WindowGroup {
            GameView()
                .ignoresSafeArea()
                .statusBarHidden(true)
                .persistentSystemOverlays(.hidden)   // hide the home bar while playing
                .defersSystemGestures(on: .all)       // swipes near the edges go to the game first
                .background(Color.night.ignoresSafeArea())
        }
    }
}

extension Color {
    static let night = Color(red: 27 / 255, green: 16 / 255, blue: 51 / 255)
}

struct GameView: UIViewRepresentable {
    func makeCoordinator() -> Coordinator { Coordinator() }

    func makeUIView(context: Context) -> WKWebView {
        let config = WKWebViewConfiguration()
        config.allowsInlineMediaPlayback = true
        config.mediaTypesRequiringUserActionForPlayback = []

        let web = WKWebView(frame: .zero, configuration: config)
        web.navigationDelegate = context.coordinator
        web.isOpaque = false
        web.backgroundColor = UIColor(Color.night)
        web.allowsLinkPreview = false
        web.scrollView.isScrollEnabled = false
        web.scrollView.bounces = false
        web.scrollView.contentInsetAdjustmentBehavior = .never
        web.scrollView.pinchGestureRecognizer?.isEnabled = false
        #if DEBUG
        web.isInspectable = true   // lets Safari's Web Inspector look at the game in debug builds
        #endif

        if let page = Bundle.main.url(forResource: "index", withExtension: "html") {
            web.loadFileURL(page, allowingReadAccessTo: Bundle.main.bundleURL)
        }
        return web
    }

    func updateUIView(_ web: WKWebView, context: Context) {}

    final class Coordinator: NSObject, WKNavigationDelegate {
        /// The game only ever shows its own bundled files: no web browsing and no links out of the app.
        func webView(_ webView: WKWebView, decidePolicyFor action: WKNavigationAction,
                     decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
            let bundle = Bundle.main.bundleURL.standardizedFileURL.path
            let inBundle = action.request.url.map { $0.isFileURL && $0.standardizedFileURL.path.hasPrefix(bundle) } ?? false
            decisionHandler(inBundle ? .allow : .cancel)
        }

        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            #if DEBUG
            // Photo mode for App Store screenshots, only in debug builds run from Xcode:
            // launch with  -landscape  to turn sideways, and  -shot <runway|jump|mine|house|eyes|win>  to set up a moment.
            let args = ProcessInfo.processInfo.arguments
            if args.contains("-landscape"),
               let scene = webView.window?.windowScene {
                scene.requestGeometryUpdate(.iOS(interfaceOrientations: .landscapeRight))
            }
            if let i = args.firstIndex(of: "-shot"), i + 1 < args.count {
                let name = args[i + 1].filter { $0.isLetter }
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                    webView.evaluateJavaScript("window.__shot && window.__shot('\(name)')")
                }
            }
            #endif
        }
    }
}
