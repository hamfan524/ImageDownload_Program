//
//  contentStackView.swift
//  ImageDownload_Program
//
//  Created by 최동호 on 2023/02/25.
//

import UIKit
import SnapKit

class ContentStackView: UIStackView{
    
    var isLoaded = false
    var imageURL = ""
    
    var downloadImageView: UIImageView = {
        let image = UIImageView(image: UIImage(systemName: "photo"))
        return image
    }()
    
    let progressView: UIProgressView = {
        let progressView = UIProgressView()
        progressView.progress = 0.5
        return progressView
    }()
    
    lazy var loadButton = LoadButton(frame: CGRect.zero, titleName: "Load")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setConstraints()
    }
    @available(*, unavailable)
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        backgroundColor = .systemBackground
        axis = .horizontal
        alignment = .center
        distribution = .fill
        spacing = 10
        
        [downloadImageView, progressView, loadButton].forEach { subView in
            self.addArrangedSubview(subView)
        }
        loadButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    private func setConstraints(){
        downloadImageView.snp.makeConstraints { make in
            make.width.equalTo(downloadImageView.snp.height).multipliedBy(1.5)
        }
        loadButton.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.2)
        }
    }
    
    @objc func didTapButton() {
        if !isLoaded {
            guard let url = URL(string: imageURL) else {
                return
            }

            let request = URLRequest(url: url)

            URLSession.shared.dataTask(with: request) { data, _, error in
                guard let data = data, error == nil else {
                    return
                }

                let image = UIImage(data: data)
                DispatchQueue.main.async { [weak self] in
                    self?.downloadImageView.image = image
                }
            }.resume()
            isLoaded = true
        } else {
            self.downloadImageView.image = UIImage(systemName: "photo")
            isLoaded = false
        }
    }
    
}
