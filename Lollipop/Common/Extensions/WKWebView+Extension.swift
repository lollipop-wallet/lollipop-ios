//
//  WKWebView+Extension.swift
//  Lollipop
//
//  Created by Aleksandar Draskovic on 16/06/2024.
//

import Foundation
import WebKit

public extension WKWebView {
    enum FontType: String {
        case otf
        case ttf
        var format: String {
            switch self {
            case .otf:
                return "opentype"
            case .ttf:
                return "truetype"
            }
        }
    }
    
    func injectScript(fontFileName: String, type: FontType, fontFamilyName: String) {
        let fontFileUrl = bundleFileURL(name: fontFileName, type: type.rawValue)
        guard let fontData = try? Data(contentsOf: fontFileUrl) else {
            return
        }
        print("Ulazis li odje?", fontFileUrl)
        let css = """
                @font-face {
                    font-family: '\(fontFamilyName)';
                    src: url(data:font/octet-stream;base64,\(fontData.base64EncodedString()))
                    format('\(type.format)');
                },
                *, :after, :before {
                    -moz-box-sizing: border-box;
                    box-sizing: border-box;
                }
                html,
                body{
                    width: 100%;
                    text-rendering: optimizeLegibility;
                    font-size: 16px;
                    margin: 0;
                    padding: 0;
                    min-height: 100%;
                }
                body {
                    font-family: 'Inter';
                    line-height: 1.6;
                    padding: 32px 0 64px;
                    display: block;
                    box-sizing: border-box;
                    outline: 1px solid red;
                    min-height: 100%;
                }

                p, li{
                    font-family: 'Inter';
                    font-weight: 400;
                    font-size: 16px;
                    line-height: 20px;
                    margin-bottom: 18px;
                }
                h1{
                    font-family: 'Inter';
                    font-weight: 700;
                    font-size: 30px;
                    line-height: 36px;
                    margin: 32px 0;
                }
                h2{
                    font-family: 'Inter';
                    font-weight: 700;
                    font-size: 24px;
                    line-height: 28px;
                    margin: 24px 0;
                }
                h3{
                    font-family: 'Inter';
                    font-weight: 700;
                    font-size: 20px;
                    line-height: 24px;
                    margin: 16px 0;
                }
                h4, h5, h6{
                    font-family: 'Inter';
                    font-weight: 700;
                    font-size: 18px;
                    line-height: 22px;
                    margin: 12px 0;
                }
                img, iframe{
                    width: 100%;
                    display: block;
                    border-radius: 16px;
                    margin: 32px 0;
                }
                """
        let cssStyle = """
               javascript:(function() {
               var parent = document.getElementsByTagName('head').item(0);
               var style = document.createElement('style');
               style.innerHTML = window.atob('\(encodeStringTo64(fromString: css)!)');
               parent.appendChild(style)})()
           """
        let cssScript = WKUserScript(source: cssStyle, injectionTime: .atDocumentEnd, forMainFrameOnly: false)
        configuration.userContentController.addUserScript(cssScript)
    }
    
    private func bundleFileURL(name: String, type: String) -> URL {
        let bundleURL = Bundle.main.bundleURL
        return bundleURL.appendingPathComponent(name).appendingPathExtension(type)
    }
    
    private func encodeStringTo64(fromString: String) -> String? {
        let plainData = fromString.data(using: .utf8)
        return plainData?.base64EncodedString(options: [])
    }
    
    func loadCorrectSizedHTMLString(content: String, baseURL: URL?) {
        let headString = "<head><meta name='viewport' content='width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no'></head>"
        self.loadHTMLString(headString + content, baseURL: nil)
    }
}
