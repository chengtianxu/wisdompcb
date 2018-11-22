unit Frm_back_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, Grids, DBGridEh , ADODB,
  DBClient, TConnect, Provider;

type
  TFrm_back = class(TForm)
    Panel1: TPanel;
    BtBack: TBitBtn;
    BtCancel: TBitBtn;
    DataSource1: TDataSource;
    Label1: TLabel;
    Edit1: TEdit;
    CDS: TClientDataSet;
    DSP: TDataSetProvider;
    Grd1: TDBGridEh;
    tmp: TADOQuery;
    procedure BtBackClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Grd1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Grd1TitleClick(Column: TColumnEh);
    procedure Edit1Change(Sender: TObject);
    procedure CDSFilterRecord(DataSet: TDataSet; var Accept: Boolean);
  private
    PreColumn: TColumnEh;
    field_name:string;
  public

  end;

implementation

uses DM_u,common;

{$R *.dfm}

procedure TFrm_back.FormShow(Sender: TObject);
var i:integer;
begin
  field_name := Grd1.Columns[1].FieldName;
  Label1.Caption := Grd1.Columns[1].Title.Caption ;
  PreColumn := Grd1.Columns[1];
  PreColumn.Title.Color:=clRed;
  DM.tmp.Close;
  DM.tmp.SQL.Text:='SELECT cast(0 as bit )isSel,dbo.Data0008.PROD_CODE, dbo.Data0008.PRODUCT_NAME, dbo.Data0008.PRODUCT_DESC, dbo.data0492.CUT_NO,'+
                   'dbo.data0492.ORD_REQ_QTY,dbo.Data0005.EMPLOYEE_NAME, dbo.data0492.tobestock_date, dbo.data0492.REMARK,  dbo.Data0034.DEPT_CODE,'+
                   'dbo.Data0034.DEPT_NAME,dbo.Data0008.RKEY rkey08,data0492.rkey rkey492 '+
                   'FROM dbo.data0492 INNER JOIN '+
                   'dbo.Data0008 ON dbo.data0492.BOM_PTR = dbo.Data0008.RKEY INNER JOIN '+
                   'dbo.Data0034 ON dbo.data0492.mrb_ptr = dbo.Data0034.RKEY INNER JOIN '+
                   'dbo.Data0005 ON dbo.data0492.COMPLETED = dbo.Data0005.RKEY '+
                   'where data0492.ORD_REQ_QTY>0 order by Data0008.PROD_CODE ';
  DM.tmp.Open;
  for i:=0 to DM.tmp.Fields.Count-1 do DM.tmp.Fields[i].ReadOnly:=(i<>0);
  CDS.Filter:='';
  DSP.DataSet:=DM.tmp;
  CDS.Data:=DSP.Data;
end;

procedure TFrm_back.BtBackClick(Sender: TObject);
var
  sRkey492:string;
  i:integer;
begin
  if CDS.RecordCount=0 then exit;
  if messagedlg('确定退回所选记录吗?'+ #13,mtconfirmation,[mbYes,mbNo],0) = mrNo then exit;
  sRkey492:='';
  
  CDS.DisableControls;
  CDS.OnFilterRecord:=nil;
  CDS.Filter:='isSel=1';
  CDS.Filtered:=true;
  CDS.First ;
  i:=0;
  while not CDS.Eof do
  begin
    if CDS.FieldByName('isSel').AsBoolean then
    begin
      sRkey492:=sRkey492+CDS.FieldByName('rkey492').AsString+',';
      inc(i);
    end;
    CDS.Next ;
  end;
  if sRkey492<>'' then
  try
    Tmp.Close;
    Tmp.SQL.Text:='update data0492 set ord_req_qty=0,wip_qty=wip_qty+ord_req_qty,'+
                  'completed='+user_ptr+',tobestock_date=null where rkey in ('+sRkey492+'0) and ord_req_qty>0';
    DM.ADOCon.BeginTrans;
    if Tmp.ExecSQL<>i then
    begin
      DM.ADOCon.RollbackTrans;
      showmessage('数据状态发生改变,退回失败!');
    end else begin
      DM.ADOCon.CommitTrans;
      showmessage('成功退回!');
    end;
    Modalresult := mrok;
  except
    on E: Exception do
      begin
        MessageDlg(E.Message,mtError, [mbOk], 0);
      end;
  end;
end;


procedure TFrm_back.Grd1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (ssAlt in Shift)  and  (Key=86) then
  showmessage(DM.tmp.SQL.Text);
end;

procedure TFrm_back.Grd1TitleClick(Column: TColumnEh);
begin
  if (field_name <> column.FieldName) then
  begin
    Label1.Caption := column.Title.Caption ;
    field_name := column.FieldName ;
    edit1.SetFocus;
    PreColumn.Title.Color := clBtnFace ;
    Column.Title.Color := clred ;
    PreColumn := column ;
    Edit1Change(Edit1);
  end else
    edit1.SetFocus;
end;

procedure TFrm_back.Edit1Change(Sender: TObject);
begin
  CDS.Filtered:=false;
  CDS.Filtered:=true;
end;

procedure TFrm_back.CDSFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  if Edit1.Text<>'' then
    Accept:=(Pos(uppercase(Edit1.Text),uppercase(CDS.FieldByName(field_name).AsString))>0)
  else
   Accept:=true;
end;

end.
