//
//  URLSessionVCViewController.swift
//  AbdulHasib_iOS
//
//  Created by Abdul Hasib on 16/09/25.
//

import UIKit

class URLSessionVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
  
    
    var mediaLists : [PlaylistMediaList] = []
    @IBOutlet weak var tringMediaTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tringMediaTableView.delegate = self
        tringMediaTableView.dataSource = self
        Task {
                do {
                   
                    let response = try await fetchPlaylistDataFromJw()
                    self.mediaLists = response.playlist
                    DispatchQueue.main.async {
                                self.tringMediaTableView.reloadData()  // ✅ Refresh table after data is set
                            }
                    
                } catch {
                    print("❌ Error fetching playlist: \(error)")
                }
            }
        // Do any additional setup after loading the view.
    }
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mediaLists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TringMediaCell", for: indexPath) as! TringMediaCell
        let mediaList = mediaLists[indexPath.row]
        cell.mediaTitleLabel.text = mediaList.title
        cell.mediaDescriptionLabel.text = mediaList.description
        cell.mediaImageView.loadImage(from: mediaList.image)
     
        print(mediaLists)
        return cell
    }
    func fetchPlaylistDataFromJw() async throws -> PlaylistResponse{
        let url = URL(string: "https://cdn.jwplayer.com/v2/playlists/QPgqxwQB")!
        let (data, _) = try await URLSession.shared.data(from: url)
        let decoded = try JSONDecoder().decode(PlaylistResponse.self, from: data)
        return decoded.self
    }

    

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension UIImageView{
     func loadImage(from imageString: String) {
        
        guard let imageUrl = URL(string: imageString) else{ return }
        
        DispatchQueue.global() .async {
            if let imageData = try? Data(contentsOf: imageUrl),
               let image = UIImage(data: imageData){
                DispatchQueue.main .async {
                    self.image = image
                }
            }
        }

    }
}
