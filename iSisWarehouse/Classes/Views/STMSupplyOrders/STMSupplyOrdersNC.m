//
//  STMSupplyOrdersNC.m
//  iSistemium
//
//  Created by Maxim Grigoriev on 09/01/16.
//  Copyright © 2016 Sistemium UAB. All rights reserved.
//

#import "STMSupplyOrdersNC.h"

#import "STMWorkflowController.h"
#import "STMDataModel.h"


@interface STMSupplyOrdersNC ()


@end


@implementation STMSupplyOrdersNC


- (NSString *)supplyOrderWorkflow {
    
    if (!_supplyOrderWorkflow) {
        _supplyOrderWorkflow = [STMWorkflowController workflowForEntityName:NSStringFromClass([STMSupplyOrder class])];
    }
    return _supplyOrderWorkflow;
    
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
