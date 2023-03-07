//
//  mainStackView.swift
//  ImageDownload_Program
//
//  Created by 최동호 on 2023/02/25.
//

import UIKit

final class MainView: UIView{
    let contentViews = (1...ImageURLs().imageURLs.count).map { _ in ContentStackView() }
    let urls = ImageURLs().imageURLs
    let urlRange = 0...(ImageURLs().imageURLs.count - 1)
    
    lazy var mainStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: contentViews)
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 15
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var loadAllImagesButton = LoadButton(frame: CGRect.zero, titleName: "Load All Images")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setConstraints()
    }
    @available(*, unavailable)
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: UI
extension MainView{
    private func setupView() {
        backgroundColor = .systemBackground
        addSubview(mainStackView)
        addSubview(loadAllImagesButton)
    }
    
    private func setConstraints(){
        
        NSLayoutConstraint.activate([
            mainStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            mainStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            mainStackView.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.9),
            loadAllImagesButton.topAnchor.constraint(equalTo: mainStackView.bottomAnchor, constant: 10),
            loadAllImagesButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            loadAllImagesButton.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.9),
            loadAllImagesButton.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.05)
        ])
        
        contentViews.forEach{
            $0.arrangedSubviews[0].heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.125).isActive = true
        }
        
        for i in urlRange{
            contentViews[i].imageURL = urls[i]
        }
    }
}
