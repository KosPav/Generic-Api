table 70901 "Meta UI Generic API Line"
{
    DataClassification = SystemMetadata;

    fields
    {
        field(1; "Record ID"; RecordId)
        {
            DataClassification = SystemMetadata;
        }
        field(2; "Field No."; Integer)
        {
            DataClassification = SystemMetadata;
        }
        field(3; "Field Name"; Text[2048])
        {
            DataClassification = SystemMetadata;
        }
        field(4; "Field Value"; Text[2048])
        {
            DataClassification = SystemMetadata;
        }
    }

    keys
    {
        key(PK; "Record ID", "Field No.")
        {
            Clustered = true;
        }
    }

}