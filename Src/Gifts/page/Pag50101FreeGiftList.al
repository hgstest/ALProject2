page 50101 "Free Gift List"
{
    PageType = List;
    ApplicationArea = All;
    SourceTable = "Free Gift";
    UsageCategory = Lists;
    Caption = 'Free Gift List';

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(CustomerCategoryCode; CustomerCategoryCode)
                {
                    ApplicationArea = All;
                }
                field(ItemNo; ItemNo)
                {
                    ApplicationArea = All;
                }
                field(MinimumOrderQuantity; MinimumOrderQuantity)
                {
                    ApplicationArea = All;
                }
                field(GiftQuantity; GiftQuantity)
                {
                    ApplicationArea = All;
                    Style = Strong;
                }
            }
        }
    }
}