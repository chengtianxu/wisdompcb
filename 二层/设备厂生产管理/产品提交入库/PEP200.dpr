program PEP200;

uses
  Forms,
  UEP200 in 'UEP200.pas' {Main_Form},
  UEP200_Query in 'UEP200_Query.pas' {Query_Form},
  UEP200_Submit in 'UEP200_Submit.pas' {Submit_Form};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '产品提交入库';
  Application.CreateForm(TMain_Form, Main_Form);
  Application.CreateForm(TQuery_Form, Query_Form);
  Application.Run;
end.
