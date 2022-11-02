private func fetchImage(model: CatImageCellModel, timeout: Int) {
    guard timeout > 0 else { return }

        model.fetchCatImage(completion: { [weak self] result in
            
            DispatchQueue.main.async{ [weak self] in
                switch result {
                case .success(let image): 
                    self?.imageView.image = image
                
                case .failure(let error):
                    switch error {
                        case .timeout: 
                            self?.fetchImage(model: model, timeout: timeout-1)
                        
                        case .unknown: 
                            self?.imageView.image = model.placeholderImage
                    }
                }
            }
        })
}