codeunit 70900 "Meta UI Generic API Routines"
{
    procedure EncodeToBase64URI(Source: Text) Result: Text
    var
        Base64Convert: Codeunit "Base64 Convert";
    begin
        Result := Base64Convert.ToBase64(Source);
        Result := ConvertStr(Result, '+', '*');
        Result := ConvertStr(Result, '/', '-');
    end;

    procedure DecodeFromBase64URI(Source: Text) Result: Text
    var
        Base64Convert: Codeunit "Base64 Convert";
    begin
        Result := ConvertStr(Source, '-', '/');
        Result := ConvertStr(Result, '*', '+');
        Result := Base64Convert.FromBase64(Result);
    end;
}