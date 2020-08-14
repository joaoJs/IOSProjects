//
//  MovieViewModel.swift
//  MovieSample
//
//  Created by iAskedYou2nd on 8/4/20.
//  Copyright © 2020 iAskedYou2nd. All rights reserved.
//

import UIKit

let firstUrl: String = "https://rss.itunes.apple.com/api/v1/gw/apple-music/coming-soon/all/100/explicit.json"
let defaultEighth = "https://cdn1.macworld.co.uk/cmsdata/features/3630990/sync_itunes_apple_music_thumb800.jpg"



class AlbumViewModel {
    
    var count: Int {
        return self.albums.count
    }
    
    func name(index: Int) -> String {
        return self.albums[index].name ?? "default album name"
    }
    
    func artistName(index: Int) -> String {
        return self.albums[index].artistName ?? "default artist name"
    }
    
    func releaseDate(index: Int) -> String {
        return self.albums[index].releaseDate
    }
    
    func artworkUrl100(index: Int) -> String {
        return self.albums[index].artworkUrl100 ?? "default img url"
    }
    
    func genres(index: Int) -> [Genre] {
        return self.albums[index].genres
    }
    
    
    private var albums: [Album] = [] {
        didSet {
            guard oldValue.count != self.albums.count else { return }
            self.update?()
        }
    }
    private var update: (() -> ())?
    private var error: ((NetworkError) -> ())?
    private let service: NetworkManager
    var imagesDict: ImagesDict
    
    init() {
        self.service = NetworkManager.shared
        self.imagesDict = ImagesDict.shared
        //self.cache = cache
    }
    
    func bind(updateHandler: @escaping () -> (), errorHandler: @escaping (NetworkError) -> ()) {
        self.update = updateHandler
        self.error = errorHandler
    }
    
    func fetchAlbums() {
            
            self.service.fetchAlbums(firstUrl: firstUrl){ (result) in
                switch result {
                case .success(let feeds):

                    self.albums = feeds.results
                    let context = GlobalContext.shared.context
    
                    feeds.results.forEach{ album in
    
                        let albumModel = AlbumModel(context: context)
    
                        albumModel.setValue(album.id, forKey: "id")
                        albumModel.setValue(album.name, forKey: "name")
                        albumModel.setValue(album.artistName, forKey: "artistName")
                        albumModel.setValue(album.releaseDate, forKey: "releaseDate")
                        albumModel.setValue(album.artworkUrl100, forKey: "artworkUrl100")
                        albumModel.setValue(false, forKey: "isFavorite")
    
                        album.genres.forEach{ genre in
                            let genreM = GenreModel(context: context)
                            genreM.name = genre.name
                            albumModel.addToGenres(genreM)
                        }
    
    
                        do {
                            try context.save()
                            print("Success")
                        } catch {
                            print("Error saving: \(error)")
                        }
                    }
                    
                case .failure(let error):
                    print(error.localizedDescription)
                    self.error?(error)
                }
            }
        }
    
    
        
        
    func fetchAlbumImage(albumId: String, albumImgUrl: String, index: Int, closure: @escaping (UIImage) -> ()) {
      
        self.service.fetchAlbumImage(albumId: albumId, albumImgUrl: albumImgUrl) { (result) in
            switch result {
                    case .success(let image):
                       
                        guard let img = image else {return}
                        closure(img)
    
                    case .failure(let error):
                        print("error fetching album")
                        print(error)
                    }
            }
        
        
    }
    
    func fetchDataFromCoreData(i: Int, closure: @escaping (String,String,String,String,Bool) -> ()) {
        guard let imageUrl = AlbumsFromCoreData.shared.albums[i].artworkUrl100 else {return}
        guard let albumId = AlbumsFromCoreData.shared.albums[i].id else {return }
        guard let albumName = AlbumsFromCoreData.shared.albums[i].name else {return }
        guard let artistName = AlbumsFromCoreData.shared.albums[i].artistName else {return }
        let isFavorite = AlbumsFromCoreData.shared.albums[i].isFavorite
        
        closure(imageUrl,albumId,albumName,artistName,isFavorite)
    }

    
}

