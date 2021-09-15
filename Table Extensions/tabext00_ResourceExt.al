tableextension 50100 "CSD ResourceExt" extends Resource
//CSD1.00 - 2021-09-15 - L. Alder.
{
    fields
    {
        modify("Profit %")
        {
            trigger OnAfterValidate()
            var
            begin
                Rec.TestField("Unit Cost");
            end;
        }
        field(50101; "CSD Resource Type"; Option)
        {
            DataClassification = AccountData;
            OptionMembers = "Internal","External";
            OptionCaption = 'Internal,External';
            Caption = 'Resource Type';
        }
        field(50102; "CSD Maximum Participants"; Integer)
        {
            DataClassification = AccountData;
            Caption = 'Maximum Participants';
        }
        field(50103; "CSD Quantity Per Day"; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Quantity Per Day';
        }
    

    }
}