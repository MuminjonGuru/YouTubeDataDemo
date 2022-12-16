unit YouTubeDataAPI.MainUnit;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.Edit, FMX.StdCtrls, REST.Types, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope, FMX.Memo.Types, FMX.ScrollBox,
  FMX.Memo, System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors,
  Data.Bind.EngExt, Fmx.Bind.DBEngExt;

type
  TFormMain = class(TForm)
    EditChannelID: TEdit;
    EditVideoID: TEdit;
    BtnFetch: TButton;
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    Memo1: TMemo;
    BindingsList1: TBindingsList;
    LinkControlToField1: TLinkControlToField;
    procedure BtnFetchClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMain: TFormMain;

implementation

{$R *.fmx}

uses
  System.Threading;

procedure TFormMain.BtnFetchClick(Sender: TObject);
begin
  TTask.Run(
    procedure
    begin
      RESTClient1.ResetToDefaults;
      RESTClient1.Accept := 'application/json, text/plain; q=0.9, text/html;q=0.8,';
      RESTClient1.AcceptCharset := 'utf-8, *;q=0.8';
      RESTClient1.Params.Clear;
      RESTClient1.BaseURL := 'https://api.apilayer.com/youtube/video/details?'
        + 'id=' + EditVideoID.Text
        + '&apikey=b9i47fCV2hgUx5lOnJ0vWLxA6m2al78x';
      RESTClient1.ContentType := 'application/json';

      // send request
      RESTRequest1.Execute;
    end);

  Memo1.Lines.Clear;
  Memo1.Lines.Add(RESTResponse1.Content);
end;

end.
