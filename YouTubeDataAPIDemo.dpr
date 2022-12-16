program YouTubeDataAPIDemo;

uses
  System.StartUpCopy,
  FMX.Forms,
  YouTubeDataAPI.MainUnit in 'YouTubeDataAPI.MainUnit.pas' {FormMain};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormMain, FormMain);
  Application.Run;
end.
