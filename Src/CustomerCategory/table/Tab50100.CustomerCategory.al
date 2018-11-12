table 50100 "Customer Category"
{
    DataClassification = CustomerContent;
    DrillDownPageId = "Customer Category List";
    LookupPageId = "Customer Category List";
    Caption = 'Customer Category';
    fields
    {
        field(1; No; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'No.';
            trigger OnValidate();
            begin
            end;
        }

        field(2; Description; Text[50])
        {
            DataClassification = CustomerContent;
            Caption = 'Description';
        }

        field(3; Default; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Default';
        }

        field(4; TotalCustomersForCategory; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count (Customer where ("Customer Category HGS" = field (No)));
            Caption = 'Total Customers For Category';
        }

        field(5; EnableNewsLetter; Option)
        {
            OptionMembers = "No","Full","Limited";
            OptionCaption = ' ,Full,Limited';
            DataClassification = CustomerContent;
            Caption = 'Enable Newsletter';
        }

        field(6; FreeGiftsAvailable; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Free Gifts Available';
        }
    }

    keys
    {
        key(PK; No)
        {
            Clustered = true;
        }
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}