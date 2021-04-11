table 70902 "Meta UI API Log Message KOP"
{
    Caption = 'Meta UI API Log Message KOP';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            DataClassification = SystemMetadata;
        }
        field(2; Content; Text[2048])
        {
            Caption = 'Content';
            DataClassification = SystemMetadata;
        }
    }

    keys
    {
        key(Primary; "Entry No.")
        {
            Clustered = true;
        }
    }

    procedure CreateMessage(Message: Text)
    begin
        if FindLast() then
            "Entry No." := "Entry No." + 1
        else
            "Entry No." := 1;

        Rec.Content := copystr(Message, 1, MaxStrLen(Rec.Content));
        Insert();
        Commit();
    end;

    procedure ClearLog()
    begin
        Rec.DeleteAll();
    end;
}