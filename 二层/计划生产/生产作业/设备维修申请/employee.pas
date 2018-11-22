unit employee;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, Buttons, Grids, DBGridEh;

type
  TFrm_employee = class(TForm)
    DBGridEh1: TDBGridEh;
    BitBtn2: TBitBtn;
    ADO32: TADODataSet;
    DataSource1: TDataSource;
    ADO32empl_code: TStringField;
    ADO32employee_name: TStringField;
    ADO32phone: TWideStringField;
    ADO32job: TWideStringField;
    ADO32territory: TWideStringField;
    ADO32userName: TIntegerField;
    procedure DBGridEh1EditButtonClick(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_employee: TFrm_employee;

implementation

uses Pick_Item_Single,ConstVar, DM_u,common;

{$R *.dfm}

procedure TFrm_employee.DBGridEh1EditButtonClick(Sender: TObject);
var
  InputVar: PDlgInput ;
  user_login:string;
begin
  try
    frmPick_Item_Single := TfrmPick_Item_Single.Create(Application) ;
    InputVar.Fields := 'EMPL_CODE/用户代码/80,EMPLOYEE_NAME/用户名称/100,PHONE/联系电话/100,TPOSTION/职务/80';
    InputVar.Sqlstr := 'select RKEY,EMPL_CODE,EMPLOYEE_NAME,ISNULL(PHONE,'''') AS PHONE,ISNULL(TPOSTION,'''') AS TPOSTION '+
                       'from data0005 where ACTIVE_FLAG=''Y'''+
                       'order by EMPL_CODE';
    InputVar.AdoConn := DM.ADOCon;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      if ADO32empl_code.Value<>'' then
      begin
        with DM.ADOQuery1 do
        begin
          Active:=False;
          SQL.Clear;
          SQL.Add('update data0032 set phone=:phone,job=:job,territory=:territory where userName=:userName');
          Parameters[0].Value:=ADO32phone.Value;
          Parameters[1].Value:=ADO32job.Value;
          Parameters[2].Value:=ADO32territory.Value;
          Parameters[3].Value:=ADO32userName.Value;
          Prepared;
          ExecSQL;
        end;
      end
      else
      begin
        ADO32.Append;
        with DM.ADOQuery1 do
        begin
          Active:=False;
          SQL.Clear;
          SQL.Add('select * from data0032 where userName='+inttostr(frmPick_Item_Single.adsPick.FieldValues['RKEY']));
          Active:=True;
          if not IsEmpty then
          begin
            ShowMessage('已存在名单中，请不要重复添加');
            Abort;
          end;
        end;
        ADO32userName.Value:=frmPick_Item_Single.adsPick.FieldValues['RKEY'];
        ADO32empl_code.Value:=frmPick_Item_Single.adsPick.FieldValues['EMPL_CODE'];
        ADO32employee_name.Value:=frmPick_Item_Single.adsPick.FieldValues['EMPLOYEE_NAME'];
        ADO32phone.Value:=frmPick_Item_Single.adsPick.FieldValues['PHONE'];
        ADO32job.Value:=frmPick_Item_Single.adsPick.FieldValues['TPOSTION'];
        with DM.ADOQuery1 do
        begin
          Active:=False;
          SQL.Clear;
          SQL.Add('insert into data0032 (userName,phone,job,territory) values (:userName,:phone,:job,:territory)');
          Parameters[0].Value:=ADO32userName.Value;
          Parameters[1].Value:=ADO32phone.Value;
          Parameters[2].Value:=ADO32job.Value;
          Parameters[3].Value:=ADO32territory.Value;
          Prepared;
          ExecSQL;
        end;
      end;
      ADO32.Close;
      ADO32.Open;
    end
  finally
    frmPick_Item_Single.adsPick.Close;
    frmPick_Item_Single.Free ;
  end;
end;

procedure TFrm_employee.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if strtoint(vprev)=4 then
  begin
    if (key=46) and (ssCtrl in shift) then
    begin
      with dm.ADOQuery1 do
      begin
        close;
        sql.Text:='delete data0032 where userName='
                          +quotedstr(ADO32userName.Text);
        ExecSQL;
        ADO32.Close;
        ADO32.Open;
      end;
    end;
    if (key=46) and (ssCtrl in shift) then Abort;
  end;
end;

procedure TFrm_employee.FormShow(Sender: TObject);
var
  i:Byte;
begin
  if strtoint(vprev)<>4 then
  begin
    DBGridEh1.ReadOnly:=True;
    DBGridEh1.Columns[0].ButtonStyle:=cbsAuto;
  end;
end;

end.
