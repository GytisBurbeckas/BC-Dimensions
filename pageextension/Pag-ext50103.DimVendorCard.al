pageextension 50103 "Dim VendorCard" extends "Vendor Card"
{
    layout
    {
        addafter(Receiving)
        {
            group(Purchaser)
            {
                Caption = 'Purchaser', comment = 'LTH="Tarpininkas"';

                field("Purch. Code"; Rec."Purchaser Code")
                {
                    ApplicationArea = ALL;
                    Caption = 'Tarpininko kodas';
                    ToolTip = 'Purchaser code', comment = 'LTH="Tarpininko kodas"';

                    trigger OnValidate()
                    var
                        VendorDimManager: Codeunit "Dim VendorDimensionManager";
                    begin
                        VendorDimManager.CreateOrChangeDefaultDim(DATABASE::Vendor, Rec);
                    end;
                }
            }
        }
    }
}