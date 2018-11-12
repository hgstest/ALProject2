codeunit 50100 "Customer Management"
{
    trigger OnRun()
    begin
    end;

    procedure AssignDefaultCategory(CustomerCode: Code[20])
    var
        Customer: Record Customer;
        CustomerCategory: Record "Customer Category";
    begin
        Customer.get(CustomerCode);
        CustomerCategory.SetRange(Default, true);
        if CustomerCategory.FindFirst() then begin
            Customer."Customer Category HGS" := CustomerCategory.No;
            Customer.Modify;
        end;
    end;

    procedure AssignDefaultCategory()
    var
        Customer: Record Customer;
        CustomerCategory: Record "Customer Category";
    begin
        CustomerCategory.SetRange(Default, true);
        if CustomerCategory.FindFirst() then begin
            Customer.ModifyAll("Customer Category HGS", CustomerCategory.No);
            Customer.Modify;
        end;
    end;

    procedure CreateDefaultCategory()
    var
        CustomerCategory: Record "Customer Category";
    begin
        CustomerCategory.No := 'DEFAULT';
        CustomerCategory.Description := 'Default Customer Category';
        CustomerCategory.Default := true;
        if CustomerCategory.Insert() then;
    end;

    procedure GetTotalCustomersWithoutCategory(): Integer
    var
        Customer: Record Customer;
    begin
        Customer.SetRange("Customer Category HGS", '');
        exit(Customer.Count());
    end;
}