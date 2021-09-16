page 50101 "CSD Seminar Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "CSD Seminar";
    
    layout
    {
        area(Content)
        {
            group(General)
            {
                field("No."; rec."No.")
                {
                    ApplicationArea = All;
                    AssistEdit = true;
                    trigger OnAssistEdit()
                    begin
                        if rec.AssistEdit then
                            CurrPage.Update;
                    end;
                    
                }
                field(Name; rec.Name)
                {
                    ApplicationArea = All;
                    
                }
                field("Search Name"; rec."Search Name")
                {
                    ApplicationArea = All;
                    
                }
                field("Seminar Duration"; rec."Seminar Duration")
                {
                    ApplicationArea = All;
                    
                }
                field("Minimum Participants"; rec."Minimum Participants")
                {
                    ApplicationArea = All;
                    
                }
                field(Blocked; rec.Blocked)
                {
                    ApplicationArea = All;
                    
                }
                field("Last Date Modified"; rec."Last Date Modified")
                {
                    ApplicationArea = All;
                    
                }
            }
            group(Invoicing)
            {
                field("Gen. Prod. Posting Group"; rec."Gen. Prod. Posting Group")
                {
                    ApplicationArea = All;
                }
                field("VAT Prod. Posting Group"; rec."VAT Prod. Posting Group")
                {
                    ApplicationArea = All;
                }
                field("Seminar Price"; rec."Seminar Price")
                {
                    ApplicationArea = All;
                }

            }
        }
        area(FactBoxes)
        {
            systempart("Links";Links)
            {

            }
            systempart("Notes";Notes)
            {

            }
        }
    }
    
    actions
    {
        area(Navigation)
        {
            group("Seminar")
            {
                action("Comments")
                {
                    RunObject = page "Comment Sheet";
                    RunPageLink = "Table Name" = const("CSD Seminar"), 
                                    "No." = field ("No.");
                    Image = Comment;
                    Promoted = true;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    ApplicationArea = All;
                }
            }

        }
    }

}