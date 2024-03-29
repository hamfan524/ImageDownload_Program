//
//  LoadButton.swift
//  ImageDownload_Program
//
//  Created by 최동호 on 2023/02/28.
//

import UIKit

class LoadButton: UIButton{
    init(frame: CGRect, titleName: String) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        setTitleColor(.white, for: .normal)
        backgroundColor = .systemBlue
        layer.cornerRadius = 5
        setTitle(titleName, for: .normal)
        setTitle("Stop", for: .selected)
        setBackgroundColor(.white.withAlphaComponent(0.5), for: .highlighted)
    }
    @available(*, unavailable)
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

