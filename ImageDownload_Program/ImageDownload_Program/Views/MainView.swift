//
//  mainStackView.swift
//  ImageDownload_Program
//
//  Created by 최동호 on 2023/02/25.
//

import UIKit
import SnapKit

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
        mainStackView.snp.makeConstraints { make in
            make.centerX.equalTo(snp.centerX)
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(20)
            make.width.equalTo(safeAreaLayoutGuide.snp.width).multipliedBy(0.9)
        }
        contentViews.forEach{
            $0.arrangedSubviews[0].snp.makeConstraints { make in
                make.height.equalTo(safeAreaLayoutGuide.snp.height).multipliedBy(0.125)
            }
        }
        loadAllImagesButton.snp.makeConstraints { make in
            make.top.equalTo(mainStackView.snp.bottom).offset(10)
            make.centerX.equalTo(snp.centerX)
            make.width.equalTo(safeAreaLayoutGuide.snp.width).multipliedBy(0.9)
            make.height.equalTo(safeAreaLayoutGuide.snp.height).multipliedBy(0.05)
        }
        for i in urlRange{
            contentViews[i].imageURL = urls[i]
        }
    }
}
