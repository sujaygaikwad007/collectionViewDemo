import UIKit
import Alamofire
import AlamofireImage

class SecondViewController: UIViewController {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var images: [UIImage] = []
    private let shimmerView = ShimmerView()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView.register(UINib(nibName: "SecondCollectionViewCell", bundle: nil),
                                     forCellWithReuseIdentifier: "SecondCollectionViewCell")
        
        
        collectionView.collectionViewLayout = createCompositionalLayout()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        
        
        
        fetchPhoto()
        
        
        
        
        
    }
    
    
    func createCompositionalLayout() -> UICollectionViewCompositionalLayout{
        // Item
        let item = CompositionalLayout.createItem(width: .fractionalWidth(0.65), height: .fractionalHeight(1), spacing: 5)
        
        let verticalGroupItem = CompositionalLayout.createItem(width: .fractionalWidth(1), height: .fractionalHeight(1), spacing: 5)
        
        let horizontalGroupItem = CompositionalLayout.createItem(width: .fractionalWidth(0.3), height: .fractionalHeight(1), spacing: 5)
        
        
        
        let verticalGroup = CompositionalLayout.createGroup(alignment: .vertical, width: .fractionalWidth(0.35), height: .fractionalHeight(1), item: verticalGroupItem, count: 2)
        
        
        var horizontalgroup = CompositionalLayout.createGroup(alignment: .horizontal, width: .fractionalWidth(1), height: .absolute(250), items: [item, verticalGroup])
        
        
        let horizontalGroup2 = CompositionalLayout.createGroup(alignment: .horizontal, width: .fractionalWidth(1), height: .absolute(170), item: horizontalGroupItem, count: 3)
        
        let horizontalMainGroup = CompositionalLayout.createGroup(alignment: .vertical, width: .fractionalWidth(1), height: .absolute(420), items: [horizontalgroup, horizontalGroup2])
        
        // section
        let section = NSCollectionLayoutSection(group: horizontalMainGroup)
        
        // return
        return UICollectionViewCompositionalLayout(section: section)
    }
    
    func fetchPhoto() {
        
        let url = "https://dog.ceo/api/breeds/image/random/9"
        AF.request(url).responseDecodable(of: DogApiResponse.self) { response in
            switch response.result {
            case .success(let dogApiResponse):
                self.images.removeAll()
                for imageUrlString in dogApiResponse.message {
                    if let imageUrl = URL(string: imageUrlString) {
                        AF.request(imageUrl).responseImage { response in
                            if case .success(let image) = response.result {
                                self.images.append(image)
                                self.collectionView.reloadData()
                                
                                print("Success-----\(imageUrl)")
                                
                                
                                
                            }
                        }
                    }
                }
                
                
            case .failure(let error):
                
                print("Error fetching dog photos: \(error.localizedDescription)")
                
                
                
            }
        }
    }
    
    
}

extension SecondViewController : UICollectionViewDelegate ,UICollectionViewDataSource{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("Image count is-----\(images.count)")
        return images.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SecondCollectionViewCell", for: indexPath) as! SecondCollectionViewCell
        
        
        if images.isEmpty {
            
            cell.startShimmering()
        } else {
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                cell.stopShimmering()
                let image = self.images[indexPath.item]
                cell.collectionImage.image = image
                
                cell.layer.cornerRadius = 10
                cell.layer.shadowColor = UIColor(red: 0.82, green: 0.82, blue: 0.82, alpha: 1.0).cgColor
                cell.layer.shadowOffset = CGSize.zero
                cell.layer.shadowOpacity = 1
                cell.layer.shadowRadius = 1
                cell.layer.borderWidth = 1
                cell.layer.masksToBounds = false
            }
            
            
        }
        
        
        
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedIndex = indexPath.item
        print("selected index--\(selectedIndex)")
    }
}


