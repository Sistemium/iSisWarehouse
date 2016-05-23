//
//  STMArticle+CoreDataProperties.h
//  iSistemium
//
//  Created by Maxim Grigoriev on 08/02/16.
//  Copyright © 2016 Sistemium UAB. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "STMArticle.h"

NS_ASSUME_NONNULL_BEGIN

@interface STMArticle (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *barcode;
@property (nullable, nonatomic, retain) NSString *code;
@property (nullable, nonatomic, retain) NSString *commentText;
@property (nullable, nonatomic, retain) NSDate *deviceCts;
@property (nullable, nonatomic, retain) NSDate *deviceTs;
@property (nullable, nonatomic, retain) NSString *extraLabel;
@property (nullable, nonatomic, retain) NSNumber *factor;
@property (nullable, nonatomic, retain) NSNumber *id;
@property (nullable, nonatomic, retain) NSNumber *isFantom;
@property (nullable, nonatomic, retain) NSDate *lts;
@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSData *ownerXid;
@property (nullable, nonatomic, retain) NSNumber *packageRel;
@property (nullable, nonatomic, retain) NSDecimalNumber *pieceVolume;
@property (nullable, nonatomic, retain) NSDecimalNumber *pieceWeight;
@property (nullable, nonatomic, retain) NSDecimalNumber *price;
@property (nullable, nonatomic, retain) NSString *source;
@property (nullable, nonatomic, retain) NSDate *sqts;
@property (nullable, nonatomic, retain) NSDate *sts;
@property (nullable, nonatomic, retain) NSData *xid;
@property (nullable, nonatomic, retain) NSSet<STMArticleDoc *> *articleDocs;
@property (nullable, nonatomic, retain) NSSet<STMArticleProductionInfo *> *articleProductionInfo;
@property (nullable, nonatomic, retain) NSSet<STMArticleBarCode *> *barCodes;
@property (nullable, nonatomic, retain) NSSet<STMInventoryBatch *> *inventoryBatches;
@property (nullable, nonatomic, retain) NSSet<STMPickingOrderPosition *> *pickingOrderPositions;
@property (nullable, nonatomic, retain) NSSet<STMPickingOrderPositionPicked *> *pickingOrderPositionsPicked;
@property (nullable, nonatomic, retain) NSSet<STMPrice *> *prices;
@property (nullable, nonatomic, retain) STMProductionInfoType *productionInfoType;
@property (nullable, nonatomic, retain) NSSet<STMStockBatch *> *stockBatches;
@property (nullable, nonatomic, retain) NSSet<STMSupplyOrderArticleDoc *> *supplyOrderArticleDocs;

@end

@interface STMArticle (CoreDataGeneratedAccessors)

- (void)addArticleDocsObject:(STMArticleDoc *)value;
- (void)removeArticleDocsObject:(STMArticleDoc *)value;
- (void)addArticleDocs:(NSSet<STMArticleDoc *> *)values;
- (void)removeArticleDocs:(NSSet<STMArticleDoc *> *)values;

- (void)addArticleProductionInfoObject:(STMArticleProductionInfo *)value;
- (void)removeArticleProductionInfoObject:(STMArticleProductionInfo *)value;
- (void)addArticleProductionInfo:(NSSet<STMArticleProductionInfo *> *)values;
- (void)removeArticleProductionInfo:(NSSet<STMArticleProductionInfo *> *)values;

- (void)addBarCodesObject:(STMArticleBarCode *)value;
- (void)removeBarCodesObject:(STMArticleBarCode *)value;
- (void)addBarCodes:(NSSet<STMArticleBarCode *> *)values;
- (void)removeBarCodes:(NSSet<STMArticleBarCode *> *)values;

- (void)addInventoryBatchesObject:(STMInventoryBatch *)value;
- (void)removeInventoryBatchesObject:(STMInventoryBatch *)value;
- (void)addInventoryBatches:(NSSet<STMInventoryBatch *> *)values;
- (void)removeInventoryBatches:(NSSet<STMInventoryBatch *> *)values;

- (void)addPickingOrderPositionsObject:(STMPickingOrderPosition *)value;
- (void)removePickingOrderPositionsObject:(STMPickingOrderPosition *)value;
- (void)addPickingOrderPositions:(NSSet<STMPickingOrderPosition *> *)values;
- (void)removePickingOrderPositions:(NSSet<STMPickingOrderPosition *> *)values;

- (void)addPickingOrderPositionsPickedObject:(STMPickingOrderPositionPicked *)value;
- (void)removePickingOrderPositionsPickedObject:(STMPickingOrderPositionPicked *)value;
- (void)addPickingOrderPositionsPicked:(NSSet<STMPickingOrderPositionPicked *> *)values;
- (void)removePickingOrderPositionsPicked:(NSSet<STMPickingOrderPositionPicked *> *)values;

- (void)addPricesObject:(STMPrice *)value;
- (void)removePricesObject:(STMPrice *)value;
- (void)addPrices:(NSSet<STMPrice *> *)values;
- (void)removePrices:(NSSet<STMPrice *> *)values;

- (void)addStockBatchesObject:(STMStockBatch *)value;
- (void)removeStockBatchesObject:(STMStockBatch *)value;
- (void)addStockBatches:(NSSet<STMStockBatch *> *)values;
- (void)removeStockBatches:(NSSet<STMStockBatch *> *)values;

- (void)addSupplyOrderArticleDocsObject:(STMSupplyOrderArticleDoc *)value;
- (void)removeSupplyOrderArticleDocsObject:(STMSupplyOrderArticleDoc *)value;
- (void)addSupplyOrderArticleDocs:(NSSet<STMSupplyOrderArticleDoc *> *)values;
- (void)removeSupplyOrderArticleDocs:(NSSet<STMSupplyOrderArticleDoc *> *)values;

@end

NS_ASSUME_NONNULL_END
