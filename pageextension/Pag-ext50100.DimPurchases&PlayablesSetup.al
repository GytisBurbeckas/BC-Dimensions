pageextension 50100 "Dim Purchases&PlayablesSetup" extends "Purchases & Payables Setup"
{
    layout
    {
        addafter("Default Accounts")
        {
            group(Dimensions)
            {
                Caption = 'Dimensions', comment = 'LTH="Dimensijos"';

                field("Vendors Purch. Dimension"; Rec."Vendors Purch. Dimension")
                {
                    ApplicationArea = ALL;
                    ToolTip = 'Vendors purchaser dimension', comment = 'LTH="Tiekėjų tarpininko dimensija"';
                }
            }
        }
    }
}