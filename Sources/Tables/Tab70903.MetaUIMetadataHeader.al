table 70903 "Meta UI Metadata Header"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(10; "Table ID"; Integer)
        {
            DataClassification = SystemMetadata;
            Caption = 'Table ID';
        }
        field(20; "Table Name"; text[2048])
        {
            DataClassification = SystemMetadata;
            Caption = 'Table Caption';
        }
        field(30; "Table Caption"; text[2048])
        {
            DataClassification = SystemMetadata;
            Caption = 'Table Caption';
        }
        field(40; "Obsolate State"; Option)
        {
            DataClassification = SystemMetadata;
            Caption = 'Language ID';
            OptionMembers = No,Pending,Removed;
        }
        field(50; "Obsolate Reason"; text[2048])
        {
            DataClassification = SystemMetadata;
            Caption = 'Language ID';
        }
        field(60; "Language ID"; Integer)
        {
            DataClassification = SystemMetadata;
            Caption = 'Language ID';
        }
    }

    keys
    {
        key(PK; "Table ID")
        {
            Clustered = true;
        }
    }
}