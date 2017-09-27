//
//  UITableView+Htills.h
//  Hughtill
//
//  Created by Burn on 2017. 9. 26..
//  Copyright © 2017년 Hugh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView(Htills)

//첫번째 Cell 호출 ex) 응용하는법은 제일 첫번째 셀에 붙여야할때 그런때
- (id) getFirstCell;

//Cell의 origin.y를 UITableView에서의 좌표값으로 받아옵니다. return float [standard = tableview]
- (float) getCellOriginY:(UITableViewCell*)cell;

//Cell의 origin을 UITableView에서의 좌표값으로 받아옵니다. return CGPoint [standard = tableview]
- (CGPoint) getCellOrigin:(UITableViewCell*)cell;
@end
