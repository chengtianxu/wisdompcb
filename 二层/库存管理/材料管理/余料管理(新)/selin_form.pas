unit selin_form;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, Grids, StdCtrls, Mask, DBCtrls, ExtCtrls, ComCtrls,
  Buttons, DBGrids;

type
  TForm_selin = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Edit1: TEdit;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    dt1: TDateTimePicker;
    dt2: TDateTimePicker;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    BitBtn6: TBitBtn;
    BitBtn4: TBitBtn;
    procedure Edit1Change(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dt1Exit(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
  private
    { Private declarations }
    field_name :string;
  public
    { Public declarations }
  end;

var
  Form_selin: TForm_selin;

implementation

uses damo,main,Unit_inser3,report2_form;

{$R *.dfm}

procedure TForm_selin.Edit1Change(Sender: TObject);
begin
 if trim(Edit1.text)<>'' then
  dm.ADOin557.Filter := field_name+' like ''%'+trim(edit1.text)+'%'''
 else
  dm.ADOin557.filter := '';
end;

procedure TForm_selin.DBGrid1TitleClick(Column: TColumn);
var
 i:byte;
begin
if (field_name<>column.FieldName)and (column.ReadOnly)  then
 begin
  label1.Caption:=column.Title.Caption;
  field_name:=column.FieldName;
  edit1.SetFocus;
  for i:=0 to dbgrid1.FieldCount-1 do
   if dbgrid1.Columns[i].Title.Color= clred then
    dbgrid1.Columns[i].Title.Color:= clbtnface;
  column.Title.Color:=clred;
 end
else
 edit1.SetFocus;

end;

procedure TForm_selin.BitBtn3Click(Sender: TObject);
begin
form1.CopyDbDataToExcel([dbgrid1]);
end;

procedure TForm_selin.BitBtn2Click(Sender: TObject);
begin
dm.ADOIN557.Close;
dm.ADOIN557.Open;
end;

procedure TForm_selin.BitBtn1Click(Sender: TObject);
begin
dm.ADOIN557.Close;
self.Close;
end;

procedure TForm_selin.FormCreate(Sender: TObject);
begin
field_name:='mat_code';
dt2.Date:=Now;
dt1.Date:=dt2.Date-5;
with dm.ADOIN557 do
 begin
 close;
 parameters[0].Value:=dt1.Date;
 parameters[1].Value:=dt2.Date+1;
 open;
 end;
end;

procedure TForm_selin.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (shift=[ssalt])and ((key=ord('s'))or (key=ord('S'))) then
showmessage(dm.ADOIN557.CommandText);
end;

procedure TForm_selin.dt1Exit(Sender: TObject);
begin
 dm.ADOIN557.Close;
 dm.ADOIN557.Parameters[0].Value:=self.dt1.Date;
 dm.ADOIN557.Parameters[1].Value:=self.dt2.Date+1;
 dm.ADOIN557.Open;
end;

procedure TForm_selin.DBGrid1DblClick(Sender: TObject);
begin
{  try
 Form_inser3:=tForm_inser3.Create(application);

   with dm.ADOQuery2 do
   begin
   Close;
   Parameters[0].Value :=dm.ADOIN557.fieldbyname('RKEY17').AsInteger;
   Open;
   end;
   form_inser3.ShowModal;
 finally
 form_inser3.Free;
 end; }

end;

procedure TForm_selin.BitBtn6Click(Sender: TObject);
begin
 form_report2:=Tform_report2.Create(application);
 form_report2.ADODataSet1.Close;
 form_report2.ADODataSet1.Parameters[0].Value:=dm.ADOIN557.fieldbyname('RKEY17').Value;
 form_report2.ADODataSet1.Open;

 form_report2.ppReport1.Reset;
 form_report2.ppReport1.Template.FileName:=
   StringReplace(UpperCase(extractfilepath(paramstr(0))),'EXEC\','NIERP\REPORT\',[rfReplaceAll])+'tijiaoshu.rtm';
 form_report2.ppReport1.Template.LoadFromFile;
 form_report2.ppReport1.SaveAsTemplate:=False;

 form_report2.ppReport1.Print;
 form_report2.Free;
end;

procedure TForm_selin.BitBtn4Click(Sender: TObject);
begin
  try
form_report2:= Tform_report2.Create(application);
form_report2.ppReport1.Reset;
form_report2.ppReport1.Template.FileName :=
  stringReplace(UpperCase(extractfilepath(paramstr(0))),'EXEC\','NIERP\REPORT\',[rfReplaceAll])+
    'tijiaoshu.rtm';
form_report2.ppReport1.Template.LoadFromFile;
form_report2.ppReport1.SaveAsTemplate:=true;
Form_report2.ppdesigner2.ShowModal;
finally
form_report2.Free;
end;
end;

end.
