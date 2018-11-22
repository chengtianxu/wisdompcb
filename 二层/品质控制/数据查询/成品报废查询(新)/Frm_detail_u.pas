unit Frm_detail_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls, DB, ADODB, Grids,
  DBGridEh, Menus;

type
  TFrm_detail = class(TForm)
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    BitBtn1: TBitBtn;
    DataSource1: TDataSource;
    Eh1: TDBGridEh;
    ADO58: TADOQuery;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    procedure Eh1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure SpeedButton1Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure N1Click(Sender: TObject);
  private
   function account_maxdate:Tdatetime;
  public

  end;

var
  Frm_detail: TFrm_detail;

implementation

uses common, Frm_main_u;

{$R *.dfm}

procedure TFrm_detail.Eh1KeyDown(Sender:TObject; var Key:Word; Shift:TShiftState);
begin
  if (ssAlt in Shift)  and  (Key=86) then
  showmessage(ADO58.SQL.Text);
end;

procedure TFrm_detail.SpeedButton1Click(Sender: TObject);
begin
  Export_dbGridEH_to_Excel(Eh1,'成品报废');
end;

procedure TFrm_detail.PopupMenu1Popup(Sender: TObject);
begin
if ado58.IsEmpty then
 n1.Enabled:=false
else
 n1.Enabled:=true; 
end;

function TFrm_detail.account_maxdate:Tdatetime;
begin
 with frm_main.tmp do
 begin
  close;
  sql.Text:='select max(fg_date) as maxdate from data0444 ';
  open;
  if not fieldbyname('maxdate').IsNull then
   result:=fieldvalues['maxdate']
  else
   result:=date()-3650;
 end;
end;

procedure TFrm_detail.N1Click(Sender: TObject);
begin
if (vprev='1') or (vprev='3') then
 showmsg('对不起,你只该程序的只读权限',1)
else
 if ado58.FieldByName('ttype2').AsString='报废' then
 begin
 if is_fg_counting then
  messagedlg('产成品正在进行盘点,不能进行报废处理!',mtinformation,[mbOk],0)
 else
  if account_maxdate > ado58.FieldByName('TDATETIME').AsDateTime then
   showmsg('成本截数日期大于报废日期,不能取消!',1)
  else
  try
   frm_main.ADOCon.BeginTrans ;
    with frm_main.tmp do
     begin
      close;
      sql.Text:='update data0025'+#13+
      'set QTY_ON_HAND=data0025.QTY_ON_HAND+data0058.QTY_REJECT'+#13+
      'from data0058 inner join data0053 on'+#13+
      'data0058.TRAN_PTR=data0053.rkey inner join data0025 on'+#13+
      'data0053.CUST_PART_PTR=data0025.rkey'+#13+
      'where data0058.rkey='+ado58.FieldByName('rkey').AsString;
      ExecSQL;
     end;
    with frm_main.tmp do
     begin
      close;
      sql.Text:='update data0053'+#13+
      'set qty_on_hand=data0053.qty_on_hand +data0058.QTY_REJECT'+#13+
      'from data0058 inner join data0053 on'+#13+
      'data0058.TRAN_PTR=data0053.rkey '+#13+
      'where data0058.rkey='+ado58.FieldByName('rkey').AsString;
      ExecSQL;
     end;
    with frm_main.tmp do
     begin
      close;
      sql.Text:='delete data0058'+#13+
      'where data0058.rkey='+ado58.FieldByName('rkey').AsString;
      ExecSQL;
     end;
    frm_main.ADOCon.CommitTrans;
    messagedlg('取消成品报废操作成功',mtinformation,[mbok],0);
    ADO58.Close;
    ADO58.Prepared;
    ADO58.Open;
   except
    on E: Exception do
    begin
     frm_main.ADOCon.RollbackTrans;
     messagedlg(E.Message,mterror,[mbcancel],0);
    end;
   end;
 end
 else
  showmsg('对不起成品盘点差异不能取消',1);
end;

end.
