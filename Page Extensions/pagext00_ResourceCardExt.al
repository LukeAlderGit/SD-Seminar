pageextension 50100 "CSD ResouceCardExt" extends "Resource Card"
// CSD1.00 - 2021-09-15 - LAA
{
    layout
    {
        addlast(General)
        {
            field("CSD Resource Type"; rec."CSD Resource Type")
            {

            }
        }
        addafter("Personal Data")
        {
            group("CSD Room")
            {
                Caption = 'Room';
                Visible = ShowMaxField;
                field("CSD Maximum Participants";rec."CSD Maximum Participants")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    trigger OnAfterGetRecord();
    begin
        ShowMaxField := (rec.Type = rec.Type::Machine);
        CurrPage.Update(false);
    end;

    var
        [InDataSet]
        ShowMaxField: Boolean;

}