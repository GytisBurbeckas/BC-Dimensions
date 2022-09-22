tableextension 50101 "Dim SalespersonPurchaser" extends "Salesperson/Purchaser"
{
    fields
    {
        field(50100; "Vendors Purch. Dim. Value"; Code[20])
        {
            Caption = 'Vendors purchaser dimension value', comment = 'LTH="Tiekėjo tarpininko dimensijos vertė"';
            DataClassification = CustomerContent;

            trigger OnLookup()
            var
            begin
                SelectDimensionValue();
            end;
        }
    }
    local procedure SelectDimensionValue()
    var
        PurchSetup: Record "Purchases & Payables Setup";
        DimValue: Record "Dimension Value";
    begin
        PurchSetup.Get();
        PurchSetup.Validate("Vendors Purch. Dimension");
        DimValue.SetRange("Dimension Code", PurchSetup."Vendors Purch. Dimension");
        if Page.RunModal(0, DimValue) = Action::LookupOK then begin
            Validate("Vendors Purch. Dim. Value", DimValue.Code);
        end;
    end;
}