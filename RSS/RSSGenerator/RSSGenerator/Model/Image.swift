import UIKit

//image of the album, the title of the album, and the artist name

struct ResponseObj: Codable {
    var feed: Feed
    
    enum CodingKeys: String, CodingKey {
        case feed
    }
}

struct Feed: Codable {
    var results: [Album]
    
    enum CodingKeys: String, CodingKey {
        case results
    }
}


struct Album: Codable {
    
    var artistName: String?
    var id: String
    //var releaseDate: String
    var name: String?
//    var kind: String
//    var copyright: String
//    var artistId: String
//    var artistUrl: String
    var artworkUrl100: String?
    //var genres: [Genre]
    //var url: String
    
    enum CodingKeys: String, CodingKey {
        case artistName,
             id,
//             releaseDate,
             name,
//             kind,
//             copyright,
//             artistId,
//             artistUrl,
             artworkUrl100
//             genres,
//             url
    }
}

struct Genre: Codable {
    var genreId: String
    var name: String
    var url: String
}

//{
//"artistName": "Navy Kenzo",
//"id": "1523625704",
//"releaseDate": "2020-09-04",
//"name": "Story of the African Mob",
//"kind": "album",
//"copyright": "℗ 2020 Story Of The African Mob",
//"artistId": "924853469",
//"artistUrl": "https://music.apple.com/gw/artist/navy-kenzo/924853469?app=music",
//"artworkUrl100": "https://is4-ssl.mzstatic.com/image/thumb/Music124/v4/9d/07/0c/9d070cbb-b180-e25f-b0ac-60cfb4c6a3de/0757572910892.png/200x200bb.png",
//"genres": [
//{
//"genreId": "19",
//"name": "Worldwide",
//"url": "https://itunes.apple.com/gw/genre/id19"
//},
//{
//"genreId": "34",
//"name": "Music",
//"url": "https://itunes.apple.com/gw/genre/id34"
//}
//],
//"url": "https://music.apple.com/gw/album/story-of-the-african-mob/1523625704?app=music"
//},
