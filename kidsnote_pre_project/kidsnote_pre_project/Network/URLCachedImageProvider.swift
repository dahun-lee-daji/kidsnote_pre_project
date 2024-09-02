//
//  URLCachedImageProvider.swift
//  kidsnote_pre_project
//
//  Created by 이다훈 on 9/2/24.
//

import UIKit

class URLCachedImageProvider {
    private let session: URLSession
    private let cache: URLCache
    
    static let shared = URLCachedImageProvider()
    
    init(
        memoryCapacity: Int = 500 * 1024 * 1024, // 500MB
        diskCapacity: Int = 1024 * 1024 * 1024, // 1GB
        cacheDirectory: String = "url_cached_images"
    ) {
        self.cache = URLCache(
            memoryCapacity: memoryCapacity,
            diskCapacity: diskCapacity,
            diskPath: cacheDirectory
        )
        
        let configuration = URLSessionConfiguration.defaultImageCache
        configuration.urlCache = cache
        
        self.session = URLSession(configuration: configuration)
    }
    
    func loadImage(from url: URL) async throws -> UIImage {
        let request = URLRequest(url: url)
        
        if 
            let cachedResponse = cache.cachedResponse(for: request),
            let image = UIImage(data: cachedResponse.data)
        {
            return image
        }
        
        // 캐시된 이미지가 없는 경우 네트워크 요청 수행
        let (data, response) = try await session.data(for: request)
        
        guard let image = UIImage(data: data) else {
            throw URLCachedImageProviderError.failTransformDataToImage
        }
        let cachedData = CachedURLResponse(response: response, data: data)
        self.cache.storeCachedResponse(cachedData, for: request)
        
        return image
    }
    
}

extension URLCachedImageProvider {
    enum URLCachedImageProviderError: Error {
        case failTransformDataToImage
    }
}

private extension URLSessionConfiguration {
    final class var defaultImageCache: URLSessionConfiguration {
        let configuration = Self.default
        configuration.timeoutIntervalForRequest = 5.0
        configuration.timeoutIntervalForResource = 5.0
        configuration.requestCachePolicy = .useProtocolCachePolicy
        return configuration
    }
}

