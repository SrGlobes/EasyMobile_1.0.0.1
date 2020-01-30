program EasyMobile;

uses
  System.StartUpCopy,
  FMX.Forms,
  ClientModuleUnit1 in 'ClientModuleUnit1.pas' {ClientModule1: TDataModule},
  UPrincipalClient in 'UPrincipalClient.pas' {Fprincipal},
  ClientClassesUnit1 in 'ClientClassesUnit1.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TClientModule1, ClientModule1);
  Application.CreateForm(TFprincipal, Fprincipal);
  Application.Run;
end.
