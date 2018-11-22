unit UDetail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls,math;

type
  TDetail_Form = class(TForm)
    Label2: TLabel;
    Panel1: TPanel;
    Label1: TLabel;
    Label3: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label4: TLabel;
    Label5: TLabel;
    Edit4: TEdit;
    Edit3: TEdit;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Edit2Exit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Edit2Click(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit4KeyPress(Sender: TObject; var Key: Char);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure Edit4Exit(Sender: TObject);
    procedure Edit3Exit(Sender: TObject);
    procedure Edit4Change(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
  private
  v_close:byte;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Detail_Form: TDetail_Form;

implementation

uses common, UWzpr125;

{$R *.dfm}

procedure TDetail_Form.BitBtn2Click(Sender: TObject);
begin
 v_close:=1;
 Main_Form.ADOQuery1.Cancel;
end;

procedure TDetail_Form.BitBtn1Click(Sender: TObject);
begin
  IF trim(EDIT1.Text)='' then
    begin
        messagedlg('PCB类型不能为空!',mtwarning,[mbok],0);
        edit1.SetFocus;
    end
else
  begin
    if (trim(edit2.Text)= '') or (strtofloat(trim(Edit2.Text)) = 0) or (strtofloat(trim(Edit2.Text)) = 0.00) then
    begin
       messagedlg('折率不能为零或为空!',mtwarning,[mbok],0);
        edit2.SetFocus;
         // v_close:=1; //正常退出
         // ModalResult:=mrok;
    end
    else
      if strtofloat(trim(Edit2.Text)) > 100.00 then
      begin
        ShowMsg('折率不可以大于100%',1);
        edit2.Text := '100.00';
        edit2.SetFocus;
        edit2.SelectAll;
      end
    else
      if  trim(edit3.Text)= '' then
    begin
      messagedlg('折率下限不能为零或为空!',mtwarning,[mbok],0);
      edit3.SetFocus;
    end
    else
     if  trim(edit4.Text)= '' then
    begin
      messagedlg('折率上限不能为零或为空!',mtwarning,[mbok],0);
      edit4.SetFocus;
    end
    else
      begin
          //ShowMsg(Main_form.adoquery1.RecordCount,1);
          Main_form.ADOQuery1.FieldValues['PCB_Type'] := edit1.Text;
          Main_form.ADOQuery1.FieldValues['Disc_Rate'] := formatfloat('0.00',strtofloat(trim(edit2.Text)));
          Main_form.ADOQuery1.FieldValues['Up_Limit'] := formatfloat('0.00',strtofloat(trim(edit4.Text)));
          Main_form.ADOQuery1.FieldValues['Low_Limit'] := formatfloat('0.00',strtofloat(trim(edit3.Text)));
          v_close:=1; //正常退出
          ModalResult:=mrok;
      end;
  end;
end;

procedure TDetail_Form.FormActivate(Sender: TObject);
begin
 edit1.SetFocus;
 v_close:=0;
end;


procedure TDetail_Form.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
 if v_close<>1 then
  Main_form.ADOQuery1.Cancel;
end;


procedure TDetail_Form.Edit2Exit(Sender: TObject);
begin
if (Edit2.Text<> '') then
begin
if frac(strtofloat(trim(Edit2.Text)))>0.99 then
      begin
        ShowMsg('数据不在合理范围以内，请修改',1);
        edit2.Text := '0.00';
        edit2.SetFocus;
        edit2.SelectAll;
      end;
end
else
 begin
  (sender as tedit).Text:='0.00';
  Main_form.ADOQuery1.fieldvalues['Disc_Rate']:=null;
  end;
(sender as tedit).Text:=formatfloat('0.00',strtofloat((sender as tedit).Text));
end;

procedure TDetail_Form.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 edit1.Text := '';
 edit2.Text := '0.00';
 edit3.Text := '0.00';
 edit4.Text := '0.00';
 edit2.Font.Color := clblue;
end;

procedure TDetail_Form.Edit2Click(Sender: TObject);
begin
  if edit2.Font.Color=clwindowtext then
  begin
   edit2.Font.Color:=clblue;
   edit2.SelectAll;
  end;
end;

procedure TDetail_Form.Edit2Change(Sender: TObject);
begin
if Edit2.Text<> '' then
  if strtofloat(trim(Edit2.Text)) > 100.00 then
    begin
        ShowMsg('折率不可以大于100%',1);
        edit2.Text := '0.00';
        edit2.SetFocus;
        edit2.SelectAll;
    end;
end;

procedure TDetail_Form.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['0'..'9','.',#8]) then  //判断是否输入数字
  abort
 else
  if key = chr(46) then      //判断是否重复输入小数点'.'
   if pos('.',(sender as tedit).Text)>0  then abort;
end;

procedure TDetail_Form.Edit4KeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['0'..'9','.',#8]) then  //判断是否输入数字
  abort
 else
  if key = chr(46) then      //判断是否重复输入小数点'.'
   if pos('.',(sender as tedit).Text)>0  then abort;
end;

procedure TDetail_Form.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['0'..'9','.',#8]) then  //判断是否输入数字
  abort
 else
  if key = chr(46) then      //判断是否重复输入小数点'.'
   if pos('.',(sender as tedit).Text)>0  then abort;
end;

procedure TDetail_Form.Edit4Exit(Sender: TObject);
begin
 if (Edit3.Text<> '') and (Edit4.Text<> '') then
 begin
  if strtofloat(trim(Edit3.Text)) > strtofloat(trim(Edit4.Text)) then
      begin
          ShowMsg('折率下限不可以大于折率上限，请修改',1);
          //edit3.Text := '0.00';
          edit3.SetFocus;
          edit3.SelectAll;
      end;
  end
 else
begin
if (Edit4.Text<> '') then
begin
 if strtofloat(trim(Edit4.Text)) > 999.99 then
   begin
        ShowMsg('数据不在合理范围以内，请修改',1);
        edit4.Text := '999.99';
        edit4.SetFocus;
        edit4.SelectAll;
    end;

 if frac(strtofloat(trim(Edit4.Text)))>0.99 then
   begin
        ShowMsg('数据不在合理范围以内，请修改',1);
        edit4.Text := '0.00';
        edit4.SetFocus;
        edit4.SelectAll;
   end;
 end;
end;

if trim((sender as tedit).Text)='' then
 begin
  (sender as tedit).Text:='0.00';
  Main_form.ADOQuery1.fieldvalues['Up_Limit']:=null;
  end;
  (sender as tedit).Text:=formatfloat('0.00',strtofloat((sender as tedit).Text));

end;

procedure TDetail_Form.Edit3Exit(Sender: TObject);
begin
if (Edit3.Text<> '') and (Edit4.Text<> '') then
begin
   if strtofloat(trim(Edit4.Text)) < strtofloat(trim(Edit3.Text)) then
      begin
          ShowMsg('折率上限不可以小于折率下限,请修改',1);
          //edit4.Text := '0.00';
          edit4.SetFocus;
          edit4.SelectAll;
      end;
    end
  else
begin
if (Edit3.Text<> '') then
begin
 if strtofloat(trim(Edit3.Text)) > 999.99 then
   begin
        ShowMsg('数据不在合理范围以内，请修改',1);
        edit3.Text := '0.00';
        edit3.SetFocus;
        edit3.SelectAll;
    end;

   if frac(strtofloat(trim(Edit3.Text)))>0.99 then
   begin
        ShowMsg('数据不在合理范围以内，请修改',1);
        edit3.Text := '0.00';
        edit3.SetFocus;
        edit3.SelectAll;
   end;
 end;
end;
if trim((sender as tedit).Text)='' then
 begin
  (sender as tedit).Text:='0.00';
  Main_form.ADOQuery1.fieldvalues['Low_Limit']:=null;
  end;
  (sender as tedit).Text:=formatfloat('0.00',strtofloat((sender as tedit).Text));

end;

procedure TDetail_Form.Edit4Change(Sender: TObject);
begin
if Edit4.Text<> '' then
  if strtofloat(trim(Edit4.Text)) > 999.99 then
   begin
        ShowMsg('数据不在合理范围以内，请修改',1);
        edit4.Text := '999.99';
        edit4.SetFocus;
        edit4.SelectAll;
    end;
end;


procedure TDetail_Form.Edit3Change(Sender: TObject);
begin
if Edit3.Text<> ''then
  if strtofloat(trim(Edit3.Text)) > 999.99 then
   begin
        ShowMsg('数据不在合理范围以内，请修改',1);
        edit3.Text := '0.00';
        edit3.SetFocus;
        edit3.SelectAll;
    end;
end;

end.
