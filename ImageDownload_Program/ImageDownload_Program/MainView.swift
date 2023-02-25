//
//  mainStackView.swift
//  ImageDownload_Program
//
//  Created by 최동호 on 2023/02/25.
//

import UIKit
import SnapKit

final class MainView: UIView{
    
    private var contentView1 = ContentStackView().contentStackView
    private var contentView2 = ContentStackView().contentStackView
    private var contentView3 = ContentStackView().contentStackView
    private var contentView4 = ContentStackView().contentStackView
    private var contentView5 = ContentStackView().contentStackView
    
    lazy var mainStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [contentView1, contentView2, contentView3, contentView4, contentView5])
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 15
        return stackView
    }()
    
    private var loadAllImagesButton: UIButton = {
        let button = UIButton()
        button.setTitle("Load All Images", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 5
        return button
    }()
    
    @available(*, unavailable)
    required init?(coder: NSCoder) { fatalError() }
    override init(frame: CGRect) {
       super.init(frame: frame)
        setupView()
        autoLayout()
     }
    
    private func setupView() {
        backgroundColor = .white
        addSubview(mainStackView)
        addSubview(loadAllImagesButton)
    }
    
    private func autoLayout(){
        
        mainStackView.snp.makeConstraints { make in
            make.centerX.equalTo(snp.centerX)
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(20)
            make.width.equalTo(safeAreaLayoutGuide.snp.width).multipliedBy(0.9)
        }
        loadAllImagesButton.snp.makeConstraints { make in
            make.top.equalTo(mainStackView.snp.bottom).offset(10)
            make.centerX.equalTo(snp.centerX)
            make.width.equalTo(safeAreaLayoutGuide.snp.width).multipliedBy(0.9)
            make.height.equalTo(safeAreaLayoutGuide.snp.height).multipliedBy(0.05)
        }
        
        contentView1.arrangedSubviews[0].snp.makeConstraints { make in
            make.height.equalTo(safeAreaLayoutGuide.snp.height).multipliedBy(0.125)
        }
        contentView2.arrangedSubviews[0].snp.makeConstraints { make in
            make.height.equalTo(contentView1.arrangedSubviews[0].snp.height)
        }
        contentView3.arrangedSubviews[0].snp.makeConstraints { make in
            make.height.equalTo(contentView1.arrangedSubviews[0].snp.height)
        }
        contentView4.arrangedSubviews[0].snp.makeConstraints { make in
            make.height.equalTo(contentView1.arrangedSubviews[0].snp.height)
        }
        contentView5.arrangedSubviews[0].snp.makeConstraints { make in
            make.height.equalTo(contentView1.arrangedSubviews[0].snp.height)
        }
    }
    
}
