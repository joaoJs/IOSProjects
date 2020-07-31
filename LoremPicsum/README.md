# Lorem Picsum

Little project that uses the lorem picsum api to fetch images. 

The project uses codable to decode the json that comes as a response from the request. 

The most difficult part for me was 


```swift
let images = try self.decoder.decode([Image].self, from: data)
            completion(.success(images))
```

it tooke me a while that I needed to pass [Image].self as the first argument for the decode method. 

## autor 

Joao Campos