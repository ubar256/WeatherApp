import UIKit

class WeatherCollectionView: UICollectionView {
  private var viewModel: [Daily]?

  init() {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal
    super.init(frame: .zero, collectionViewLayout: layout)
    backgroundColor = .white
    delegate = self
    dataSource = self
    register(WeatherCollectionViewCell.self, forCellWithReuseIdentifier: WeatherCollectionViewCell.reuseId)
    
    translatesAutoresizingMaskIntoConstraints = false
    layout.minimumLineSpacing = 15
    contentInset = UIEdgeInsets(top: 0, left: 40, bottom: 0, right: 40)
    
    showsHorizontalScrollIndicator = false
    showsVerticalScrollIndicator = false
  }
  
  //MARK:- Updating viewModel on viewController
  func updateViewModel(with newModel: [Daily]) {
    viewModel = newModel
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension WeatherCollectionView: UICollectionViewDataSource {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    viewModel?.count ?? 0
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = dequeueReusableCell(withReuseIdentifier: WeatherCollectionViewCell.reuseId, for: indexPath) as? WeatherCollectionViewCell,
    let viewModel = viewModel else { return UICollectionViewCell() }
    let day = viewModel[indexPath.row]
    cell.update(with: day)
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    CGSize(width: 180, height: frame.height * 0.8)
  }
}

extension WeatherCollectionView: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {}
