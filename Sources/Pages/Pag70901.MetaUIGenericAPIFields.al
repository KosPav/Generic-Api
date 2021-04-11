page 70901 "Meta UI Generic API Fields"
{
    SourceTable = "Meta UI Generic API Line";
    PageType = API;
    DelayedInsert = true;
    APIPublisher = 'globalMediator';
    APIGroup = 'metaUI';
    APIVersion = 'v2.0';
    EntitySetName = 'fields';
    EntityName = 'field';
    ODataKeyFields = "Field No.";
    SourceTableTemporary = true;

    layout
    {
        area(Content)
        {
            repeater(Data)
            {
                field(fieldNo; Rec."Field No.") { }
                field(fieldName; Rec."Field Name") { }
                field(fieldValue; Rec."Field Value") { }
            }
        }
    }

    trigger OnOpenPage()
    var
        SystemField: Record Field;
        FieldReferance: FieldRef;
        RecReferance: RecordRef;
        RecordIDHolder: RecordId;
    begin
        if Evaluate(RecordIDHolder, Rec.GetFilter("Record ID")) then
            if RecReferance.Get(RecordIDHolder) then begin
                if Rec.GetFilter("Field No.") <> '' then
                    SystemField.SetFilter("No.", Rec.GetFilter("Field No."));
                SystemField.SetRange(TableNo, RecReferance.Number);
                SystemField.SetFilter(ObsoleteState, '<>%1', SystemField.ObsoleteState::Removed);
                SystemField.SetFilter(Class, '<>%1', SystemField.Class::FlowFilter);
                if SystemField.FindSet() then
                    repeat
                        FieldReferance := RecReferance.Field(SystemField."No.");
                        Rec.Init();
                        Rec."Record ID" := RecReferance.RecordId;
                        Rec."Field No." := FieldReferance.Number;
                        Rec.Insert();
                        Rec."Field Name" := CopyStr(FieldReferance.Name, 1, MaxStrLen(Rec."Field Name"));
                        if SystemField.Class = SystemField.Class::FlowField then
                            FieldReferance.CalcField();
                        Rec."Field Value" := format(FieldReferance.Value);
                        Rec.Modify();
                    until SystemField.Next() = 0;
            end;
    end;
}