//
//  STMPickingPositionAddInfoVC.h
//  iSistemium
//
//  Created by Maxim Grigoriev on 20/11/15.
//  Copyright © 2015 Sistemium UAB. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "STMInventoryInfoSelectTVC.h"

#import "iSistemiumCore-Swift.h"


@interface STMPositionAddInfoVC : UIViewController

@property (nonatomic, weak) STMInventoryInfoSelectTVC *inventoryInfoVC;
@property (nonatomic, weak) STMArticle *article;


@end
