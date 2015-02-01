//
//  DarshboardViewController.h
//  GSMAlarmSystem
//
//  Created by James on 15-1-24.
//  Copyright (c) 2015年 James Chen. All rights reserved.
//

#import "BaseViewController.h"

@interface DarshboardViewController : BaseViewController<PageScrollViewDelegate, ButtonBarDelegate>
{
    LibraryScrollView   *_scrollView;
    ButtonBar           *_bottomBar;
#if kNeedNavigationBar
#else
    UIButton            *_backButton;
#endif
    
}
@end
