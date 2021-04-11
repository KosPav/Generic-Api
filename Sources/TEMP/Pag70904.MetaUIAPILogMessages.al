page 70904 "Meta UI API Log Messages"
{
    Caption = 'Meta UI API Log Messages KOP';
    Editable = false;
    PageType = List;
    SourceTable = "Meta UI API Log Message KOP";

    ApplicationArea = All;
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(Messages)
            {
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Entry No. field';
                }

                field(FContent; Rec.Content)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Content field';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ClearLog)
            {
                ApplicationArea = All;
                Caption = 'Clear Log';
                Image = ClearLog;

                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                ToolTip = 'Executes the Clear Log action';

                trigger OnAction();
                begin
                    Rec.ClearLog();
                end;
            }
        }
    }
}