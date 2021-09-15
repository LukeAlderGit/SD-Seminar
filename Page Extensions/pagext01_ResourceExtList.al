pageextension 50101 "CSD ResouceListExt" extends "Resource List"
// CSD1.00 - 2021-09-15 - L. Alder
{
    layout
    {
        modify(Type)
        {
            Visible = Showtype;
        }
        addafter(Type)
        {
            field("CSD Resource Type"; rec."CSD Resource Type")
            {
                ApplicationArea = All;
                Visible = ShowMaxField;
            }
        }
    }

    trigger OnOpenPage()
    begin
        ShowType := (rec.GetFilter(Type) = '');
        ShowMaxField := (rec.GetFilter(Type) =
                format(rec.Type::Machine));
    end;

    var
        [InDataSet]
        ShowMaxField: Boolean;
        [InDataSet]
        Showtype: Boolean;
}