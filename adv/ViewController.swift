//
//  ViewController.swift
//  adv
//
//  Created by Ryota Ayaki on 2021/04/08.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    @IBOutlet private weak var baseWebWrapperView: UIView!
    private var webView: WKWebView!
    private let DEVICE_TOKEN = "XXXXXXXXXXXXXXX"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initWebView()
        load(withURL: "https://app.adv.gr.jp/juken/questions_old/practice")
    }
}

private extension ViewController {
    func initWebView() {
        let configuration = WKWebViewConfiguration()
        let cookie = HTTPCookie(properties: [
            .domain: "app.adv.gr.jp",
            .path: "/",
            .name: "device_token",
            .value: DEVICE_TOKEN,
            .expires: "2022-04-09T05:43:12.000Z"
        ])!
        configuration.websiteDataStore.httpCookieStore.setCookie(cookie, completionHandler: nil)
        
        webView = WKWebView(frame: view.bounds, configuration: configuration)
        baseWebWrapperView.addSubview(webView)
    }
    
    func load(withURL urlStr:String) {
        guard let url = URL(string: urlStr) else { return }
        let request = URLRequest(url: url)
        webView?.load(request)
    }
}
