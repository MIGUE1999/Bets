import Foundation

final class BetMapper {
    static func entityToModel(_ entity: BetEntity) -> BetModel {
        BetModel(name: entity.name,
                 sellIn: entity.sellIn,
                 quality: entity.quality)
    }

    static func modelToEntity(_ model: BetModel) -> BetEntity {
        BetEntity(name: model.name,
                  sellIn: model.sellIn,
                  quality: model.quality)
    }
}
