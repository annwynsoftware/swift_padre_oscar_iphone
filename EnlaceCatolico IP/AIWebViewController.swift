//
//  AIWebViewController.swift
//  EnlaceCatolico IP
//
//  Created by Jose Matus on 14/06/14.
//  Copyright (c) 2014 annwynsoft. All rights reserved
//

import UIKit

class AIWebViewController: UIViewController, UIWebViewDelegate {

    var url: String? = ""
    var mytext:String?=""
    let webView = UIWebView()
    let spinner = UIActivityIndicatorView(activityIndicatorStyle: .Gray)
    
    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    init(htmltext: String?) {
        //self.url = url
        self.mytext = htmltext
        super.init(nibName: nil, bundle: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Webview
        view.addSubview(webView)
        webView.frame = view.bounds
        webView.delegate = self
        //webView.loadRequest(NSURLRequest(URL: NSURL(string: url?)))
        webView.loadHTMLString(mytext, baseURL:nil)
        webView.autoresizingMask = .FlexibleWidth | .FlexibleHeight
        
        // Spinner
        view.addSubview(spinner)
        spinner.center = view.center
        spinner.startAnimating()
        spinner.autoresizingMask = .FlexibleLeftMargin | .FlexibleRightMargin | .FlexibleTopMargin | .FlexibleBottomMargin
    }

    func webViewDiStartLoad(webView: UIWebView!) {
        spinner.startAnimating()
    }
    
    func webViewDidFinishLoad(webView: UIWebView!) {
        spinner.stopAnimating()
    }
    
}
