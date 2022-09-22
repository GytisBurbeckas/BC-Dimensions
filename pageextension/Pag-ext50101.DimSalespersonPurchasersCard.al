pageextension 50101 "Dim SalespersonPurchasers" extends "Salesperson/Purchaser Card"
{
    layout
    {
        addafter(Invoicing)
        {
            group(Dimensions)
            {
                Caption = 'Dimensions', comment = 'LTH="Dimensijos"';

                field("Vendors Purch. Dim. Value"; Rec."Vendors Purch. Dim. Value")
                {
                    ApplicationArea = ALL;
                    ToolTip = 'Vendors purchaser dimension value', comment = 'LTH="Tiekėjo tarpininko dimensijos vertė"';
                }
            }
        }
    }
}