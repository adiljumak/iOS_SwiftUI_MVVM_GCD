//
//  Detail.swift
//  Assignment3
//
//  Created by Adilzhan Jumakanov on 14.10.2021.
//

import SwiftUI
import Combine



struct Detail: View {
    @Environment(\.presentationMode) var presentationMode
    var url: String
   
    
    var body: some View {
        
//        Image(systemName: "person.fill")
//                    .data(url: url)
//                    .scaleEffect()
        ImageWithURL(url)
        

        Button(action: {
            presentationMode.wrappedValue.dismiss()
        }, label: {
            Text("Cancel")
        })
    
    }
    
    
   
    
}

struct Detail_Previews: PreviewProvider {
    static var previews: some View {
        Detail(url: "")
    }
}
//extension Image {
//    func data(url:URL) -> Self {
//        let queue = DispatchQueue.global(qos: .utility)
//
//        queue.async {
//
//            if let data = try? Data(contentsOf: url) {
//
//                DispatchQueue.main.async {
//                    let image = Image(uiImage: UIImage(data: data)!).resizable()
//                }
//            }
//        }
//
//        if let data = try? Data(contentsOf: url) {
//            return Image(uiImage: UIImage(data: data)!)
//                .resizable()
//        }
//        return self
//            .resizable()
//    }
//}

struct ImageWithURL: View {
    
    @ObservedObject var imageLoader: ImageLoaderAndCache

    init(_ url: String) {
        imageLoader = ImageLoaderAndCache(imageURL: url)
    }

    var body: some View {
          Image(uiImage: UIImage(data: self.imageLoader.imageData) ?? UIImage())
              .resizable()
              .clipped()
    }
}

class ImageLoaderAndCache: ObservableObject {
    
    @Published var imageData = Data()
    
    init(imageURL: String) {
        let cache = URLCache.shared
        let request = URLRequest(url: URL(string: imageURL)!, cachePolicy: URLRequest.CachePolicy.returnCacheDataElseLoad, timeoutInterval: 60.0)
        if let data = cache.cachedResponse(for: request)?.data {
            self.imageData = data
        } else {
            URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
                if let data = data, let response = response {
                let cachedData = CachedURLResponse(response: response, data: data)
                                    cache.storeCachedResponse(cachedData, for: request)
                    DispatchQueue.main.async {
                        self.imageData = data
                    }
                }
            }).resume()
        }
    }
}
