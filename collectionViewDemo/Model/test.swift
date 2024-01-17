//import UIKit
//class ViewController: UIViewController {
//
//    @IBOutlet weak var collectionView: UICollectionView!
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//
//        self.collectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCell")
//
//
//        collectionView.delegate = self
//        collectionView.dataSource = self
//
//    }
//
//
//
//}
//
//extension ViewController : UICollectionViewDelegate ,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
//
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        print("Image count is-----\(images.count)")
//        return images.count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//
//      let  cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
//
//
//        cell.layer.cornerRadius = 10
//        cell.layer.shadowColor = UIColor(red: 0.82, green: 0.82, blue: 0.82, alpha: 1.0).cgColor
//        cell.layer.shadowOffset = CGSize.zero
//        cell.layer.shadowOpacity = 1
//        cell.layer.shadowRadius = 8
//        cell.layer.borderWidth = 1
//        cell.layer.masksToBounds = false
//
//
//        if [0,1,3,4].contains(indexPath.row) {
//
//            cell.collectionImage.image = UIImage(named: images[0])
//            cell.collectionLbl.text = labels[0]
//
//        } else {
//
//            cell.collectionImage.image = UIImage(named: images[indexPath.item])
//            cell.collectionLbl.text = labels[indexPath.row]
//        }
//
//
//
//        return cell
//
//
//
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//                let size = (collectionView.frame.size.width - 30) / 3
//                return CGSize(width: size, height: 150)
//
//
//    }
//
//
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let selectedIndex = indexPath.item
//        print("selected index--\(selectedIndex)")
//    }
//
//
//
//
//
//}
//
//
//
//
//


//func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
//
//
//    //--Group1----
//    let group1Item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/2), heightDimension: .fractionalHeight(1)))
//    group1Item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10)
//
//    let nestedGroupItem1 = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1/2)))
//    nestedGroupItem1.contentInsets = NSDirectionalEdgeInsets(top: 1, leading: 0, bottom: 1, trailing: 0)
//
//
//    let nestedGroup1 = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/2), heightDimension: .fractionalHeight(1)), subitems: [nestedGroupItem1])
//
//    let group1 = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1/3)), subitems: [group1Item, nestedGroup1])
//    group1.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0)
//
//
//
//    //--Group2----
//
//    let group2Item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/3), heightDimension: .fractionalHeight(1)))
//
//    group2Item.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 0, trailing: 10)
//
//
//    let group2 = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1/3)), subitems: [group2Item])
//
//
//
//
//    //Group3---
//
//    let group3Item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/2), heightDimension: .fractionalHeight(1)))
//    group3Item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10)
//
//    let nestedGroupItem3 = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1/2)))
//    nestedGroupItem3.contentInsets = NSDirectionalEdgeInsets(top: 1, leading: 0, bottom: 1, trailing: 0)
//
//
//    let nestedGroup3 = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/2), heightDimension: .fractionalHeight(1)), subitems: [nestedGroupItem3])
//
//    let group3 = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1/3)), subitems: [nestedGroup3,group3Item])
//
//    group3.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0)
//
//
//
//
//
//    //--Container Group----
//
//    let containerGroup = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)), subitems: [group1,group2,group3])
//
//    let section = NSCollectionLayoutSection(group: containerGroup)
//    let layout = UICollectionViewCompositionalLayout(section: section)
//    return layout
//
//}

//func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
//
//
//     //--Group1----
//     let group1Item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/2), heightDimension: .fractionalHeight(1)))
//     group1Item.contentInsets = NSDirectionalEdgeInsets(top: 3, leading: 10, bottom: 3, trailing: 10)
//
//     let nestedGroupItem1 = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1/2)))
//     nestedGroupItem1.contentInsets = NSDirectionalEdgeInsets(top: 3, leading: 0, bottom: 3, trailing: 0)
//
//
//     let nestedGroup1 = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/2), heightDimension: .fractionalHeight(1)), subitems: [nestedGroupItem1])
//
//     let group1 = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1/3)), subitems: [group1Item, nestedGroup1])
//     group1.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0)
//
//
//
//     //--Group2----
//
//     let group2Item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/3), heightDimension: .fractionalHeight(1)))
//
//     group2Item.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 0, trailing: 10)
//
//
//     let group2 = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1/5)), subitems: [group2Item])
//
//
//
//
//     //Group3---
//
//     let group3Item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/2), heightDimension: .fractionalHeight(1)))
//     group3Item.contentInsets = NSDirectionalEdgeInsets(top: 3, leading: 10, bottom: 3, trailing: 10)
//
//     let nestedGroupItem3 = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1/2)))
//     nestedGroupItem3.contentInsets = NSDirectionalEdgeInsets(top: 3, leading: 0, bottom: 3, trailing: 0)
//
//
//     let nestedGroup3 = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/2), heightDimension: .fractionalHeight(1)), subitems: [nestedGroupItem3])
//
//     let group3 = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1/3)), subitems: [nestedGroup3,group3Item])
//
//     group3.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0)
//
//
//
//
//
//     //--Container Group----
//
//     let containerGroup = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(600)), subitems: [group1,group2,group3])
//
//
//
//     let section = NSCollectionLayoutSection(group: containerGroup)
//     let layout = UICollectionViewCompositionalLayout(section: section)
//     return layout
//
// }
