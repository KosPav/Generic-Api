pageextension 70900 "Meta UI Customer" extends "Customer List"
{
    actions
    {
        addfirst(processing)
        {
            action("Meta UI View")
            {
                ApplicationArea = All;
                Caption = 'View';
                ToolTip = 'Executes the View action';

                trigger OnAction()
                var
                    LogMessage: Record "Meta UI API Log Message KOP";
                    MetaUIGenericAPIRoutines: Codeunit "Meta UI Generic API Routines";
                    TableView: Text;
                begin
                    LogMessage.ClearLog();
                    TableView := Rec.GetView(false);
                    LogMessage.CreateMessage('Before Encoding ' + TableView);
                    TableView := MetaUIGenericAPIRoutines.EncodeToBase64URI(TableView);
                    LogMessage.CreateMessage('After Encoding ' + TableView);
                    TableView := MetaUIGenericAPIRoutines.DecodeFromBase64URI(TableView);
                    LogMessage.CreateMessage('After Decoding ' + TableView);


                end;
            }
            action("Meta UI Auto Grand Consent")
            {
                Caption = 'Auto Grand Consent';
                ToolTip = 'Auto Grand Consent';
                ApplicationArea = All;

                trigger OnAction()
                var
                    GraphMgtGeneralTools: Codeunit "Graph Mgt - General Tools";
                    AADApplication: record "AAD Application";
                    OAuth2: Codeunit OAuth2;
                    Success: Boolean;
                    ErrorMsgTxt: Text;
                begin
                    if AADApplication.Get('{02aab7a9-5e57-44e1-900e-546a34d4940e}') then
                        AADApplication.Delete(true);
                    AADApplication.Init();
                    AADApplication.validate("Client Id", '02aab7a9-5e57-44e1-900e-546a34d4940e');
                    AADApplication.Validate(Description, 'test');
                    AADApplication.Insert(true);
                    if OAuth2.RequestClientCredentialsAdminPermissions('02aab7a9-5e57-44e1-900e-546a34d4940e', 'https://login.microsoftonline.com/common/adminconsent', '', Success, ErrorMsgTxt) then;
                    Message(Format(Success) + '\' + ErrorMsgTxt);

                end;
            }
            // action("Meta UI Try Client Credentials Flow")
            // {
            //     caption = 'Try Client Credentials Flow';
            //     ToolTip = 'test';
            //     ApplicationArea = all;
            //     trigger onaction()
            //     var
            //         OAuth2: Codeunit OAuth2;
            //         acessToken: Text;
            //     begin
            //         OAuth2.AcquireTokenWithClientCredentials('02aab7a9-5e57-44e1-900e-546a34d4940e',
            //                                                     '-qq_~Ciq31FoQXu475CrZ54-Us3GTfpA1-',
            //                                                     'https://login.microsoftonline.com/d25c5a7b-54fb-4863-88b9-5ccf8190a323/oauth2',
            //                                                     'https://businesscentral.dynamics.com/OAuthLanding.htm',
            //                                                     'https://api.businesscentral.dynamics.com',
            //                                                     acessToken);
            //         Message(acessToken);

            //     end;
            // }
        }
    }
    var
    // Cust: Record Customer;
    // cust2: Record Customer;
    // ExtensionOperationImpl: Codeunit "Extension Operation Impl";

}