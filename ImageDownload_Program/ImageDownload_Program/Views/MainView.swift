//
//  mainStackView.swift
//  ImageDownload_Program
//
//  Created by 최동호 on 2023/02/25.
//

import UIKit
import SnapKit

final class MainView: UIView{
    
    let contentViews = (1...5).map { _ in ContentStackView() }
    
    let Urls = ImageURLs().imageURLs
    
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
        
        for i in 0...(Urls.count-1){
            contentViews[i].imageURL = Urls[i]
        }

            
        loadAllImagesButton.snp.makeConstraints { make in
            make.top.equalTo(mainStackView.snp.bottom).offset(10)
            make.centerX.equalTo(snp.centerX)
            make.width.equalTo(safeAreaLayoutGuide.snp.width).multipliedBy(0.9)
            make.height.equalTo(safeAreaLayoutGuide.snp.height).multipliedBy(0.05)
        }

    }
    
    
}
