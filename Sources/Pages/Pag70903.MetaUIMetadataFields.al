page 70903 "Meta UI Metadata Fields"
{
    SourceTable = Field;
    PageType = API;
    DelayedInsert = true;
    APIPublisher = 'globalMediator';
    APIGroup = 'metaUI';
    APIVersion = 'v2.0';
    EntitySetName = 'metadataFields';
    EntityName = 'metadataField';
    ODataKeyFields = "No.";

    layout
    {
        area(Content)
        {
            repeater(Metadata)
            {
                field(no; Rec."No.") { }
                field(fieldName; Rec.FieldName) { }
                field(fieldCaption; Rec."Field Caption") { }
                field(type; Rec.Type) { }
                field(length; Rec.Len) { }
                field(optionString; Rec.OptionString) { }
                field(optionCaption; GetOptionsCaptions()) { }
                field(isPartOfPrimaryKey; Rec.IsPartOfPrimaryKey) { }
                field(obsoleteState; Rec.ObsoleteState) { }
                field(obsoleteReason; Rec.ObsoleteReason) { }
            }
        }
    }

    local procedure GetOptionsCaptions(): Text
    var
        RecReference: RecordRef;
        FieldReference: FieldRef;
    begin
        if Rec.Type = Rec.Type::Option then begin
            RecReference.Open(Rec.TableNo);
            FieldReference := RecReference.Field(Rec."No.");
            exit(FieldReference.OptionCaption());
        end;
    end;

    trigger OnOpenPage()
    begin
        Rec.SetFilter(ObsoleteState, '<>%1', Rec.ObsoleteState::Removed);
    end;
}