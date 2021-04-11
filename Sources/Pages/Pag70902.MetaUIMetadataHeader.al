page 70902 "Meta UI Metadata Header"
{
    SourceTable = "Meta UI Metadata Header";
    PageType = API;
    DelayedInsert = true;
    APIPublisher = 'globalMediator';
    APIGroup = 'metaUI';
    APIVersion = 'v2.0';
    EntitySetName = 'metadataTables';
    EntityName = 'metadataTable';
    ODataKeyFields = "Table ID";
    SourceTableTemporary = true;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(tableID; Rec."Table ID")
                {
                    ApplicationArea = All;
                }
                field(tableName; Rec."Table Name")
                {
                    ApplicationArea = All;
                }
                field(tableCaption; Rec."Table Caption")
                {
                    ApplicationArea = All;
                }
                field(obsolateState; Rec."Obsolate State")
                {
                    ApplicationArea = All;
                }
                field(obsolateReason; Rec."Obsolate Reason")
                {
                    ApplicationArea = All;
                }
                field(languageID; Rec."Language ID")
                {
                    ApplicationArea = All;
                }
                part(Lines; "Meta UI Metadata Fields")
                {
                    ApplicationArea = all;
                    EntityName = 'metadataField';
                    EntitySetName = 'metadataFields';
                    SubPageLink = TableNo = Field("Table ID");
                }
            }
        }
    }
    trigger OnOpenPage()
    var
        TableMetadata: Record "Table Metadata";
    begin
        if Rec.GetFilter("Language ID") <> '' then begin
            GlobalLanguage(Rec.GetRangeMin("Language ID"));
            Rec.SetRange("Language ID");
        end;

        if Rec.GetFilter("Table ID") <> '' then
            TableMetadata.SetFilter(ID, Rec.GetFilter("Table ID"));
        if TableMetadata.FindSet() then
            repeat
                Rec.Init();
                Rec."Table ID" := TableMetadata.ID;
                Rec.Insert();
                Rec."Language ID" := GlobalLanguage;
                Rec."Table Caption" := TableMetadata.Caption;
                rec."Table Name" := TableMetadata.Name;
                Rec."Obsolate State" := TableMetadata.ObsoleteState;
                Rec."Obsolate Reason" := TableMetadata.ObsoleteReason;
                Rec.Modify();
            until TableMetadata.Next() = 0;
    end;
}