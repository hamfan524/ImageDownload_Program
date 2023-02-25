//
//  ViewController.swift
//  ImageDownload_Program
//
//  Created by 최동호 on 2023/02/22.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    private let mainView = MainView()

    
    override func loadView() {
        super.loadView()
        view = mainView
      }
    override func viewDidLoad() {
        super.viewDidLoad()
   
        // Do any additional setup after loading the view.
    }
}
// MARK: UI & Action
extension ViewController{

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
