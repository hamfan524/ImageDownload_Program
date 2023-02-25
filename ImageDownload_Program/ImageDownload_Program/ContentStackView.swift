//
//  contentStackView.swift
//  ImageDownload_Program
//
//  Created by 최동호 on 2023/02/25.
//

import UIKit
import SnapKit

class ContentStackView: UIView{
    
    var downloadImageView: UIImageView = {
        let image = UIImageView(image: UIImage(systemName: "photo"))
        return image
    }()
    
    let progressView: UIProgressView = {
        let progressView = UIProgressView()
        progressView.progress = 0.5
        return progressView
    }()
    
    let loadButton: UIButton = {
        let button = UIButton()
        button.setTitle("Load", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 5
        return button
    }()
    
    lazy var contentStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [downloadImageView, progressView, loadButton])
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 10
        
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        autoLayout()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func autoLayout(){
        addSubview(contentStackView)
        downloadImageView.snp.makeConstraints { make in
            make.width.equalTo(downloadImageView.snp.height).multipliedBy(1.5)
        }
        loadButton.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.2)
        }
 
    }
}

