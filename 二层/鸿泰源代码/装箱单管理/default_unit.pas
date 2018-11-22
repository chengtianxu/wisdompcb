unit default_unit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls;

type
  TForm3 = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    Label2: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Edit1Click(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
   v_close:byte;
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation
uses damo, Unit_search;
{$R *.dfm}

procedure TForm3.FormActivate(Sender: TObject);
begin
if not dm.ADO192.IsEmpty then
 with dm.ADOQuery1 do
  begin
   close;
   sql.Clear;
   sql.Add('select unit_code,unit_name from data0002');
   sql.Add('where rkey='+dm.ado192.fieldbyname('unit_ptr').AsString);
   open;
   edit1.Text:=fieldvalues['unit_code'];
   edit1.Font.Color:=clwindowtext;
   label2.Caption:=fieldvalues['unit_name'];
   dm.ADO192.Edit;
  end
else
 dm.ADO192.Append;
end;

procedure TForm3.BitBtn1Click(Sender: TObject);
begin
 try
  form_unitcode:=tform_unitcode.Create(application);
  form_unitcode.Edit1.Text:=trim(edit1.Text);
  if form_unitcode.ADOQuery1.IsEmpty then
   begin
    Messagedlg('没有找到相关的记录!',mtinformation,[mbok],0);
    edit1.SetFocus;
   end
  else
  if form_unitcode.ShowModal=mrok then
   begin
    edit1.Text:=form_unitcode.ADOQuery1.FieldValues['unit_code'];
    edit1.Font.Color:=clwindowtext;
    label2.Caption:=form_unitcode.ADOQuery1.FieldValues['unit_name'];
    dm.ADO192.FieldValues['unit_ptr']:=form_unitcode.ADOQuery1.fieldvalues['rkey'];
    button1.SetFocus;
   end
  else
   edit1.SetFocus;
 finally
  form_unitcode.free;
 end;
end;

procedure TForm3.Button2Click(Sender: TObject);
begin
 v_close:=1;
 dm.ADO192.Cancel;
end;

procedure TForm3.Button1Click(Sender: TObject);
begin
 v_close:=1;
 dm.ADO192.Post;
end;

procedure TForm3.Edit1Click(Sender: TObject);
begin
if edit1.Font.Color=clwindowtext then
 begin
  edit1.SelectAll;
  edit1.Font.Color:=clblue;
 end;
end;

procedure TForm3.Edit1Exit(Sender: TObject);
begin
if (activecontrol.Name<>'BitBtn1') and (activecontrol.Name<>'Button2') then
 try
  form_unitcode:=tform_unitcode.Create(application);
  form_unitcode.Edit1.Text := trim(edit1.Text);
 if Comparetext(trim(edit1.Text),trim(form_unitcode.ADOQuery1.Fieldbyname('unit_code').AsString))=0 then
  begin
   edit1.Text:=form_unitcode.ADOQuery1.FieldValues['unit_code'];
   edit1.font.Color:=clwindowtext;
   label2.Caption:=form_unitcode.ADOQuery1.FieldValues['unit_name'];
   dm.ADO192.FieldValues['unit_ptr']:=form_unitcode.ADOQuery1.fieldvalues['rkey'];
  end
 else
  begin
   messagedlg('请输入正确的单位代码!',mtinformation,[mbcancel],0);
   edit1.SetFocus;
  end;
 finally
  form_unitcode.free;
 end;
end;

procedure TForm3.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
if v_close<>1 then
 dm.ADO192.Cancel;
end;

end.
