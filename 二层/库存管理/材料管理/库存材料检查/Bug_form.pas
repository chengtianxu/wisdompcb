unit Bug_form;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ExtCtrls;

type
  TForm_bug = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    RadioGroup1: TRadioGroup;
    Edit1: TEdit;
    Edit2: TEdit;
    Button1: TButton;
    Button2: TButton;
    BitBtn1: TBitBtn;
    rkey76: TLabel;
    bug76: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_bug: TForm_bug;

implementation
uses damo,main,bugser_form,IQC_FORM;

{$R *.dfm}

procedure TForm_bug.BitBtn1Click(Sender: TObject);
begin
  try
    form_bugser:=tform_bugser.Create(application);
    if form_bugser.ShowModal=mrok then
    begin
      edit1.Text:=form_bugser.ADOQuery1code.Value;
      rkey76.Caption:=form_bugser.ADOQuery1RKEY.AsString;
      bug76.Caption:=form_bugser.ADOQuery1reject_description.Value;
      edit2.SetFocus;
    end;
  finally
    form_bugser.Free;
  end;
end;

procedure TForm_bug.Edit1Exit(Sender: TObject);
begin
if (activecontrol.Name<>'BitBtn1') and (activecontrol.Name<>'button2') and
   (trim(edit1.Text)<>'') then
try
  form_bugser:=tform_bugser.Create(application);
  form_bugser.Edit1.Text:=edit1.Text;
  if form_bugser.ADOQuery1.IsEmpty then
   begin
    messagedlg('请输入正确的编号！',mtinformation,[mbok],0);
    edit1.SetFocus;
   end
   else
    begin
    rkey76.Caption:=form_bugser.ADOQuery1RKEY.AsString;
    bug76.Caption:=form_bugser.ADOQuery1reject_description.Value;
    edit2.SetFocus;
    end;
 finally
   form_bugser.Free;
 end
 else
  if (activecontrol.Name<>'BitBtn1') and (self.ActiveControl.Name<>'Button2') and
     (trim(edit1.Text)='') then
  begin
   messagedlg('请输入缺陷编号！',mtinformation,[mbok],0);
   edit1.SetFocus;
  end;
end;

procedure TForm_bug.Edit2KeyPress(Sender: TObject; var Key: Char);
var
s : string;
begin
   if not (key in ['0'..'9','.',#8]) then
        begin
            showmessage('只允许输入数字与一个小数点');
            abort ;
        end
    else
        begin
            if (key = chr(46)) then
                s := Edit2.Text 
            else
                exit ;
            if pos('.',s)>0 then
                begin
                     showmessage('只允许输入一个小数点');
                     abort;
                end ;
        end;
end;

procedure TForm_bug.Button2Click(Sender: TObject);
begin
  self.Close;
end;

procedure TForm_bug.Button1Click(Sender: TObject);
var
 i : integer;
 flag :double;
begin
  for i:=form_iqc.v_count+1 to form_iqc.SGrid1.RowCount-2 do
  if (form_iqc.SGrid1.Cells[0,i]=RadioGroup1.Items[radiogroup1.ItemIndex]) and (form_iqc.SGrid1.Cells[2,i]=edit1.Text) then
  begin
    messagedlg('已经有这种类型的记录，请删除原记录后再新增!',mtinformation,[mbok],0);
    modalresult:=mrok;
    exit;
  end;

  if (strtocurr(form_IQC.edit2.Text)-strtocurr(edit2.Text)-strtocurr(form_IQC.Edit1.Text)
     -strtocurr(form_IQC.Edit3.Text)-strtocurr(form_IQC.Edit4.Text)+form_IQC.v_edit3+form_IQC.v_edit4)<0 then
  begin
    flag:=(strtocurr(form_IQC.edit2.Text)-strtocurr(form_IQC.Edit1.Text)
          -strtocurr(form_IQC.Edit3.Text)-strtocurr(form_IQC.Edit4.Text)
          +form_IQC.v_edit3+form_IQC.v_edit4) ;
    messagedlg('可使用数量最多为'+floattostr(flag),mtinformation,[mbok],0) ;
    edit2.Text:='0';
    edit2.SetFocus;
  end
  else
  begin
    if radiogroup1.ItemIndex=0 then
      form_IQC.Edit3.Text:=floattostr(Strtofloat(form_IQC.Edit3.Text)+strtofloat(edit2.Text))
    else
      form_IQC.Edit4.Text:=floattostr(Strtofloat(form_IQC.Edit4.Text)+strtofloat(edit2.Text));
    form_IQC.SGrid1.Cells[0,form_IQC.SGrid1.RowCount-1]:=RadioGroup1.Items[radiogroup1.ItemIndex];
    form_IQC.SGrid1.Cells[1,form_IQC.SGrid1.RowCount-1]:=edit2.Text;
    form_IQC.SGrid1.Cells[2,form_IQC.SGrid1.RowCount-1]:=edit1.Text;
    form_IQC.SGrid1.Cells[3,form_IQC.SGrid1.RowCount-1]:=bug76.Caption;
    form_IQC.SGrid1.Cells[4,form_IQC.SGrid1.RowCount-1]:=rkey76.Caption;
    form_IQC.SGrid1.RowCount:=form_IQC.SGrid1.RowCount+1;
    modalresult:=mrok;
  end;
end;

procedure TForm_bug.Edit2Exit(Sender: TObject);
begin
   if ((edit2.Text='') or (strtofloat(edit2.Text)<=0.0))and(self.ActiveControl.Name<>'Button2')
   then
     begin
     messagedlg('请输入数量!',mtinformation,[mbok],0);
     edit2.Text:='0';
     edit2.SetFocus;
    end;
end;

end.
