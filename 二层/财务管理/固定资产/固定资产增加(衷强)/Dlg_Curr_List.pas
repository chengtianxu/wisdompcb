unit Dlg_Curr_List;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls;

type
  TfrmDlg_Curr_List = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    comboxCurr: TComboBox;
    Button1: TButton;
    Button2: TButton;
    edtExchRate: TEdit;
    edtOrgValue: TEdit;
    edtValue: TEdit;
    procedure comboxCurrChange(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure edtExchRateChange(Sender: TObject);
    procedure edtOrgValueKeyPress(Sender: TObject; var Key: Char);
    procedure comboxCurrKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Enter(Enter_MOde:byte);
  end;

var
  frmDlg_Curr_List: TfrmDlg_Curr_List;

implementation
uses dm,common,MyClass,ConstVar;
{$R *.dfm}

{ TfrmDlg_Curr_List }

procedure TfrmDlg_Curr_List.Enter(Enter_MOde:byte);
var
  sqlstr:string;
begin
  sqlstr:='select rKey,Curr_Code,Curr_Name,Base_To_Other,Quote_Based from data0001';
  MyDataClass.OpenQuery(dmcon.qryTmp,sqlstr);
  dmcon.qryTmp.first;
  while not dmcon.qryTmp.Eof do begin
    comboxCurr.Items.Add(trim(dmcon.qryTmp.fieldByName('Curr_Name').AsString));
    if Enter_Mode = em_Add then
    if dmcon.qryTmp.fieldByName('Quote_Based').Asinteger = 1 then
    begin
      comboxCurr.ItemIndex := dmcon.qryTmp.RecNo - 1 ;
      edtExchRate.Text := dmcon.qryTmp.fieldByName('Base_To_Other').Asstring;
    end;
    dmcon.qryTmp.next;
  end;
  if Enter_MOde=em_add then exit;
  if dmcon.ads325.IsEmpty then exit;
  comboxCurr.Text := dmcon.ads325.fieldByName('Curr_Name').AsString;
  edtExchRate.Text :=dmcon.ads325.fieldByName('ex_rate').AsString;
  edtOrgValue.Text :=dmcon.ads325.fieldByName('orig_curr_orig_value').AsString;
end;

procedure TfrmDlg_Curr_List.comboxCurrChange(Sender: TObject);
begin
  if trim(comboxCurr.Text)='' then exit;
  if dmcon.qryTmp.Locate('Curr_Name',trim(comboxCurr.Text),[]) then
    edtExchRate.Text := dmcon.qryTmp.FieldByName('Base_To_Other').asString;
end;

procedure TfrmDlg_Curr_List.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  canclose:=true;
  if Modalresult = mrok then
  begin
    if trim(edtExchRate.Text)='' then
    begin
      ShowMsg('汇率不能为空',1);
      canclose:=false;
      exit;
    end;
    if STRToFloat(edtExchRate.Text)<=0 then 
    begin
      ShowMsg('汇率必须大于零',1);
      canclose:=false;
      exit;
    end;
    if trim(edtOrgValue.Text)='' then
    begin
      ShowMsg('原币金额不能为空',1);
      canclose:=false;
      exit;
    end;
    if STRToFloat(edtOrgValue.Text)<=0 then
    begin
      ShowMsg('原币金额必须大于零',1);
      canclose:=false;
      exit;
    end;
    if trim(comboxCurr.Text)='' then
    begin
      ShowMsg('货币不能为空',1);
      canclose:=false;
      exit;
    end;
    if not dmcon.qryTmp.Locate('Curr_Name',trim(comboxCurr.Text),[]) then
    begin
      ShowMsg('无效的货币,请重新选择!',1);
      canclose:= false;
      exit;
    end;
  end;
end;

procedure TfrmDlg_Curr_List.edtExchRateChange(Sender: TObject);
begin
  if (trim(edtExchRate.Text)='') or (trim(edtOrgValue.Text)='') then exit;
    edtValue.Text :=  FloatToStr(StrToFloat(edtExchRate.Text)*StrToFloat(edtOrgValue.Text))
end;

procedure TfrmDlg_Curr_List.edtOrgValueKeyPress(Sender: TObject;
  var Key: Char);
begin
    if (length((Sender as TEdit).Text)=20) and (key<>chr(8)) then Abort;
    if (pos('.',(Sender as TEdit).Text)>0) and (key='.') then abort;
    if (pos(key,'-0123456789.')=0) and (key<>chr(8) ) and (Key <> #22) and (Key <> #3) then
      Abort;
    if (key='-') then abort;
    if Length((Sender as TEdit).text)>0 then
      if (key='-') then abort;
end;

procedure TfrmDlg_Curr_List.comboxCurrKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    SendMessage(GetParentForm(Self).Handle, wm_NextDlgCtl, 0, 0);
  end;
  if (Key = #13) then Key := #0;

  inherited KeyPress(Key);
end;

end.
