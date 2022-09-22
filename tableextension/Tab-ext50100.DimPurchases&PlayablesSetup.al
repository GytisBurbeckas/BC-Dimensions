tableextension 50100 "Dim Purchases&PlayablesSetup" extends "Purchases & Payables Setup"
{
    fields
    {
        field(50100; "Vendors Purch. Dimension"; Code[20])
        {
            Caption = 'Vendors purchaser dimension', comment = 'LTH="Tiekėjų tarpininko dimensija“. "';
            DataClassification = CustomerContent;
            TableRelation = Dimension;
        }
    }
}