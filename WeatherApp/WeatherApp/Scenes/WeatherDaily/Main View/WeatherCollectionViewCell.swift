import UIKit

class WeatherCollectionViewCell: UICollectionViewCell {
  static let reuseId = "WeatherCollectionViewCell"
  
  var mainImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.backgroundColor = .white
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.contentMode = .scaleAspectFit
    return imageView
  }()
  
  var weekLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.backgroundColor = .white
    label.textColor = .black
    label.font = .systemFont(ofSize: 22, weight: .thin)
    return label
  }()
  
  var tempDayLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.backgroundColor = .white
    label.textColor = .black
    label.font = .systemFont(ofSize: 22, weight: .light)
    return label
  }()
  
  var tempNightLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.backgroundColor = .white
    label.textColor = .black
    label.font = .systemFont(ofSize: 22, weight: .light)
    return label
  }()
  
  var dayLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.backgroundColor = .white
    label.textColor = .black
    label.font = .systemFont(ofSize: 20, weight: .thin)
    return label
  }()
  
  var nightLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.backgroundColor = .white
    label.textColor = .black
    label.font = .systemFont(ofSize: 20, weight: .thin)
    return label
  }()
  
  var descriptionLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.backgroundColor = .white
    label.textColor = .black
    label.font = .systemFont(ofSize: 17, weight: .regular)
    return label
  }()
  
  //MARK: -Creation of Image with weather id
  func createImage(with id: Weather)-> UIImage {
    
      let id: Int = id.id
      var image: UIImage? {
        switch id {
        case 200...232:
          return UIImage(systemName: "cloud.bolt.rain.fill")
        case 300...321:
          return UIImage(systemName: "cloud.drizzle")
        case 500...531:
          return UIImage(systemName: "cloud.rain")
        case 600...622:
          return UIImage(systemName: "snow")
        case 701...781:
          return UIImage(systemName: "tornado")
        case 800:
          return UIImage(systemName: "sun.min")
        case 801...804:
          return UIImage(systemName: "cloud")
        default:
          return UIImage(systemName: "aqi.medium")
        }
      }
      return image!
  }
  
  //MARK: -Convertion API date to readable day of week
  func converWeek(with date: Daily)-> String {
    let apiDay: Int = date.dt
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "EEEE"
    let unixTime = NSDate(timeIntervalSince1970: TimeInterval(apiDay))
    let normalDate = dateFormatter.string(from: unixTime as Date)
    return normalDate
  }
  
  // MARK: -Updating cell with items
  func update(with model: Daily) {
      weekLabel.text = converWeek(with: model)
      tempDayLabel.text = String(model.temp.day)
      tempNightLabel.text = String(model.temp.night)
      dayLabel.text = "Day:"
      nightLabel.text = "Night:"
      mainImageView.image = createImage(with: model.weather[0])
      descriptionLabel.text = model.weather[0].description
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    backgroundColor = .white
    
    //MARK: -Constraints for image im cells
    addSubview(mainImageView)
    mainImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    mainImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    mainImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.4).isActive = true
    mainImageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5).isActive = true
    
    // MARK: -Constraints for label
    addSubview(weekLabel)
    weekLabel.topAnchor.constraint(equalTo: topAnchor, constant: 2).isActive = true
    weekLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    
    addSubview(tempDayLabel)
    tempDayLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 2).isActive = true
    tempDayLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -2).isActive = true
    
    addSubview(tempNightLabel)
    tempNightLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -2).isActive = true
    tempNightLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -2).isActive = true
    
    addSubview(dayLabel)
    dayLabel.leadingAnchor.constraint(equalTo: tempDayLabel.leadingAnchor).isActive = true
    dayLabel.bottomAnchor.constraint(equalTo: tempDayLabel.topAnchor, constant: -2).isActive = true
    
    addSubview(nightLabel)
    nightLabel.trailingAnchor.constraint(equalTo: tempNightLabel.trailingAnchor).isActive = true
    nightLabel.bottomAnchor.constraint(equalTo: tempNightLabel.topAnchor, constant: -2).isActive = true
    
    addSubview(descriptionLabel)
    descriptionLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    descriptionLabel.centerYAnchor.constraint(equalTo: weekLabel.centerYAnchor, constant: 30).isActive = true
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    layer.cornerRadius = 5
    layer.shadowRadius = 8
    layer.shadowOpacity = 0.5
    layer.shadowOffset = CGSize(width: 5, height: 8)
    clipsToBounds = false
    layer.masksToBounds = false
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
