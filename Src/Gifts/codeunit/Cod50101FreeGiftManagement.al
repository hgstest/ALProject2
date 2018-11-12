codeunit 50101 "Free Gift Management"
{
    trigger OnRun()
    begin
    end;

    [EventSubscriber(ObjectType::Table, 37, 'OnAfterValidateEvent', 'Quantity', false, false)]
    local procedure AddFreeGift(var rec: Record "Sales Line")
    var
        FreeGift: Record "Free Gift";
        SalesLine: Record "Sales Line";
        Customer: Record Customer;
    begin
        if (rec.Type = rec.type::Item) and (Customer.Get(rec."Sell-to Customer No.")) then begin
            if (FreeGift.Get(Customer."Customer Category HGS", rec."No.")) and (rec.Quantity >= FreeGift.MinimumOrderQuantity) then begin
                OnBeforeFreeGiftSalesLineAdded(rec);
                SalesLine.Init();
                SalesLine.TransferFields(rec);
                SalesLine."Line No." := rec."Line No." + 10000;
                SalesLine.Validate(Quantity, FreeGift.GiftQuantity);
                SalesLine.Validate("Line Discount %", 100);
                if SalesLine.Insert() then;
                OnBeforeFreeGiftSalesLineAdded(rec);
            end;
        end;
    end;

    [IntegrationEvent(true, true)]
    local procedure OnBeforeFreeGiftSalesLineAdded(var Rec: Record "Sales Line")
    begin
    end;

    [IntegrationEvent(true, true)]
    local procedure OnAfterFreeGiftSalesLineAdded(var Rec: Record "Sales Line")
    begin
    end;

    [EventSubscriber(ObjectType::Table, 32, 'OnAfterInsertEvent', '', false, false)]
    local procedure OnAfterItemLedgerEntryInsert(var Rec: Record "Item Ledger Entry")
    var
        Customer: Record Customer;
    begin
        if Rec."Entry Type" = Rec."Entry Type"::Sale then begin
            rec."Customer Category HGS" := Customer."Customer Category HGS";
            Rec.Modify();
        end;
    end;
}