//
//  STMPickingOrdersProcessController.m
//  iSistemium
//
//  Created by Maxim Grigoriev on 24/11/15.
//  Copyright © 2015 Sistemium UAB. All rights reserved.
//

#import "STMPickingOrdersProcessController.h"

#import "STMObjectsController.h"
#import "STMStockBatchOperationController.h"

#import "STMSoundController.h"


@implementation STMPickingOrdersProcessController

+ (void)updateVolumesWithIncreaseVolumeForPositionPicked:(STMPickingOrderPositionPicked *)positionPicked {
    
    STMPickingOrderPosition *position = positionPicked.pickingOrderPosition;
    
    STMPickingOrderPositionPicked *firstPositionPicked = [self firstPositionPickedFromPosition:position];
    
    if (firstPositionPicked && ![positionPicked isEqual:firstPositionPicked]) {
        
        NSInteger packageRel = position.article.packageRel.integerValue;
        
        NSUInteger volumeStep = (position.volume.integerValue > (2 * packageRel)) ? packageRel : 1;
        
        NSInteger incrementedVolume = positionPicked.volume.integerValue + volumeStep;
        
        if (incrementedVolume < position.volume.integerValue) {

            NSInteger decrementedVolume = firstPositionPicked.volume.integerValue - volumeStep;

            if (decrementedVolume > 0) {
                
                positionPicked.volume = @(incrementedVolume);
                firstPositionPicked.volume = @(decrementedVolume);
                
                [[self document] saveDocument:^(BOOL success) {
                    
                }];
                
            } else {
                
                NSNumber *volumeSum = [position.pickingOrderPositionsPicked valueForKeyPath:@"@sum.volume"];
                NSInteger remainingVolume = position.volume.integerValue - volumeSum.integerValue;
                
                if (volumeStep >= remainingVolume) {
                    
                    positionPicked.volume = @(incrementedVolume);

                    [[self document] saveDocument:^(BOOL success) {
                        
                    }];
                    
                } else {
                    
                    [STMSoundController playAlert];

                }
                
            }
                
        } else {
            
            [STMSoundController playAlert];
            
        }
        
    }
    
}

+ (void)updateVolumesWithDeletePositionPicked:(STMPickingOrderPositionPicked *)positionPicked {
    
    STMPickingOrderPosition *position = positionPicked.pickingOrderPosition;
    NSInteger deletedPositionVolume = positionPicked.volume.integerValue;
    
    [STMObjectsController createRecordStatusAndRemoveObject:positionPicked];
    
    STMPickingOrderPositionPicked *firstPositionPicked = [self firstPositionPickedFromPosition:position];

    if (firstPositionPicked) {
        
        NSInteger incrementedVolume = firstPositionPicked.volume.integerValue + deletedPositionVolume;

        if (incrementedVolume > position.volume.integerValue) {
            incrementedVolume = position.volume.integerValue;
        }
        
        firstPositionPicked.volume = @(incrementedVolume);
        
        [[self document] saveDocument:^(BOOL success) {
            
        }];

    }
    
}

+ (void)updateVolumesWithNewVolume:(NSInteger)newVolume forPositionPicked:(STMPickingOrderPositionPicked *)positionPicked {
    
    STMPickingOrderPosition *position = positionPicked.pickingOrderPosition;
    STMPickingOrderPositionPicked *firstPositionPicked = [self firstPositionPickedFromPosition:position];

    if (![positionPicked isEqual:firstPositionPicked]) {
     
        NSInteger diff = positionPicked.volume.integerValue - newVolume;
        firstPositionPicked.volume = @(firstPositionPicked.volume.integerValue + diff);
        
    }

    positionPicked.volume = @(newVolume);

    [[self document] saveDocument:^(BOOL success) {
        
    }];

}

+ (STMPickingOrderPositionPicked *)firstPositionPickedFromPosition:(STMPickingOrderPosition *)position {
    
    NSSortDescriptor *ctsDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"deviceCts"
                                                                    ascending:YES
                                                                     selector:@selector(compare:)];
    
    NSArray *sortedPositionsPicked = [position.pickingOrderPositionsPicked sortedArrayUsingDescriptors:@[ctsDescriptor]];
    
    return sortedPositionsPicked.firstObject;

}

+ (STMPickingOrderPositionPicked *)createPositionPickedForStockBatch:(STMStockBatch *)stockBatch andPosition:(STMPickingOrderPosition *)position withFullVolume:(BOOL)fullVolume barCodeScan:(STMBarCodeScan *)barCodeScan {
    
    STMPickingOrderPositionPicked *positionPicked = (STMPickingOrderPositionPicked *)[STMObjectsController newObjectForEntityName:NSStringFromClass([STMPickingOrderPositionPicked class]) isFantom:NO];
    
    positionPicked.pickingOrderPosition = position;
    positionPicked.volume = (fullVolume) ? position.volume : 0;
    positionPicked.stockToken = stockBatch.stockToken;
    positionPicked.article = stockBatch.article;
    
    if (stockBatch.article.productionInfoType) {
        positionPicked.productionInfo = stockBatch.productionInfo;
    }
    
    [self linkBarCodeScan:barCodeScan withPositionPicked:positionPicked];
    
    [self.document saveDocument:^(BOOL success) {
        
    }];
    
    return positionPicked;
    
}

+ (void)linkBarCodeScan:(STMBarCodeScan *)barCodeScan withPositionPicked:(STMPickingOrderPositionPicked *)positionPicked {
    
    barCodeScan.destinationEntity = NSStringFromClass([positionPicked class]);
    barCodeScan.destinationXid = positionPicked.xid;
    
}


#pragma mark - first version of picking process

// ----
// first version of picking process

+ (STMPickingOrderPositionPicked *)pickPosition:(STMPickingOrderPosition *)position withVolume:(NSUInteger)volume productionInfo:(NSString *)info article:(STMArticle *)article stockBatch:(STMStockBatch *)stockBatch barcode:(NSString *)barcode save:(BOOL)save {

//    NSString *entityName = NSStringFromClass([STMPickingOrderPositionPicked class]);
//    STMPickingOrderPositionPicked *pickedPosition = (STMPickingOrderPositionPicked *)[STMObjectsController newObjectForEntityName:entityName isFantom:NO];
//
//    pickedPosition.pickingOrderPosition = position;
//    pickedPosition.volume = @(volume);
//    pickedPosition.productionInfo = info;
//    pickedPosition.article = article;
//    pickedPosition.stockBatch = stockBatch;
//    pickedPosition.code = barcode;
//
//    if (save) [self.document saveDocument:^(BOOL success) {}];
//
//    return pickedPosition;

    return nil;
    
}

+ (void)position:(STMPickingOrderPosition *)position wasPickedWithVolume:(NSUInteger)volume andProductionInfo:(NSString *)info andBarCode:(NSString *)barcode {

//    [self pickPosition:position
//            withVolume:volume
//        productionInfo:info
//               article:position.article
//            stockBatch:nil
//               barcode:barcode
//                  save:YES];

}

+ (void)pickPosition:(STMPickingOrderPosition *)position fromStockBatch:(STMStockBatch *)stockBatch withBarCode:(NSString *)barcode {

//    NSInteger volume = ([stockBatch localVolume] > [position nonPickedVolume]) ? [position nonPickedVolume] : [stockBatch localVolume];
//
//    STMPickingOrderPositionPicked *pickedPosition = [self pickPosition:position
//                                                            withVolume:volume
//                                                        productionInfo:nil
//                                                               article:stockBatch.article
//                                                            stockBatch:stockBatch
//                                                               barcode:barcode
//                                                                  save:NO];
//
//    [STMStockBatchOperationController stockBatchOperationWithSource:stockBatch
//                                                        destination:pickedPosition
//                                                             volume:pickedPosition.volume
//                                                               save:YES];

}

+ (void)pickedPosition:(STMPickingOrderPositionPicked *)pickedPosition newVolume:(NSUInteger)newVolume andProductionInfo:(NSString *)newInfo {

//    BOOL volumeIsChanged = ![pickedPosition.volume isEqualToNumber:@(newVolume)];
//
//    BOOL infoIsChanged = (pickedPosition.productionInfo || newInfo) && ![pickedPosition.productionInfo isEqualToString:newInfo];
//
//    if (volumeIsChanged || infoIsChanged) {
//
//        if (newVolume > 0) {
//
//            NSUInteger maxVolume = [pickedPosition.pickingOrderPosition nonPickedVolume] + pickedPosition.volume.integerValue;
//
//            if (newVolume > maxVolume) {
//                newVolume = maxVolume;
//            }
//
//            pickedPosition.productionInfo = newInfo;
//
//            if (pickedPosition.stockBatch) {
//
//                NSInteger diff = newVolume - pickedPosition.volume.integerValue;
//
//                pickedPosition.volume = @(newVolume);
//
//                STMStockBatchOperation *operation = [STMStockBatchOperationController findStockBatchOperationWithSource:pickedPosition.stockBatch
//                                                                                                         andDestination:pickedPosition];
//
//                if (operation.sts) {
//
//                    STMStockBatchOperationAgent *source = nil;
//                    STMStockBatchOperationAgent *destination = nil;
//
//                    if (diff > 0) {
//
//                        source = pickedPosition.stockBatch;
//                        destination = pickedPosition;
//
//                    } else {
//
//                        source = pickedPosition;
//                        destination = pickedPosition.stockBatch;
//
//                        diff = -diff;
//
//                    }
//
//                    [STMStockBatchOperationController stockBatchOperationWithSource:source
//                                                                        destination:destination
//                                                                             volume:@(diff)
//                                                                               save:NO];
//
//                } else {
//
//                    operation.volume = @(newVolume);
//
//                }
//
//            } else {
//
//                pickedPosition.volume = @(newVolume);
//
//            }
//
//            [[self document] saveDocument:^(BOOL success) {
//
//            }];
//
//        } else if (newVolume == 0) {
//
//            [self deletePickedPosition:pickedPosition];
//
//        }
//
//    }

}

+ (void)deletePickedPosition:(STMPickingOrderPositionPicked *)pickedPosition {

//    if (pickedPosition.stockBatch) {
//
//        STMStockBatchOperation *operation = [STMStockBatchOperationController findStockBatchOperationWithSource:pickedPosition.stockBatch
//                                                                                                 andDestination:pickedPosition];
//
//        if (operation.sts) {
//
//            [STMStockBatchOperationController stockBatchOperationWithSource:pickedPosition
//                                                                destination:pickedPosition.stockBatch
//                                                                     volume:pickedPosition.volume
//                                                                       save:NO];
//
//        } else {
//            
//            [STMObjectsController removeObject:operation];
//            
//        }
//        
//    }
//    
//    if (pickedPosition.sts) {
//        [STMObjectsController createRecordStatusAndRemoveObject:pickedPosition];
//    } else {
//        [STMObjectsController removeObject:pickedPosition];
//    }
    
}

// end of first version of picking process
// ----


@end
