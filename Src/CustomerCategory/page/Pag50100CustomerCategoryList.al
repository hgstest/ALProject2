page 50100 "Customer Category List"
{
    PageType = List;
    SourceTable = "Customer Category";
    UsageCategory = Lists;
    Caption = 'Customer Category List';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(No; No)
                {
                    ApplicationArea = All;
                }
                field(Description; Description)
                {
                    ApplicationArea = All;
                }
                field(Default; Default)
                {
                    ApplicationArea = All;
                }
                field(TotalCustomersForCategory; TotalCustomersForCategory)
                {
                    ApplicationArea = All;
                    ToolTip = 'Total Customers for Category';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Create Default Category")
            {
                Image = CreateForm;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Creates a default Customer category';
                Caption = 'Create default Customer category';

                trigger OnAction();
                var
                    CustManagement: Codeunit "Customer Management";
                begin
                    OnBeforeCreateDefaultCategoryAction(Rec);
                    CustManagement.CreateDefaultCategory();
                    OnAfterCreateDefaultCategoryAction(Rec);
                end;
            }
        }
    }
    [IntegrationEvent(true, true)]
    local procedure OnBeforeCreateDefaultCategoryAction(var CustomerCategory: Record "Customer Category")
    begin
    end;

    [IntegrationEvent(true, true)]
    local procedure OnAfterCreateDefaultCategoryAction(var CustomerCategory: Record "Customer Category")
    begin
    end;
}