//
//  ViewController.swift
//  ImageDownload_Program
//
//  Created by 최동호 on 2023/02/22.
//

import UIKit

class ViewController: UIViewController {
    private let mainView = MainView()
    
    override func loadView() {
        super.loadView()
        view = mainView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        bindButton()
        // Do any additional setup after loading the view.
    }
}

// MARK: UI & Action
extension ViewController{
    private func bindButton() {
        mainView.loadAllImagesButton.addTarget(self, action: #selector(didTapAllButton), for: .touchUpInside)
    }
    
    @objc func didTapAllButton() {
        mainView.contentViews.forEach {
            $0.didTapButton()
        }
    }
}

// MARK: SwiftUI Preview
#if DEBUG
import SwiftUI
struct ViewControllerRepresentable: UIViewControllerRepresentable
{
    //update
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
    }
    //makeUI
    @available(iOS 13.0, *)
    func makeUIViewController(context: Context) -> some UIViewController {
        ViewController()
    }
}

struct ViewController_Previews: PreviewProvider{
    static var previews: some View{
        ViewControllerRepresentable()
            .ignoresSafeArea()
            .previewDisplayName("iPhone 14 Pro")
    }
}
#endif
