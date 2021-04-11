table 70900 "Meta UI Generic API Header"
{
    DataClassification = SystemMetadata;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            DataClassification = SystemMetadata;
            Caption = 'Entry No.';
        }
        field(2; "Table ID"; Integer)
        {
            DataClassification = SystemMetadata;
            Caption = 'Table ID';
        }
        field(3; "Record ID"; RecordId)
        {
            DataClassification = SystemMetadata;
            Caption = 'Record ID';
        }
        field(5; View; Text[2048])
        {
            DataClassification = SystemMetadata;
            Caption = 'View';
        }
        field(6; "Language ID"; Integer)
        {
            DataClassification = SystemMetadata;
            Caption = 'Laguage ID';
        }
    }
    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }
}