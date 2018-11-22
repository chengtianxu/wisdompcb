unit MainFrm_Mod01;

interface

uses
  {Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs; }
    Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Datasnap.Provider, Data.Win.ADODB,
  Data.DB, Vcl.Menus, Vcl.XPMan, Datasnap.DBClient, Vcl.ExtCtrls,
  uBaseMainFrm, DBGridEhGrouping,ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh,
  Vcl.StdCtrls, Vcl.Buttons, EhLibVCL, GridsEh,DBAxisGridsEh, DBGridEh ,uCommFunc;

type
  TFrmMain_Mod01 = class(TfrmBaseMain)
    N_Add: TMenuItem;
    N_Edit: TMenuItem;
    N_Copy: TMenuItem;
    N_Delete: TMenuItem;
    cds01: TClientDataSet;
    cdsMainCURR_CODE: TStringField;
    cdsMainCURR_NAME: TStringField;
    cdsMainEXCH_RATE: TFloatField;
    cdsMainexch1: TStringField;
    cdsMainTDATE: TDateTimeField;
    cdsMainBASE_TO_OTHER: TFloatField;
    cdsMainexch2: TStringField;
    cdsMainQTE_EXCH_RATE: TFloatField;
    cdsMainexch3: TStringField;
    cdsMainQTE_BASE_TO_OTHER: TFloatField;
    cdsMainexch4: TStringField;
    cdsMainRKEY: TAutoIncField;
    procedure cdsMainCalcFields(DataSet: TDataSet);
    procedure N_AddClick(Sender: TObject);
    procedure N_EditClick(Sender: TObject);
    procedure N_CopyClick(Sender: TObject);
    procedure N_DeleteClick(Sender: TObject);
  private
    { Private declarations }
  public
    FDisplayFrm: TfrmBaseMain;
    procedure GetData();override;
    procedure OnAfterModPost(Acds : TClientDataSet);
    { Public declarations }
  end;

var
  FrmMain_Mod01: TFrmMain_Mod01;

implementation

{$R *.dfm}

uses ReturnFrm_Mod01;

procedure TFrmMain_Mod01.cdsMainCalcFields(DataSet: TDataSet);
begin
  inherited;
    cdsMain.FieldByName('exch1').AsString := cdsMain.FieldValues['CURR_CODE'] + '/本位币';
    cdsMain.FieldByName('exch2').AsString := '本位币/' + cdsMain.FieldValues['CURR_CODE'];
    cdsMain.FieldByName('exch3').AsString := cdsMain.FieldValues['CURR_CODE'] + '/本位币';
    cdsMain.FieldByName('exch4').AsString := '本位币/' + cdsMain.FieldValues['CURR_CODE'];
end;

procedure TFrmMain_Mod01.GetData;
begin
   FMainFrmSql := cdsMain.CommandText;
   FOrderby := ' order by CURR_CODE desc ';
   inherited;
end;

procedure TFrmMain_Mod01.N_AddClick(Sender: TObject);
begin
  inherited;
    {新增}
       inherited;
     if FrmReturn_Mod01= nil then
      begin
        FrmReturn_Mod01 := TFrmReturn_Mod01.Create(Self);
        FrmReturn_Mod01.Ftag := 1;
        FrmReturn_Mod01.MaskEdit1.Text := DateToStr(Date());
        FrmReturn_Mod01.Edit1.Text := '';
        FrmReturn_Mod01.Edit2.Text := '0.00000000';
        FrmReturn_Mod01.Edit3.Text := '0.00000000';
        FrmReturn_Mod01.Edit4.Text := '0.00000000';
        FrmReturn_Mod01.Edit5.Text := '0.00000000';
        FrmReturn_Mod01.FAfterUpdate := Self.OnAfterModPost;;
      end;
      FrmReturn_Mod01.getdate('0');
      FrmReturn_Mod01.Show;
end;

procedure TFrmMain_Mod01.N_EditClick(Sender: TObject);
begin
  inherited;
   {编辑}
   if cdsMain.IsEmpty then Exit;

   if FrmReturn_Mod01 = nil then
    begin
       FrmReturn_Mod01 := TFrmReturn_Mod01.Create(Self);
       FrmReturn_Mod01.Ftag := 2;
       FrmReturn_Mod01.Edit7.Text := cdsMain.FieldByName('exch1').Value;
       FrmReturn_Mod01.Edit8.Text := cdsMain.FieldByName('exch2').Value;
       FrmReturn_Mod01.Edit9.Text := cdsMain.FieldByName('exch3').Value;
       FrmReturn_Mod01.Edit10.Text := cdsMain.FieldByName('exch4').Value;
       FrmReturn_Mod01.c_code1 := ehMain.DataSource.DataSet.FieldByName('CURR_CODE').AsString;
       FrmReturn_Mod01.FAfterUpdate := Self.OnAfterModPost;
    end;
   FrmReturn_Mod01.getdate(cdsMain.FieldByName('rkey').AsString);
   FrmReturn_Mod01.bindingfield;
   FrmReturn_Mod01.Show;

end;

procedure TFrmMain_Mod01.N_CopyClick(Sender: TObject);
begin
  inherited;
    {复制}
   if cdsMain.IsEmpty then Exit;

   if FrmReturn_Mod01 = nil then
    begin
       FrmReturn_Mod01 := TFrmReturn_Mod01.Create(Self);
       FrmReturn_Mod01.Ftag := 3;
       FrmReturn_Mod01.Edit7.Text := cdsMain.FieldByName('exch1').Value;
       FrmReturn_Mod01.Edit8.Text := cdsMain.FieldByName('exch2').Value;
       FrmReturn_Mod01.Edit9.Text := cdsMain.FieldByName('exch3').Value;
       FrmReturn_Mod01.Edit10.Text := cdsMain.FieldByName('exch4').Value;
       FrmReturn_Mod01.FAfterUpdate := Self.OnAfterModPost;;
    end;
   FrmReturn_Mod01.getdate(cdsMain.FieldByName('rkey').AsString);
   FrmReturn_Mod01.bindingfield;
   FrmReturn_Mod01.Edit6.Text := '';
   FrmReturn_Mod01.Show;
end;

procedure TFrmMain_Mod01.N_DeleteClick(Sender: TObject);
var
  Lsql:string;
begin
  inherited;
    {删除}
  if messagedlg('确定要删除此记录吗？',mtconfirmation,[mbyes,mbno],0) = mryes then
    begin
       Lsql := 'select * from data0001 where rkey= '+ cdsMain.FieldByName('rkey').AsString;
       gSvrIntf.IntfGetDataBySql(Lsql,cds01) ;
       cds01.Delete;
       if gSvrIntf.IntfPostDataByTable('data0001',cds01.Delta) then
        begin
          cds01.MergeChangeLog;
          ShowMessage('删除记录成功');
          btnRefreshClick(Sender);
        end;
    end;
end;

procedure TFrmMain_Mod01.OnAfterModPost(Acds: TClientDataSet);
begin
    btnRefreshClick(Self);
end;



end.
