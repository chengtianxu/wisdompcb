unit MainFrm_Mod02;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Datasnap.Provider, Data.Win.ADODB,
  Data.DB, Vcl.Menus, Vcl.XPMan, Datasnap.DBClient, Vcl.ExtCtrls,
  uBaseMainFrm, DBGridEhGrouping,ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh,
  Vcl.StdCtrls, Vcl.Buttons, EhLibVCL, GridsEh,DBAxisGridsEh, DBGridEh ,uCommFunc;

type
  TFrmMain_Mod02 = class(TfrmBaseMain)
    N_Add: TMenuItem;
    N_delete: TMenuItem;
    N3: TMenuItem;
    cdsMainunit_code: TStringField;
    cdsMainunit_name: TStringField;
    cdsMainprod: TStringField;
    cdsMainpurch: TStringField;
    cdsMainstock: TStringField;
    cdsMainquote: TStringField;
    cds02: TClientDataSet;
    cdsMainrkey: TAutoIncField;
    procedure N_AddClick(Sender: TObject);
    procedure N_deleteClick(Sender: TObject);
    procedure N_Edit(Sender: TObject);
  private
    { Private declarations }
  public
    FModNum : Integer;
    FDisplayFrm: TfrmBaseMain;
    procedure OnAfterModPost(Acds : TClientDataSet);
    procedure GetData();override;
    { Public declarations }
  end;

var
  FrmMain_Mod02: TFrmMain_Mod02;

implementation

{$R *.dfm}

uses ReturnFrm_Mod02;

procedure TFrmMain_Mod02.GetData;
begin
   FMainFrmSql := cdsMain.CommandText;
   FOrderby := ' order by unit_code desc ';
   inherited;
end;

procedure TFrmMain_Mod02.N_AddClick(Sender: TObject);
begin
    inherited;
    if FrmReturn_Mod02 =nil then
     begin
       FrmReturn_Mod02 := TFrmReturn_Mod02.Create(Self);
       FrmReturn_Mod02.Ftag := 1;
       FrmReturn_Mod02.FAfterUpdate := Self.OnAfterModPost;
     end;
     FrmReturn_Mod02.getdate('0');
     FrmReturn_Mod02.Show;
end;

procedure TFrmMain_Mod02.N_deleteClick(Sender: TObject);
var
  Lsql:string;
begin
  inherited;
   if messagedlg('确定要删除此记录吗？',mtconfirmation,[mbyes,mbno],0) = mryes then
    begin
      Lsql := 'select * from data0002 where rkey= '+ cdsMain.FieldByName('rkey').AsString;
      gSvrIntf.IntfGetDataBySql(Lsql,cds02) ;
      cds02.Delete;
      if gSvrIntf.IntfPostDataByTable('data0002',cds02.Delta) then
        begin
          cds02.MergeChangeLog;
          ShowMessage('删除记录成功');
          btnRefreshClick(Sender);
        end;
    end;
end;

procedure TFrmMain_Mod02.N_Edit(Sender: TObject);
begin
   inherited;
   if cdsMain.IsEmpty then Exit;

   if FrmReturn_Mod02 = nil then
     begin
       FrmReturn_Mod02 := TFrmReturn_Mod02.Create(Self);
       FrmReturn_Mod02.Ftag :=2;
       FrmReturn_Mod02.u_code1 :=  ehMain.DataSource.DataSet.FieldByName('UNIT_CODE').AsString;
       FrmReturn_Mod02.FAfterUpdate := Self.OnAfterModPost;
     end;
     FrmReturn_Mod02.getdate(cdsMain.FieldByName('rkey').AsString);
     FrmReturn_Mod02.bindingfield;
     FrmReturn_Mod02.Show;
end;

procedure TFrmMain_Mod02.OnAfterModPost(Acds: TClientDataSet);
begin
    btnRefreshClick(Self);
end;



end.


