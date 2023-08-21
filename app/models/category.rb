class Category < ActiveHash::Base
    self.data = [
      { id: 1, name: '---' },
      { id: 2, name: '往診のみ' },
      { id: 3, name: '看護のみ' },
      { id: 4, name: '往診と看護の併用' },
      { id: 5, name: 'オンライン診療' },
    ]

    include ActiveHash::Associations
    has_many :requests

end
