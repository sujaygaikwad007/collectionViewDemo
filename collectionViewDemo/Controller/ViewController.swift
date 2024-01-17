import UIKit
class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
 
        self.collectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCell")
        
        
            
        collectionView.collectionViewLayout = createCompositionalLayout()
            

    
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }
    

    
      func createCompositionalLayout() -> UICollectionViewCompositionalLayout{
           // Item
           let item = CompositionalLayout.createItem(width: .fractionalWidth(0.65), height: .fractionalHeight(1), spacing: 5)
           
           let verticalGroupItem = CompositionalLayout.createItem(width: .fractionalWidth(1), height: .fractionalHeight(1), spacing: 5)
           
           let horizontalGroupItem = CompositionalLayout.createItem(width: .fractionalWidth(0.3), height: .fractionalHeight(1), spacing: 5)
           
           // group
           
           
           let verticalGroup = CompositionalLayout.createGroup(alignment: .vertical, width: .fractionalWidth(0.35), height: .fractionalHeight(1), item: verticalGroupItem, count: 2)

           
           var horizontalgroup = CompositionalLayout.createGroup(alignment: .horizontal, width: .fractionalWidth(1), height: .absolute(250), items: [item, verticalGroup])
  
          
           let horizontalGroup2 = CompositionalLayout.createGroup(alignment: .horizontal, width: .fractionalWidth(1), height: .absolute(170), item: horizontalGroupItem, count: 3)
           
           let horizontalMainGroup = CompositionalLayout.createGroup(alignment: .vertical, width: .fractionalWidth(1), height: .absolute(420), items: [horizontalgroup, horizontalGroup2])
           
           // section
           let section = NSCollectionLayoutSection(group: horizontalMainGroup)
           
           // return
           return UICollectionViewCompositionalLayout(section: section)
       }

    
}

extension ViewController : UICollectionViewDelegate ,UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("Image count is-----\(images.count)")
        return 9
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
      let  cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        
        
        cell.collectionImage.image = UIImage(named: images[indexPath.item])
//        cell.collectionLbl.text = labels[indexPath.row]
    
        
        cell.layer.cornerRadius = 10
        cell.layer.shadowColor = UIColor(red: 0.82, green: 0.82, blue: 0.82, alpha: 1.0).cgColor
        cell.layer.shadowOffset = CGSize.zero
        cell.layer.shadowOpacity = 1
        cell.layer.shadowRadius = 8
        cell.layer.borderWidth = 1
        cell.layer.masksToBounds = false
       

        return cell
        
        
        
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedIndex = indexPath.item
        print("selected index--\(selectedIndex)")
    }
    
    
    
    
    
}





