unit Dlg_between;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls, 
  Buttons, ExtCtrls, ComCtrls,variants, Mask;

type
  TfrmDlg_between = class(TForm)
    OKBtn: TButton;
    CancelBtn: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Notebook1: TNotebook;
    edtValue1: TEdit;
    edtValue2: TEdit;
    dtpStartDate: TDateTimePicker;
    dtpEndDate: TDateTimePicker;
    Bevel1: TBevel;
    dtpStartTime: TDateTimePicker;
    dtpEndTime: TDateTimePicker;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure edtValue1KeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    ndataType:string;
    function Check_Values:boolean;
  public
    { Public declarations }
    procedure InitForm(dataType:string;nValue1,nValue2:variant);
    function Get_rslt:string;
  end;

var
  frmDlg_between: TfrmDlg_between;

implementation
uses PUBFunc;
{$R *.dfm}

{ TfrmDlg_between }

function TfrmDlg_between.Get_rslt: string;
begin
  if ndataType = 'D' then
    result := QuotedStr(FormatDatetime('yyyy-mm-dd',dtpStartDate.Date)+FormatDatetime(' hh:nn:ss',dtpStartTime.Time))+' AND '+QuotedStr(FormatDatetime('yyyy-mm-dd',dtpEndDate.Datetime)+FormatDatetime(' hh:nn:ss',dtpEndTime.Time))
  else
  begin
    if (trim(edtValue1.Text) = '' ) or (trim(edtValue2.Text)='') then
      ShowMsg('2个数值必须都要设置',1);
    try
      if nDataType = 'S' then
        result := QuotedStr(trim(edtValue1.Text))+' AND '+ QuotedStr(trim(edtValue2.Text))
      else if nDataType = 'F' then
        result := FloatToStr(StrToFloat(trim(edtValue1.Text))) +' AND '+ FloatToStr(StrToFloat(trim(edtValue2.Text)));
    except
      ShowMsg('请输入正确的数值',1);
    end;
  end;
end;

procedure TfrmDlg_between.InitForm(dataType:string;nValue1, nValue2: variant);
begin
  ndataType:=dataType;
  if dataType = 'D' then
  begin
    NoteBook1.PageIndex := 1;
    Label1.Caption := '开始日期';
    Label2.Caption := '结束日期';
    if trim(nValue1)='' then
      dtpStartDate.DateTime := now-1//date
    else
    begin
      dtpStartDate.Date := nValue1;
      dtpStartTime.Time := nValue1;
    end;

    if trim(nValue2)=''  then
      dtpEndDate.Datetime := now
    else
    begin
      dtpEndDate.Date := nValue2;
      dtpEndTime.Time := nValue2;
    end;
  end
  else
  begin
    NoteBook1.PageIndex := 0;
    Label1.Caption := '开始数值';
    Label2.Caption := '结束结束';

    edtValue1.Text := VarAsType(nValue1,varString);
    edtValue2.Text := VarAsType(nValue2,varString);
  end;
end;

procedure TfrmDlg_between.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if Modalresult = mrok then
    CanClose:=Check_Values
  else
    CanClose:= true;
end;

function TfrmDlg_between.Check_Values: boolean;
begin
  result := true;
  if ndataType <> 'D' then
  begin
    if (trim(edtValue1.Text) = '' ) or (trim(edtValue2.Text)='') then
    begin
      ShowMsg('2个数值必须都要设置',1);
      result:=false;
    end;
    try
      if nDataType = 'F' then
      begin
        FloatToStr(StrToFloat(trim(edtValue1.Text)));
        FloatToStr(StrToFloat(trim(edtValue2.Text)));
      end;
    except
      raise;
      result := false;
    end;
  end;
end;

procedure TfrmDlg_between.edtValue1KeyPress(Sender: TObject;
  var Key: Char);
begin
  if ndataType <> 'F' then exit;
  if (length((Sender as TEdit).Text)=20) and (key<>chr(8)) then Abort;
  if (pos('.',(Sender as TEdit).Text)>0) and (key='.') then abort;
  if (pos(key,'-0123456789.')=0) and (key<>chr(8)) then
    Abort;
  if (pos('-',(Sender as TEdit).Text)>0) and (key='-') then abort;
  if Length((Sender as TEdit).text)>0 then
    if (key='-') then abort;
end;

procedure TfrmDlg_between.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
//  Action := caFree;
end;

end.
