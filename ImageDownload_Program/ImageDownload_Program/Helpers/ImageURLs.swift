//
//  Helper.swift
//  ImageDownload_Program
//
//  Created by 최동호 on 2023/02/28.
//

import Foundation

enum ImageURL {
    static let imageIds: [String] = [
        "europe-4k-1369012",
        "europe-4k-1318341",
        "europe-4k-1379801",
        "cool-lion-167408",
        "ironman-hd-323408"
    ]
    static subscript(index: Int) -> URL {
        let id = imageIds[index]
        return URL(string: "https://wallpaperaccess.com/download/"+id)!
    }
}
