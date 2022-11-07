import Foundation

final class CatImageCell: UICollectionViewCell {

    private var imageView: UIImageView!

    convenience init(imageView: UIImageView) {
        self.init()
        self.imageView = imageView
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
    }

    func set(model: CatImageCellModel) {
        imageView.image = model.placeholderImage
        fetchImage(model: model, timeout: 3)
    }

    private func fetchImage(model: CatImageCellModel, timeout: Int) {
        guard timeout > 0 else { return }
        model.fetchCatImage({ [weak self] result in 
            DispatchQueue.main.async{ [weak self] in
                switch result {
                    case .success (let image):
                        self?.imageView.image = image
                    case .failure (let error): 
                        switch error {
                            case .timeout:
                                self?.fetchImage(model: model, timeout: timeout - 1)
                            case .unknown: 
                                self?.imageView.image = model.placeholderImage
                        }
                }
            }
        })
    }
}