codeunit 50100 "Dim VendorDimensionManager"
{
    procedure CreateOrChangeDefaultDim(TableID: Integer; Vendor: Record Vendor)
    var
        DefaultDim: Record "Default Dimension";
        PurchAndPaySetup: Record "Purchases & Payables Setup";
        Purchaser: Record "Salesperson/Purchaser";
        Count: Integer;
        DimFieldNumber: Integer;
    begin
        //------------First-way-(Shortcut dimensions)------------------------------------
        // If (not PurchAndPaySetup.Get()) then begin
        //     Error(PurchPaySetupError);
        // end;

        // If (not Purchaser.Get(Vendor."Purchaser Code")) then begin
        //     Error(PurchaserError);
        // end;

        // PurchAndPaySetup.TestField("Vendors Purch. Dimension");
        // Purchaser.TestField("Vendors Purch. Dim. Value");

        // GetGLSetup(GLSetupShortcutDimCode);

        // for Count := 1 to 8 do begin

        //     if (GLSetupShortcutDimCode[Count] = PurchAndPaySetup."Vendors Purch. Dimension") then begin
        //         DimFieldNumber := Count;
        //         break;
        //     end;
        // end;

        // if (DimFieldNumber < 1) OR (DimFieldNumber > 8) then begin
        //     Error(DimNotShortcutDimError, PurchAndPaySetup."Vendors Purch. Dimension")
        // end;

        // DimMgn.SaveDefaultDim(TableID, Vendor."No.", DimFieldNumber, Purchaser."Vendors Purch. Dim. Value");

        //------------Second-way------------------------
        If (not PurchAndPaySetup.Get()) then begin
            Error(PurchPaySetupError);
        end;

        If (not Purchaser.Get(Vendor."Purchaser Code")) then begin
            Error(PurchaserError);
        end;

        PurchAndPaySetup.TestField("Vendors Purch. Dimension");
        Purchaser.TestField("Vendors Purch. Dim. Value");

        if DefaultDim.Get(TableID, Vendor."No.", PurchAndPaySetup."Vendors Purch. Dimension")
        then begin
            DefaultDim.Validate("Dimension Value Code", Purchaser."Vendors Purch. Dim. Value");
            DefaultDim.Modify();
        end else begin
            DefaultDim.Init();
            DefaultDim.Validate("Table ID", TableID);
            DefaultDim.Validate("No.", Vendor."No.");
            DefaultDim.Validate("Dimension Code", PurchAndPaySetup."Vendors Purch. Dimension");
            DefaultDim.Validate("Dimension Value Code", Purchaser."Vendors Purch. Dim. Value");
            DefaultDim.Insert();
        end;
    end;

    local procedure GetGLSetup(var GLSetupShortcutDimCode: array[8] of Code[20])
    var
        GLSetup: Record "General Ledger Setup";
    begin
        GLSetup.Get();
        GLSetupShortcutDimCode[1] := GLSetup."Shortcut Dimension 1 Code";
        GLSetupShortcutDimCode[2] := GLSetup."Shortcut Dimension 2 Code";
        GLSetupShortcutDimCode[3] := GLSetup."Shortcut Dimension 3 Code";
        GLSetupShortcutDimCode[4] := GLSetup."Shortcut Dimension 4 Code";
        GLSetupShortcutDimCode[5] := GLSetup."Shortcut Dimension 5 Code";
        GLSetupShortcutDimCode[6] := GLSetup."Shortcut Dimension 6 Code";
        GLSetupShortcutDimCode[7] := GLSetup."Shortcut Dimension 7 Code";
        GLSetupShortcutDimCode[8] := GLSetup."Shortcut Dimension 8 Code";
    end;

    var
        PurchPaySetupError: Label 'Purchaser & Payables Setup not found', comment = 'LTH="Tarpininku ir mokėtinų sumų nustatymai nerastis"';
        PurchaserError: Label 'Purchaser not found', comment = 'LTH="Tarpininkas nerastas"';
        DimNotShortcutDimError: Label 'Dimension with code %1 is not Shortcut dimension', comment = 'LTH="Dimensija su kodu %1 nera trumpesnio kelio dimensija"';
        DimMgn: Codeunit DimensionManagement;
        GLSetupShortcutDimCode: array[8] of Code[20];
}