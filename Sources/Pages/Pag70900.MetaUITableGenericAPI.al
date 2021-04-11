page 70900 "Meta UI Table Generic API"
{
    SourceTable = "Meta UI Generic API Header";
    PageType = API;
    DelayedInsert = true;
    APIPublisher = 'globalMediator';
    APIGroup = 'metaUI';
    APIVersion = 'v2.0';
    EntitySetName = 'records';
    EntityName = 'record';
    ODataKeyFields = "Entry No.";
    SourceTableTemporary = true;

    layout
    {
        area(Content)
        {
            repeater(Data)
            {
                field(entryNo; Rec."Entry No.") { }
                field(tableID; Rec."Table ID") { }
                field(recID; Rec."Record ID") { }
                field(view; Rec.View) { }
                field(languageID; Rec."Language ID") { }
                part(Lines; "Meta UI Generic API Fields")
                {
                    ApplicationArea = all;
                    EntityName = 'field';
                    EntitySetName = 'fields';
                    SubPageLink = "Record ID" = Field("Record ID");
                }
            }
        }
    }
    trigger OnOpenPage()
    var
        MetaUIGenericAPIRoutines: Codeunit "Meta UI Generic API Routines";
        RecReferance: RecordRef;
        ViewFilter: Text;
        i: Integer;
    begin
        if Rec.GetFilter("Table ID") = '' then
            exit;

        if Rec.GetFilter("Language ID") <> '' then begin
            GlobalLanguage(Rec.GetRangeMin("Language ID"));
            Rec.SetRange("Language ID");
        end;

        RecReferance.Open(Rec.GetRangeMin(Rec."Table ID"));

        ViewFilter := Rec.GetFilter(View);
        if ViewFilter <> '' then begin
            ViewFilter := MetaUIGenericAPIRoutines.DecodeFromBase64URI(Copystr(ViewFilter, 2, StrLen(ViewFilter) - 2));
            Rec.SetRange(View);
            RecReferance.SetView(ViewFilter);
        end;

        if RecReferance.FindSet() then
            repeat
                i += 1;
                Rec.Init();
                Rec."Entry No." := i;
                Rec.Insert();
                Rec."Table ID" := Rec.GetRangeMin("Table ID");
                Rec."Record ID" := RecReferance.RecordId();
                Rec."Language ID" := GlobalLanguage();
                Rec.View := CopyStr(ViewFilter, 1, MaxStrLen(Rec.View));
                Rec.Modify();
            until RecReferance.Next() = 0;
    end;
}