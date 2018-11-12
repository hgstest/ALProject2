tableextension 50101 ItemLedgerEntryExtension extends "Item Ledger Entry"
{
    fields
    {
        field(50100; "Customer Category HGS"; code[20])
        {
            TableRelation = "Customer Category".No;
            Caption = 'Customer Category';
            DataClassification = CustomerContent;
        }
    }

    var
        myInt: Integer;
}