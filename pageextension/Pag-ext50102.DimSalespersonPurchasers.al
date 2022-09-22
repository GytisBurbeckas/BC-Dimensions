pageextension 50102 "Dim Salespersons/Purchasers" extends "Salespersons/Purchasers"
{
    layout
    {
        addlast(Control1)
        {
            field("Vendors Purch. Dim. Value"; Rec."Vendors Purch. Dim. Value")
            {
                ApplicationArea = ALL;
                ToolTip = 'Vendors purchaser dimension value', comment = 'LTH="Tiekėjo tarpininko dimensijos vertė""';
            }
        }
    }
}