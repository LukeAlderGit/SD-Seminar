table 50101 "CSD Seminar"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(10; "No."; Code[20])
        {
            DataClassification = AccountData;
            Caption = 'No.';
            trigger OnValidate()
            begin
                if "No." <> xRec."No." then begin
                    SeminarSetup.GEt;
                    NoSeriesMgt.TestManual(SeminarSetup."Seminar Nos.");
                    "No. Series" := '';
                end
            end;
        }
        field(20; Name; Text[50])
        {
            DataClassification = AccountData;
            Caption = 'Name';
            trigger OnValidate()
            begin
                if ("Search Name" = UpperCase(xRec.Name)) or
                    ("Search Name" = '') then
                    "Search Name" := Name;
            end;
        }
        field(30; "Seminar Duration"; Decimal)
        {
            DataClassification = AccountData;
            Caption = 'Seminar Duration';
            DecimalPlaces = 0 : 1;
        }
        field(40; "Minimum Participants"; Integer)
        {
            DataClassification = AccountData;
            Caption = 'Minimum Participants';
        }
        field(50; "Maximum Participants"; Integer)
        {
            DataClassification = AccountData;
            Caption = 'Maximum Participants';
        }
        field(60; "Search Name"; Code[50])
        {
            DataClassification = AccountData;
            Caption = 'Search Name';
        }
        field(70; Blocked; Boolean)
        {
            DataClassification = AccountData;
            Caption = 'Blocked';
        }
        field(80; "Last Date Modified"; Date)
        {
            DataClassification = AccountData;
            Editable = false;
            Caption = 'Last Date Modified';
        }
        field(90; Comment; Boolean)
        {
            //DataClassification = ToBeClassified;
            Caption = 'Comment';
            FieldClass = FlowField;
            CalcFormula = exist("Comment Line" where("Table Name" = filter("CSD Seminar"), "No." = field("No.")));
        }
        field(100; "Seminar Price"; Decimal)
        {
            DataClassification = AccountData;
            Caption = 'Seminar Price';
            AutoFormatType = 1;
        }
        field(110; "Gen. Prod. Posting Group"; Code[10])
        {
            DataClassification = AccountData;
            Caption = 'Gen. Prod. Posting Group';
            TableRelation = "Gen. Product Posting Group";
            trigger onValidate()
            begin
                if (xRec."Gen. Prod. Posting Group" <>
                    "Gen. Prod. Posting Group") then begin
                    if GenProdPostingGroup.ValidateVatProdPostingGroup
                       (GenProdPostingGroup, "Gen. Prod. Posting Group") then
                        Validate("VAT Prod. Posting Group",
                        GenProdPostingGroup."Def. VAT Prod. Posting Group");
                end;
            end;
        }
        field(120; "VAT Prod. Posting Group"; code[10])
        {
            DataClassification = AccountData;
            TableRelation = "VAT Product Posting Group";
            Caption = 'VAT Prod. Posting Group';
        }
        field(130; "No. Series"; Code[10])
        {
            Editable = false;
            Caption = 'No Series';
            TableRelation = "No. Series";
            DataClassification = AccountData;
        }
    }

    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }

    var
        SeminarSetup: Record "CSD Seminar Setup";
        CommentLine: Record "Comment Line";
        Seminar: Record "CSD Seminar";
        GenProdPostingGroup: Record "Gen. Product Posting Group";
        NoSeriesMgt: Codeunit NoSeriesManagement;

    trigger OnInsert()
    begin
        if "No." = '' then begin
            SeminarSetup.get;
            SeminarSetup.TestField("Seminar Nos.");
            NoSeriesMgt.InitSeries(SeminarSetup."Seminar Nos.", xRec."No. Series", 0D, "No.", "No. Series");
        end;
    end;

    trigger OnModify()
    begin
        "Last Date Modified" := Today;
    end;

    trigger OnDelete()
    begin
        CommentLine.Reset();
        CommentLine.SetRange("Table Name", CommentLine."Table Name"::"CSD Seminar");
        CommentLine.SetRange("No.", "No.");
        CommentLine.DeleteAll;
    end;

    trigger OnRename()
    begin
        "Last Date Modified" := Today;
    end;

    procedure AssistEdit(): Boolean;
    begin
        Seminar := Rec;
        SeminarSetup.Get();
        SeminarSetup.TestField("Seminar Nos.");
        if NoSeriesMgt.SelectSeries(SeminarSetup."Seminar Nos.",
             xRec."No. Series", Seminar."No. Series") then begin
            NoSeriesMgt.SetSeries(Seminar."No.");
            Rec := Seminar;
            exit(true);
        end;
    end;
}