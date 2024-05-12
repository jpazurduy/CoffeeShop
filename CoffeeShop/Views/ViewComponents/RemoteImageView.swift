//
//  RemoteImageView.swift
//  CoffeeShop
//
//  Created by Jorge Azurduy on 5/12/24.
//

import SwiftUI
import CachedAsyncImage

struct RemoteImageView: View {
    // MARK: - PROPERTIES
    private var url: URL?
    
    // MARK: - FUNCTIONS
    init(url: URL? = nil) {
        self.url = url
    }
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            CachedAsyncImage(url: url) { image in
                image
                    .resizable()
            } placeholder: {
                Image(systemName: "photo")
                    .resizable()
                    .frame(maxWidth: 60, maxHeight: 60)
                    .foregroundColor(.gray)
            }

        }
    }
}

// MARK: - PREVIEW
struct RemoteImageView_Previews: PreviewProvider {
    static var previews: some View {
        RemoteImageView()
    }
}
