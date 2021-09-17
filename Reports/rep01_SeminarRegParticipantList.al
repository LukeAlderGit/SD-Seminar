report 50101 "CSD SeminarRegParticipantList"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    RDLCLayout = './Layouts/SeminarRegParticipantList.rdl';
    Caption = 'Seminar Reg.- Participant List';
    DefaultLayout = RDLC;

    dataset
    {
        dataitem(SeminarRegistrationHeader; "CSD Seminar Reg. Header")
        {
            DataItemTableView = sorting("No.");
            RequestFilterFields = "No.", "Seminar No.";

            column(No_; "No.")
            {
                IncludeCaption = True;
            }
            column(Seminar_No_; "Seminar No.")
            {
                IncludeCaption = True;
            }
            column(Seminar_Name; "Seminar Name")
            {
                IncludeCaption = True;
            }
            column(Starting_Date; "Starting Date")
            {
                IncludeCaption = True;
            }
            column(Duration; Duration)
            {
                IncludeCaption = True;
            }
            column(Instructor_Name; "Instructor Name")
            {
                IncludeCaption = True;
            }
            column(Room_Name; "Room Name")
            {
                IncludeCaption = True;
            }
            dataitem(SeminarRegistrationLine; "CSD Seminar Registration Line")
            {
                DataItemTableView = sorting("Document No.", "Line No.");
                DataItemLink = "Document No." = field("No.");

                column(Bill_to_Customer_No_; "Bill-to Customer No.")
                {
                    IncludeCaption = True;
                }
                column(Participant_Contact_No_; "Participant Contact No.")
                {
                    IncludeCaption = True;
                }
                column(Participant_Name; "Participant Name")
                {
                    IncludeCaption = True;
                }
            }
        }
        dataitem("Company Information"; "Company Information")
        {
            column(Company_Name; Name)
            {
            }
        }
    }
    labels
    {
        SeminarRegistrationHeaderCap = 'Seminar Registration List';
    }

    var
        myInt: Integer;
}