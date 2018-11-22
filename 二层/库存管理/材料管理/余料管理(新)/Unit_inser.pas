unit Unit_inser;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Menus, Grids, DBGrids,toolwin,comctrls;

type
  TForm_inser = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Edit1: TEdit;
    Label1: TLabel;
    PopupMenu1: TPopupMenu;
    N8: TMenuItem;
    BitBtn3: TBitBtn;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure Edit1Change(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn3KeyPress(Sender: TObject; var Key: Char);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
   field_name :string;
    { Public declarations }
  end;

var
  Form_inser: TForm_inser;


implementation
uses damo,unit_numin,remain_form;

{$R *.dfm}

procedure TForm_inser.BitBtn2Click(Sender: TObject);
begin
edit1.Text:='';
edit1.SetFocus;
end;

procedure TForm_inser.BitBtn1Click(Sender: TObject);
begin
self.Close;

end;

procedure TForm_inser.FormCreate(Sender: TObject);
begin
 field_name:='mat_code';
end;

procedure TForm_inser.N8Click(Sender: TObject);
begin
try
 form_numin:=tform_numin.Create(application);
 with form_numin do
 begin
  edit1.Text:=dm.ADO556MAT_CODE.Value;
  edit2.Text:=dm.ADO556mat_desc.Value;
  edit3.Text:=dm.ADO556LEN_SIZE.AsString;
  edit4.Text:=dm.ADO556WEI_SIZE.AsString;
  edit1.ReadOnly:=true;
  edit2.ReadOnly:=true;
  edit3.ReadOnly:=true;
  edit4.ReadOnly:=true;
 end;
 if form_numin.ShowModal=mrok then
 begin
  if(form_remain.SGrid1.RowCount>=2) and (trim(form_remain.SGrid1.Cells[0,1])<>'')  then
   begin
    form_remain.SGrid1.RowCount:=form_remain.SGrid1.RowCount+1;
    form_remain.SGrid2.RowCount:=form_remain.SGrid2.RowCount+1;
   end;
   
   with form_remain do
   begin
    sgrid1.Cells[0,sgrid1.RowCount-1]:=form_numin.Edit1.Text;
    sgrid1.Cells[1,sgrid1.RowCount-1]:=form_numin.Edit2.Text;
    sgrid1.Cells[2,sgrid1.RowCount-1]:=form_numin.Edit3.Text ;
    sgrid1.Cells[3,sgrid1.RowCount-1]:=form_numin.Edit4.Text ;
    sgrid1.Cells[4,sgrid1.RowCount-1]:=form_numin.Edit5.Text ;
    sgrid2.Cells[0,sgrid1.RowCount-1]:=dm.ADO556rkey.AsString;
   end;
  dm.ADO556.Delete;
 end;
finally
form_numin.Free;
end;
end;

procedure TForm_inser.DBGrid1TitleClick(Column: TColumn);
var
 i:byte;
begin
if (field_name<>column.FieldName) and (column.ReadOnly)  then
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
dm.ADO556.Sort:=column.FieldName;
end;

procedure TForm_inser.Edit1Change(Sender: TObject);
begin
if not dm.ADO556.Filtered then dm.ADO556.Filtered:=true;
 if (trim(Edit1.text)<>'') and
 ((field_name='MAT_CODE') or (field_name='mat_desc') or (field_name='remark') )  then
  dm.ADO556.Filter := field_name+' like ''%'+trim(edit1.text)+'%'''
 else
  if trim(edit1.Text)<>''  then dm.ADO556.Filter :=field_name+'='+trim(edit1.text)
 else  dm.ADO556.filter := '';

end;

procedure TForm_inser.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
IF (ssalt in shift) AND ((KEY=ORD('S')) OR (KEY=ORD('s'))) then showmessage(dm.ADO556.SQL.Text);
end;

procedure TForm_inser.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
 if key=#13 then SELF.N8Click(sender);
end;

procedure TForm_inser.BitBtn3KeyPress(Sender: TObject; var Key: Char);
begin
form_inser.N8Click(sender);
end;

procedure TForm_inser.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
if ((field_name='WEI_SIZE') or (field_name='LEN_SIZE')or (field_name='QUAN_ON_HAND'))then
 if not (key in ['0'..'9',#8,#13]) then abort;
end;

procedure TForm_inser.FormShow(Sender: TObject);
begin
 DBGrid1TitleClick(dbgrid1.Columns.Items[0]);
end;

end.
