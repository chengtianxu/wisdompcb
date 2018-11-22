unit Mainfrm_Mod086;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,ubasemainfrm, DBGridEhGrouping,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, Data.DB, Vcl.XPMan, Vcl.Menus,
  Datasnap.DBClient, Vcl.StdCtrls, Vcl.Buttons, GridsEh, DBAxisGridsEh,
  DBGridEh, Vcl.ExtCtrls, Bde.DBTables,uCommFunc;

type
  TMainfrm_Mod86 = class(TfrmBaseMain)
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    ClientDataSet2: TClientDataSet;
    cds86: TClientDataSet;
    Query1: TQuery;
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
  private

    { Private declarations }
  public
  v_edit:Boolean;
   procedure OnAfterModPost(Acds : TClientDataSet);
//   procedure GetData();override;
    { Public declarations }
  end;

var
  Mainfrm_Mod86: TMainfrm_Mod86;

implementation
 uses Editfrm_Mod86;
{$R *.dfm}

//procedure TFrmMain_Mod086.GetData;
//begin
//   FMainFrmSql := cdsMain.CommandText;
//   FOrderby := ' order by unit_code desc ';
//   inherited;
//end;


procedure TMainfrm_Mod86.N1Click(Sender: TObject);
begin
  inherited;
   if Editfrm_Mod086 =nil then
     begin
       Editfrm_Mod086 := TEditfrm_Mod086.Create(Self);
       Editfrm_Mod086.v_status := 0;

     end;
     Editfrm_Mod086.getdate('0');
     Editfrm_Mod086.Show;

 try
   Editfrm_Mod086:=TEditfrm_Mod086.Create(Application);
  Editfrm_Mod086.v_status:=1;
  if Editfrm_Mod086.ShowModal=mrok then
  begin
   cdsMain.Close;
   cdsMain.Open;
  end;
finally
  Editfrm_Mod086.Free;
end;


end;

procedure TMainfrm_Mod86.N2Click(Sender: TObject);
var
i:Integer;
begin
  inherited;


 try
    Editfrm_Mod086:=TEditfrm_Mod086.create(Application);
    Editfrm_Mod086.v_status:=1;
//    Editfrm_Mod086.rkey189:=dm.ds189RKEY.Value;
    if Editfrm_Mod086.ShowModal=mrOk then
    begin
     btnRefreshClick(Self);
      ShowMessage('±à¼­²Ù×÷³É¹¦!');
    end;
  finally
    Editfrm_Mod086.free;
  end;
     Editfrm_Mod086.bindingfield;

end;
  procedure TMainfrm_Mod86.OnAfterModPost(Acds: TClientDataSet);
begin
    btnRefreshClick(Self);
end;

end.
