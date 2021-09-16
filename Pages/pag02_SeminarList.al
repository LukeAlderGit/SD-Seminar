page 50102 "CSD Seminar List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "CSD Seminar";
    Caption = 'Seminar List';
    Editable = false;
    CardPageId = 50101;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("No."; rec."No.")
                {
                    ApplicationArea = All;

                }
                field(Name; rec.Name)
                {
                    ApplicationArea = All;

                }
                field("Seminar Duration"; rec."Seminar Duration")
                {
                    ApplicationArea = All;

                }
                field("Seminar Price"; rec."Seminar Price")
                {
                    ApplicationArea = All;

                }
                field("Minimum Participants"; rec."Minimum Participants")
                {
                    ApplicationArea = All;

                }
                field("Maximum Participants"; rec."Maximum Participants")
                {
                    ApplicationArea = All;

                }
            }
        }

        area(Factboxes)
        {
            systempart("Links"; Links)
            {

            }
            systempart("Notes"; Notes)
            {

            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction();
                begin

                end;
            }
        }
    }
}