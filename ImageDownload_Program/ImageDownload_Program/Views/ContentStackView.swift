//
//  contentStackView.swift
//  ImageDownload_Program
//
//  Created by 최동호 on 2023/02/25.
//

import UIKit

class ContentStackView: UIStackView{
    var isLoaded = false
    var imageURL = ""
    
    var downloadImageView: UIImageView = {
        let image = UIImageView(image: UIImage(systemName: "photo"))
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let progressView: UIProgressView = {
        let progressView = UIProgressView()
        progressView.progress = 0.5
        progressView.translatesAutoresizingMaskIntoConstraints = false
        return progressView
    }()
    
    lazy var loadButton = LoadButton(frame: CGRect.zero, titleName: "Load")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        setupView()
        setConstraints()
    }
    @available(*, unavailable)
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: UI & Action
extension ContentStackView{
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
        
        NSLayoutConstraint.activate([
            downloadImageView.widthAnchor.constraint(equalTo: downloadImageView.heightAnchor, multiplier: 1.5),
            loadButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.2),
            loadButton.heightAnchor.constraint(equalTo: loadButton.widthAnchor, multiplier: 0.45)
        ])
        
    }
    
    @objc func didTapButton() {
        if !isLoaded {
            guard let url = URL(string: imageURL) else { return }
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url)  { data, response, error in
                if error != nil {
                    print(error!)
                    return
                }
                guard let data = data else { return }
                let image = UIImage(data: data)
                DispatchQueue.main.async { [weak self] in
                    self?.downloadImageView.image = image
                }
            }
            task.resume()
            isLoaded = true
        } else {
            self.downloadImageView.image = UIImage(systemName: "photo")
            isLoaded = false
        }
    }
}
