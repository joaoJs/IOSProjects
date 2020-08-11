import UIKit

final class AlbumsFromCoreData {

    static let shared = AlbumsFromCoreData()
    
    var albums: [AlbumModel]
    
    private init(albumList: [AlbumModel] = []) {
        self.albums = albumList
    }
    
}
