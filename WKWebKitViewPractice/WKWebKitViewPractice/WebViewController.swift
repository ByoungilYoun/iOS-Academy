//
//  WebViewController.swift
//  WKWebKitViewPractice
//
//  Created by 윤병일 on 2020/12/01.
//

import UIKit
import WebKit

class WebViewController : UIViewController {
  
  //MARK: - Properties
  
  private let webView : WKWebView = {
    let preferences = WKWebpagePreferences()
    preferences.allowsContentJavaScript = true
    let configuration = WKWebViewConfiguration()
    configuration.defaultWebpagePreferences = preferences
    let webView = WKWebView(frame: .zero, configuration: configuration)
    return webView
  }()
  
  private let url : URL
  
  init(url : URL, title : String) {
    self.url = url
    super.init(nibName: nil, bundle: nil)
    self.title = title
    
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  //MARK: - LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemBackground
    view.addSubview(webView)
    webView.load(URLRequest(url: url))
    configureButtons()
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    webView.frame = view.bounds
  }
  
  //MARK: - func configureButtons()
  private func configureButtons() {
    navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(didTapButton))
    navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(didTapRefresh))
  }
  
  @objc private func didTapButton() {
    dismiss(animated: true, completion: nil)
  }
  
  @objc private func didTapRefresh() {
    // 다시 load 를 해주면서 refresh 를 해준다.
    webView.load(URLRequest(url: url))
  }
}
