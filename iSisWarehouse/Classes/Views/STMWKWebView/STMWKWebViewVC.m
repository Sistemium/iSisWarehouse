//
//  STMWKWebViewVC.m
//  iSisWarehouse
//
//  Created by Maxim Grigoriev on 23/05/16.
//  Copyright © 2016 Sistemium UAB. All rights reserved.
//

#import "STMWKWebViewVC.h"

#import "STMDataModel.h"
#import "STMBarCodeController.h"
#import "STMObjectsController.h"


@interface STMWKWebViewVC ()

@end

@implementation STMWKWebViewVC

- (void)checkBarCode:(NSString *)barcode withType:(STMBarCodeScannedType)type arguments:(NSMutableArray *)arguments {
    
    NSString *typeString = [STMCoreBarCodeController barCodeTypeStringForType:type];
    
    if (typeString) {
        
        [arguments addObject:typeString];
        
        if (type == STMBarCodeTypeStockBatch) {
            
            STMStockBatch *stockBatch = [STMBarCodeController stockBatchForBarcode:barcode].firstObject;

            if (stockBatch) {

                NSDictionary *stockBatchDic = [STMObjectsController dictionaryForJSWithObject:stockBatch];
                [arguments addObject:stockBatchDic];

                NSLog(@"send received barcode %@ with type %@ and stockBatch %@ to WKWebView", barcode, typeString, stockBatchDic);

            } else {
                NSLog(@"send received barcode %@ with type %@ to WKWebView", barcode, typeString);
            }
            
        } else {
            NSLog(@"send received barcode %@ with type %@ to WKWebView", barcode, typeString);
        }
        
    } else {
        NSLog(@"send received barcode %@ to WKWebView", barcode);
    }
    
}


#pragma mark - view lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
