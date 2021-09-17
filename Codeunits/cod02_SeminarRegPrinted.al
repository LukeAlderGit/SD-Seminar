codeunit 50102 "SeminarRegPrinted"
{
    TableNo = "CSD Seminar Reg. Header";

    trigger OnRun()
    begin
        rec.Find;
        rec."No. Printed" += 1;
        rec.Modify;
        Commit;
    end;

    var
        myInt: Integer;
}