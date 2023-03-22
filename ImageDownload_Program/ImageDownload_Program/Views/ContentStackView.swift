//
//  contentStackView.swift
//  ImageDownload_Program
//
//  Created by 최동호 on 2023/02/25.
//

import UIKit

class ContentStackView: UIStackView{
    var index : Int = 0
    var downloadImageView: UIImageView = {
        let image = UIImageView(image: UIImage(systemName: "photo"))
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    let progressView: UIProgressView = {
        let progressView = UIProgressView()
        progressView.progress = 0.0
        progressView.translatesAutoresizingMaskIntoConstraints = false
        return progressView
    }()
    lazy var loadButton = LoadButton(frame: CGRect.zero, titleName: "Load")
    private var observation: NSKeyValueObservation!
    private var task: URLSessionDataTask!
    
    deinit{
        observation.invalidate()
        observation = nil
    }
    
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
    
    func reset(){
        downloadImageView.image = .init(systemName: "photo")
        progressView.progress = 0
        loadButton.isSelected = false
    }
    
    @objc func didTapButton() {
        loadButton.isSelected.toggle()
        guard loadButton.isSelected else {
            task.cancel()
            return
        }
        let imageURL = ImageURL[index]
        let url = imageURL
        let session = URLSession(configuration: .default)
        
        task = session.dataTask(with: url)  { data, response, error in
            if let error = error {
                guard error.localizedDescription == "cancelled" else {
                    fatalError(error.localizedDescription)
                }
                DispatchQueue.main.async {
                    self.reset()
                }
                return
            }
            guard let data = data, let image = UIImage(data: data) else {
                DispatchQueue.main.async {
                    self.downloadImageView.image = .init(systemName: "xmark")
                }
                return
            }
            DispatchQueue.main.async { [weak self] in
                self?.downloadImageView.image = image
                self?.loadButton.isSelected = false
            }
        }
        
        observation = task.progress.observe(\.fractionCompleted,
                                             options: [.new],
                                             changeHandler: { progress, change in
            DispatchQueue.main.async {
                self.progressView.progress = Float(progress.fractionCompleted)
            }
        })
        task.resume()
    }
}
