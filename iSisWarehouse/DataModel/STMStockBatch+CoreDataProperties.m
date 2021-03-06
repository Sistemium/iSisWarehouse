//
//  STMStockBatch+CoreDataProperties.m
//  iSistemium
//
//  Created by Maxim Grigoriev on 21/02/16.
//  Copyright © 2016 Sistemium UAB. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "STMStockBatch+CoreDataProperties.h"

@implementation STMStockBatch (CoreDataProperties)

@dynamic isInventarized;
@dynamic processing;
@dynamic productionInfo;
@dynamic volume;
@dynamic stockToken;
@dynamic article;
@dynamic barCodes;
@dynamic inventoryBatches;
@dynamic pickingOrderPositionsPicked;

@end
