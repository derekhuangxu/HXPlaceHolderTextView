# HXPlaceHolderTextView
---

>iOS开发过程当中会很多次遇到使用UITextview的情况，然而UITextView和UITextField不同的是，UITextView并没有**placeholder**这个属性，所以在开发过程当中会造成很多的麻烦，**HXPlaceHolderTextView**的目的就是为了解决这一问题。

使用过程当中，只要直接使用即可，整个类都是继承自**UITextView**，所以，使用起来并没有和之前的有任何的不同，唯一不同就是**HXPlaceHolderTextView**有**placeholder**这一属性，当你设置**UITextView的字体**的时候，**placeholder的字体**也会随之改变。

	HXPlaceHolderTextView* textView = [[HXPlaceHolderTextView alloc]init];
    textView.frame = CGRectMake(50, 50, 270, 100);
    textView.placeholder = @"我是placeholder";
    textView.font = [UIFont systemFontOfSize:13];
    [self.view addSubview:textView];

